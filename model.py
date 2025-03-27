import os
import pandas as pd
import numpy as np
import tensorflow as tf
import xgboost as xgb
from sklearn.model_selection import train_test_split
from sklearn.cluster import KMeans
from imblearn.over_sampling import BorderlineSMOTE
from sklearn.preprocessing import StandardScaler, MinMaxScaler
import joblib
from cryptography.fernet import Fernet

# Configuration
MODEL_DIR = "models"
os.makedirs(MODEL_DIR, exist_ok=True)

# Define the exact 20 features we expect (10 original + 10 derivatives)
ANOMALY_FEATURES = [
    'G', 'C', 'B', 'A',
    'Ia', 'Ib', 'Ic',
    'Va', 'Vb', 'Vc',
    'dG', 'dC', 'dB', 'dA',
    'dIa', 'dIb', 'dIc',
    'dVa', 'dVb', 'dVc'
]

def load_and_preprocess_data():
    """Load and preprocess both datasets with proper paths"""
    try:
        # Load stability data
        stab_df = pd.read_csv("smart_grid_stability_augmented.csv")
        X_stab = stab_df.drop(columns=["stabf"])
        y_stab = stab_df["stabf"].map({"stable": 1, "unstable": 0})
        
        # Balance stability classes
        smote = BorderlineSMOTE(random_state=42)
        X_stab, y_stab = smote.fit_resample(X_stab, y_stab)
        
        # Load and prepare anomaly data
        anom_df = pd.read_csv("classData.csv")
        X_anom = prepare_anomaly_data(anom_df)
        print(X_anom)
        return X_stab, y_stab, X_anom
    
    except Exception as e:
        print(f"\nError loading data: {e}")
        print("Please ensure these files exist in the same directory:")
        print("- smart_grid_stability_augmented.csv")
        print("- classData.csv")
        raise

def prepare_anomaly_data(df):
    """Prepare anomaly data with exactly 20 features"""
    # Calculate derivatives for all base features
    for col in ['G', 'C', 'B', 'A', 'Ia', 'Ib', 'Ic', 'Va', 'Vb', 'Vc']:
        df[f'd{col}'] = df[col].diff().fillna(0)
    # Ensure we have exactly the 20 expected features
    for feature in ANOMALY_FEATURES:
        if feature not in df.columns:
            df[feature] = 0
    return df[ANOMALY_FEATURES]

def train_stability_models(X_stab, y_stab):
    """Train and save stability prediction models"""
    # Split data into train/validation/test
    X_train, X_test, y_train, y_test = train_test_split(
        X_stab, y_stab, test_size=0.2, random_state=42)
    X_train, X_val, y_train, y_val = train_test_split(
        X_train, y_train, test_size=0.2, random_state=42)
    
    # Scale features
    scaler = StandardScaler()
    X_train_scaled = scaler.fit_transform(X_train)
    X_val_scaled = scaler.transform(X_val)
    X_test_scaled = scaler.transform(X_test)
    joblib.dump(scaler, f"{MODEL_DIR}/stability_scaler.pkl")
    
    # ANN Model with improved architecture
    ann_model = tf.keras.Sequential([
        tf.keras.layers.Dense(128, activation='relu', input_shape=(X_train_scaled.shape[1],)),
        tf.keras.layers.BatchNormalization(),
        tf.keras.layers.Dropout(0.3),
        tf.keras.layers.Dense(64, activation='relu'),
        tf.keras.layers.Dense(1, activation='sigmoid')
    ])
    
    # Add learning rate scheduling
    lr_schedule = tf.keras.optimizers.schedules.ExponentialDecay(
        initial_learning_rate=0.001,
        decay_steps=10000,
        decay_rate=0.9)
    
    ann_model.compile(
        optimizer=tf.keras.optimizers.Adam(learning_rate=lr_schedule),
        loss='binary_crossentropy',
        metrics=['accuracy', tf.keras.metrics.AUC()]
    )
    
    # Add early stopping
    early_stopping = tf.keras.callbacks.EarlyStopping(
        monitor='val_loss',
        patience=5,
        restore_best_weights=True)
    
    # Train the model
    history = ann_model.fit(
        X_train_scaled, y_train,
        epochs=50,
        batch_size=32,
        validation_data=(X_val_scaled, y_val),
        callbacks=[early_stopping],
        verbose=1
    )
    ann_model.save(f"{MODEL_DIR}/stability_ann.keras")
    
    # XGBoost Model with proper validation
    xgb_model = xgb.XGBClassifier(
        objective="binary:logistic",
        n_estimators=200,
        max_depth=6,
        learning_rate=0.01,
        subsample=0.8,
        colsample_bytree=0.8,
        eval_metric='logloss'
    )
    
    xgb_model.fit(
        X_train_scaled, y_train,
        eval_set=[(X_val_scaled, y_val)],
        verbose=1
    )
    joblib.dump(xgb_model, f"{MODEL_DIR}/stability_xgb.pkl")
    
    # Evaluate final performance
    print("\nFinal ANN Validation Accuracy:", max(history.history['val_accuracy']))
    print("Final XGBoost Validation Accuracy:", 
          xgb_model.score(X_val_scaled, y_val))

