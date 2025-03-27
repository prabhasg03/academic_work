import pandas as pd
import numpy as np
import tensorflow as tf
import joblib
from cryptography.fernet import Fernet

# Must exactly match what was used in training
ANOMALY_FEATURES = [
    'G', 'C', 'B', 'A',
    'Ia', 'Ib', 'Ic',
    'Va', 'Vb', 'Vc'
]

class AnomalyDetector:
    def __init__(self):
        self.autoencoder = None
        self.kmeans = None
        self.scaler = None
        self.encryption_key = None
        self.threshold = 0.5
        self.load_models()
    
    def load_models(self):
        """Load all required models"""
        try:
            self.autoencoder = tf.keras.models.load_model("models/anomaly_detector.keras")
            self.kmeans = joblib.load("models/kmeans.pkl")
            self.scaler = joblib.load("models/anomaly_scaler.pkl")
            with open("models/encryption_key.key", "rb") as f:
                self.encryption_key = f.read()
            print("Anomaly detection models loaded successfully")
            print(f"Expecting {len(ANOMALY_FEATURES)} features in order:")
            print(ANOMALY_FEATURES)
        except Exception as e:
            print(f"Error loading models: {e}")
            raise

    def prepare_input(self, data):
        """Convert input to exactly 10 features in correct order"""
        if isinstance(data, dict):
            df = pd.DataFrame([data])
        else:
            df = pd.DataFrame(data)
        
        # Calculate same derivatives as during training
        for col in ['G', 'C', 'B', 'A', 'Ia', 'Ib', 'Ic', 'Va', 'Vb', 'Vc']:
            if col in df.columns:
                df[f'd{col}'] = df[col].diff().fillna(0)
        
        # Add missing features with zeros
        for feature in ANOMALY_FEATURES:
            if feature not in df.columns:
                df[feature] = 0
        
        # Return exactly the 10 features in correct order
        return df[ANOMALY_FEATURES].values

    def detect(self, data):
        """Detect anomalies with consistent feature handling"""
        try:
            # Prepare input (will create exactly 10 features)
            X = self.prepare_input(data)
            X_scaled = self.scaler.transform(X)
            
            # Get predictions
            reconstructions = self.autoencoder.predict(X_scaled)
            mse = np.mean(np.power(X_scaled - reconstructions, 2), axis=1)
            distances = self.kmeans.transform(X_scaled)
            min_dist = np.min(distances, axis=1)
            score = 0.7*mse + 0.3*min_dist
            
            return {
                'is_anomaly': bool(score > self.threshold),
                'score': float(score[0]),
                'reconstruction_error': float(mse[0]),
                'cluster_distance': float(min_dist[0]),
                'threshold': self.threshold,
                'status': 'success'
            }
        except Exception as e:
            return {'error': str(e), 'status': 'failed'}

    def encrypt(self, data):
        """Encrypt sensitive data"""
        if not self.encryption_key:
            raise ValueError("Encryption key not loaded")
        cipher_suite = Fernet(self.encryption_key)
        return cipher_suite.encrypt(data.encode()).decode()

    def decrypt(self, encrypted_data):
        """Decrypt data"""
        if not self.encryption_key:
            raise ValueError("Encryption key not loaded")
        cipher_suite = Fernet(self.encryption_key)
        return cipher_suite.decrypt(encrypted_data.encode()).decode()
