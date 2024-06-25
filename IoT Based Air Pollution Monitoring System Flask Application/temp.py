import pandas as pd
from datetime import datetime, timedelta
import random

# Define the start and end datetime for generating data
start_datetime = datetime.now().replace(hour=0, minute=0, second=0, microsecond=0)
end_datetime = start_datetime + timedelta(days=1)

# Generate timestamps with 30-minute intervals
timestamps = pd.date_range(start=start_datetime, end=end_datetime, freq='30T')

# Generate sample data for air quality, temperature, and humidity
data = {
    'timestamp': timestamps,
    'air_quality': [random.randint(0, 100) for _ in range(len(timestamps))],
    'temperature': [round(random.uniform(10, 30), 2) for _ in range(len(timestamps))],
    'humidity': [round(random.uniform(40, 80), 2) for _ in range(len(timestamps))]
}

# Create a DataFrame
df = pd.DataFrame(data)

# Save to CSV file
csv_file = 'sample_sensor_data.csv'
df.to_csv(csv_file, index=False)

print(f"Sample CSV file '{csv_file}' generated with {len(df)} data points.")
