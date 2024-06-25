import pandas as pd
from datetime import datetime
import os
from flask import Flask, render_template, jsonify
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
import numpy as np
import serial
from apscheduler.schedulers.background import BackgroundScheduler

app = Flask(__name__)

# Configuration
CSV_FILE = 'sensor_data.csv'

# Global variable for serial connection
ser = None

def initialize_serial():
    global ser
    if ser is None:
        try:
            ser = serial.Serial("COM3", 9600, timeout=1)
            print("Serial connection initialized successfully.")
        except serial.SerialException as se:
            print(f"Serial communication error: {se}")
        except Exception as e:
            print(f"Unexpected error initializing serial: {e}")

def fetch_current_data():
    global ser
    try:
        if ser is None or not ser.is_open:
            initialize_serial()  # Initialize serial connection if not already initialized
        
        if ser is not None and ser.is_open:
            response = ser.readline().decode('utf-8').strip()
            if response == '':
                print("Empty response received from serial.")
                return None
            else:
                # Assuming response format: "AQI CO SMOKE TEMP HUMIDITY"
                data = response.split()
                if len(data) != 5:
                    print(f"Unexpected response format: {response}")
                    return None

                aqi = float(data[0])
                co = float(data[1])
                smoke = float(data[2])
                temperature = float(data[3])
                humidity = float(data[4])

                log_current_data(aqi, co, smoke, temperature, humidity)
                return {
                    'air_quality': aqi,
                    'co': co,
                    'smoke': smoke,
                    'temperature': temperature,
                    'humidity': humidity
                }
        else:
            print("Serial port is not open or initialized.")
            return None
    except serial.SerialException as se:
        print(f"Serial communication error: {se}")
        return None
    except ValueError as ve:
        print(f"Error converting response to float: {ve}")
        return None
    except Exception as e:
        print(f"Unexpected error fetching data from serial: {e}")
        return None

def log_current_data(aqi, co, smoke, temperature, humidity):
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    
    new_data = {
        'timestamp': [timestamp],
        'air_quality': [aqi],
        'co': [co],
        'smoke': [smoke],
        'temperature': [temperature],
        'humidity': [humidity]
    }
    
    # Print the data to debug console
    print(f"Logging Data: Timestamp={timestamp}, AQI={aqi}, CO={co}, Smoke={smoke}, Temperature={temperature}, Humidity={humidity}")
    
    # Convert new_data to DataFrame
    new_df = pd.DataFrame(new_data)
    
    # Load existing data or create new DataFrame
    if os.path.exists(CSV_FILE):
        df = pd.read_csv(CSV_FILE, parse_dates=['timestamp'])
    else:
        df = pd.DataFrame(columns=['timestamp', 'air_quality', 'co', 'smoke', 'temperature', 'humidity'])
    
    # Append new_data to DataFrame
    df = pd.concat([df, new_df], ignore_index=True)
    
    # Save to CSV file
    df.to_csv(CSV_FILE, index=False)
    
    # Calculate averages for every 10 minutes and save again
    if not df.empty:
        df['timestamp'] = pd.to_datetime(df['timestamp'])  # Convert timestamp column to datetime
        df.set_index('timestamp', inplace=True)
        df_resampled = df.resample('10T').mean().dropna().reset_index()
        df_resampled.to_csv(CSV_FILE, index=False)
    else:
        print("DataFrame is empty after appending data.")

def fetch_past_data():
    try:
        if os.path.exists(CSV_FILE):
            df = pd.read_csv(CSV_FILE, parse_dates=['timestamp'])
            if not df.empty:
                insights = {
                    'max_air_quality': df['air_quality'].max(),
                    'min_air_quality': df['air_quality'].min(),
                    'avg_air_quality': df['air_quality'].mean(),
                    'max_co': df['co'].max(),
                    'min_co': df['co'].min(),
                    'avg_co': df['co'].mean(),
                    'max_smoke': df['smoke'].max(),
                    'min_smoke': df['smoke'].min(),
                    'avg_smoke': df['smoke'].mean(),
                    'max_temperature': df['temperature'].max(),
                    'min_temperature': df['temperature'].min(),
                    'avg_temperature': df['temperature'].mean(),
                    'max_humidity': df['humidity'].max(),
                    'min_humidity': df['humidity'].min(),
                    'avg_humidity': df['humidity'].mean()
                }
                return df, insights
        return pd.DataFrame(), {}
    except pd.errors.EmptyDataError:
        print(f"EmptyDataError: No columns to parse from file {CSV_FILE}")
        return pd.DataFrame(), {}
    except Exception as e:
        print(f"Error fetching past data: {e}")
        return pd.DataFrame(), {}

def fetch_current_weather():
    try:
        data = pd.read_csv(CSV_FILE)
        temperature = data['temperature'].iloc[-1]
        humidity = data['humidity'].iloc[-1]
        return temperature, humidity
    except Exception as e:
        print(f"Error fetching weather data: {e}")
        return None, None

