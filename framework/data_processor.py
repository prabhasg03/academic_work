import numpy as np
import pandas as pd
from sklearn.preprocessing import StandardScaler, MinMaxScaler
from imblearn.over_sampling import BorderlineSMOTE
import joblib

class DataPreprocessor:
    def __init__(self):
        self.stability_scaler = None
        self.anomaly_scaler = None
        self.load_scalers()
        
    def load_scalers(self):
        try:
            self.stability_scaler = joblib.load("models/stability_scaler.pkl")
            self.anomaly_scaler = joblib.load("models/anomaly_scaler.pkl")
        except:
            # Initialize new scalers if loading fails
            self.stability_scaler = StandardScaler()
            self.anomaly_scaler = MinMaxScaler()
            
    def process_stability_data(self, raw_data):
        """Process stability prediction data"""
        if isinstance(raw_data, dict):
            features = np.array([[
                raw_data['tau1'], raw_data['tau2'], raw_data['tau3'], raw_data['tau4'],
                raw_data['p1'], raw_data['p2'], raw_data['p3'], raw_data['p4'],
                raw_data['g1'], raw_data['g2'], raw_data['g3'], raw_data['g4'],
                raw_data['stab']
            ]])
        else:
            features = np.array(raw_data)
            
        if features.shape[1] != 13:
            raise ValueError(f"Expected 13 features for stability, got {features.shape[1]}")
            
        return self.stability_scaler.transform(features)
    
    def process_anomaly_data(self, raw_data):
        """Process anomaly detection data from classData.csv"""
        if isinstance(raw_data, dict):
            features = np.array([[
                raw_data['G'], raw_data['C'], raw_data['B'], raw_data['A'],
                raw_data['Ia'], raw_data['Ib'], raw_data['Ic'],
                raw_data['Va'], raw_data['Vb'], raw_data['Vc']
            ]])
        else:
            features = np.array(raw_data)
            
        if features.shape[1] != 10:
            raise ValueError(f"Expected 10 features for anomaly, got {features.shape[1]}")

            
        return self.anomaly_scaler.transform(features)
    
    def prepare_training_data(self):
        """Prepare both stability and anomaly training data"""
        # Load stability data
        stability_df = pd.read_csv("smart_grid_stability_augmented.csv")
        X_stab = stability_df.drop(columns=["stabf"])
        y_stab = stability_df["stabf"].map({"stable": 1, "unstable": 0})
        
        # Apply SMOTE for class balancing
        smote = BorderlineSMOTE(random_state=42)
        X_stab_resampled, y_stab_resampled = smote.fit_resample(X_stab, y_stab)
        
        # Scale stability features
        X_stab_scaled = self.stability_scaler.fit_transform(X_stab_resampled)
        
        # Load anomaly data (using normal operation data only)
        anomaly_df = pd.read_csv("classData.csv")
        X_anom = anomaly_df  # Using all data as "normal" for training
        
        # Scale anomaly features
        X_anom_scaled = self.anomaly_scaler.fit_transform(X_anom)
        
        return {
            "stability": (X_stab_scaled, y_stab_resampled),
            "anomaly": X_anom_scaled
        }