def train_anomaly_detector(X_anom):
    """Train and save anomaly detection models"""
    # Split data
    X_train, X_test = train_test_split(X_anom, test_size=0.2, random_state=42)
    X_train, X_val = train_test_split(X_train, test_size=0.2, random_state=42)
    
    # Scale features
    scaler = MinMaxScaler()
    X_train_scaled = scaler.fit_transform(X_train)
    X_val_scaled = scaler.transform(X_val)
    X_test_scaled = scaler.transform(X_test)
    joblib.dump(scaler, f"{MODEL_DIR}/anomaly_scaler.pkl")
    
    # Autoencoder with early stopping
    input_dim = X_train_scaled.shape[1]
    encoding_dim = 7
    
    autoencoder = tf.keras.Sequential([
        tf.keras.layers.Dense(encoding_dim, activation='relu', input_shape=(input_dim,)),
        tf.keras.layers.Dense(input_dim, activation='linear')
    ])
    
    autoencoder.compile(optimizer='adam', loss='mse')
    
    early_stopping = tf.keras.callbacks.EarlyStopping(
        monitor='val_loss',
        patience=5,
        restore_best_weights=True)
    
    autoencoder.fit(
        X_train_scaled, X_train_scaled,
        epochs=100,
        batch_size=32,
        validation_data=(X_val_scaled, X_val_scaled),
        callbacks=[early_stopping],
        verbose=1
    )
    autoencoder.save(f"{MODEL_DIR}/anomaly_detector.keras")
    
    # KMeans Clustering
    kmeans = KMeans(n_clusters=5, random_state=42)
    kmeans.fit(X_train_scaled)
    joblib.dump(kmeans, f"{MODEL_DIR}/kmeans.pkl")
    
    # Generate encryption key
    key = Fernet.generate_key()
    with open(f"{MODEL_DIR}/encryption_key.key", "wb") as key_file:
        key_file.write(key)

if __name__ == "__main__":
    print("Loading and preprocessing data...")
    try:
        X_stab, y_stab, X_anom = load_and_preprocess_data()
        print(f"Stability data shape: {X_stab.shape}")
        print(f"Anomaly data shape: {X_anom.shape} (should be 20 features)")
        
        print("\nTraining stability models...")
        train_stability_models(X_stab, y_stab)
        
        print("\nTraining anomaly detection models...")
        train_anomaly_detector(X_anom)
        
        print("\nAll models trained and saved successfully!")
    except Exception as e:
        print(f"\nFailed to train models: {e}")
        print("Possible solutions:")
        print("1. Ensure both CSV files exist in the directory")
        print("2. Delete old models if changing feature dimensions")
        print("3. Check for data quality issues")