def predict_future_data():
    try:
        if os.path.exists(CSV_FILE):
            df = pd.read_csv(CSV_FILE, parse_dates=['timestamp'])
            if not df.empty:
                X = df[['temperature', 'humidity']].values
                y = df['air_quality'].values
                X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
                model = RandomForestRegressor(n_estimators=100, random_state=42)
                model.fit(X_train, y_train)
                
                next_temperature, next_humidity = fetch_current_weather()
                if next_temperature is not None and next_humidity is not None:
                    next_data = np.array([[next_temperature, next_humidity]])
                    predicted_air_quality = model.predict(next_data)[0]
                    
                    # Calculate R^2 score
                    r2 = model.score(X_test, y_test)
                    # Convert R^2 score to percentage accuracy
                    accuracy_percentage = max(0, (r2 + 1) * 50)  # Scale to 0% to 100%
                    
                    # Generate suggestions based on AQI, temperature, humidity
                    suggestions = generate_suggestions(predicted_air_quality, next_temperature, next_humidity)

                    return {
                        'predicted_air_quality': predicted_air_quality,
                        'predicted_temperature': next_temperature,
                        'predicted_humidity': next_humidity,
                        'accuracy': accuracy_percentage,
                        'suggestions': suggestions
                    }
        print("No data available for predicting future.")
        return {}
    except Exception as e:
        print(f"Error predicting future data: {e}")
        return {}

def generate_suggestions(predicted_aqi, predicted_temperature, predicted_humidity):
    suggestions = []
    # Example suggestions based on thresholds (customize based on your requirements)
    if predicted_aqi > 100:
        suggestions.append("Air quality is poor. Avoid outdoor activities.")
    elif predicted_aqi > 50:
        suggestions.append("Air quality is moderate. Consider reducing outdoor activities.")
    else:
        suggestions.append("Air quality is good. Enjoy outdoor activities.")

    if predicted_temperature > 30:
        suggestions.append("It will be hot. Stay hydrated and avoid prolonged sun exposure.")
    elif predicted_temperature < 10:
        suggestions.append("It will be cold. Dress warmly and stay indoors if possible.")

    if predicted_humidity > 80:
        suggestions.append("High humidity expected. Be prepared for muggy conditions.")
    elif predicted_humidity < 30:
        suggestions.append("Low humidity expected. Stay hydrated and moisturize skin.")
    return suggestions

# Routes
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/current_data')
def current_data_route():
    if os.path.exists(CSV_FILE):
        df = pd.read_csv(CSV_FILE, parse_dates=['timestamp'])
        if not df.empty:
            current_data = df.iloc[-1].to_dict()
            return jsonify(current_data)
    
    default_data = {'timestamp': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                    'air_quality': 'N/A', 'co': 'N/A', 'smoke': 'N/A', 'temperature': 'N/A', 'humidity': 'N/A'}
    return jsonify(default_data)

@app.route('/present')
def present():
    if os.path.exists(CSV_FILE):
        df = pd.read_csv(CSV_FILE, parse_dates=['timestamp'])
        if not df.empty:
            # Fetch the latest data
            current_data = df.iloc[-1].to_dict()
            
            # Format air_quality, co, smoke to 2 decimal places if they exist
            if not pd.isnull(current_data.get('air_quality')):
                current_data['air_quality'] = f"{current_data['air_quality']:.2f}"
            if not pd.isnull(current_data.get('co')):
                current_data['co'] = f"{current_data['co']}"
            if not pd.isnull(current_data.get('smoke')):
                current_data['smoke'] = f"{current_data['smoke']}"
            if not pd.isnull(current_data.get('temperature')):
                current_data['temperature'] = f"{current_data['temperature']:.2f}"
            if not pd.isnull(current_data.get('humidity')):
                current_data['humidity'] = f"{current_data['humidity']:.2f}"

            return render_template('present.html', data=current_data)
    
    # If no data is available, return default values
    return render_template('present.html', data={
        'air_quality': 'N/A',
        'co': 'N/A',
        'smoke': 'N/A',
        'temperature': 'N/A',
        'humidity': 'N/A'
    })

@app.route('/past')
def past():
    df, insights = fetch_past_data()
    if not df.empty:
        # Convert timestamps to string for display
        df['timestamp'] = df['timestamp'].dt.strftime('%Y-%m-%d %H:%M:%S')
        # Prepare data for charts in the past.html
        timestamps = df['timestamp'].tolist()
        air_quality = df['air_quality'].tolist()
        co = df['co'].tolist()
        smoke = df['smoke'].tolist()
        temperature = df['temperature'].tolist()
        humidity = df['humidity'].tolist()

        # Prepare insights
        if insights:
            insights_formatted = {
                'max_air_quality': insights['max_air_quality'],
                'min_air_quality': insights['min_air_quality'],
                'avg_air_quality': insights['avg_air_quality'],
                'max_co': insights['max_co'],
                'min_co': insights['min_co'],
                'avg_co': insights['avg_co'],
                'max_smoke': insights['max_smoke'],
                'min_smoke': insights['min_smoke'],
                'avg_smoke': insights['avg_smoke'],
                'max_temperature': insights['max_temperature'],
                'min_temperature': insights['min_temperature'],
                'avg_temperature': insights['avg_temperature'],
                'max_humidity': insights['max_humidity'],
                'min_humidity': insights['min_humidity'],
                'avg_humidity': insights['avg_humidity']
            }
        else:
            insights_formatted = {}

        return render_template('past.html', timestamps=timestamps, air_quality=air_quality,
                               co=co, smoke=smoke, temperature=temperature, humidity=humidity, insights=insights_formatted)
    
    # If no data is available, render the template with empty lists/dictionaries
    return render_template('past.html', timestamps=[], air_quality=[], co=[], smoke=[], temperature=[], humidity=[], insights={})

@app.route('/future')
def future():
    future_data = predict_future_data()
    print("Future data:", future_data)  # Check what's being returned
    return render_template('future.html', data=future_data)

if __name__ == '__main__':
    # Configure and start scheduler
    scheduler = BackgroundScheduler()
    scheduler.add_job(fetch_current_data, 'interval', seconds=5)  # Run every 10 seconds
    scheduler.start()
    app.run(debug=True)
