import os
import tensorflow as tf
import xgboost as xgb
from sklearn.model_selection import train_test_split
import joblib

class StabilityPredictor:
    def __init__(self):
        self.ann_model = None
        self.xgb_model = None
        self.load_models()
        
    def load_models(self):
        try:
            if not os.path.exists("models"):
                os.makedirs("models")
            
            ann_path = "models/stability_ann.keras"
            if os.path.exists(ann_path):
                self.ann_model = tf.keras.models.load_model(ann_path)
            else:
                print("ANN model not found. Please train the model first.")    
       
            xgb_path = "models/stability_xgb.pkl"
            if os.path.exists(xgb_path):
                self.xgb_model = joblib.load(xgb_path)
            else:
                print("XGBoost model not found. Please train the model first.")      
        except Exception as e:
            print(f"Error loading stability models: {e}")
            
    def predict(self, processed_data):
        """Make predictions using both ANN and XGBoost"""
        # ANN prediction
        ann_pred = self.ann_model.predict(processed_data)
        ann_conf = ann_pred.flatten()[0]
        
        # XGBoost prediction
        xgb_pred = self.xgb_model.predict(processed_data)
        xgb_conf = self.xgb_model.predict_proba(processed_data)[:, 1][0]
        
        # Ensure processed_data has the correct number of features
        if processed_data.shape[1] != 10:
            raise ValueError(f"Expected 10 features for anomaly detection, got {processed_data.shape[1]}")

        
        # Ensemble result (simple average)
        final_pred = "stable" if (ann_conf + xgb_conf) / 2 > 0.5 else "unstable"
        
        return {
            "prediction": final_pred,
            "confidence": float((ann_conf + xgb_conf) / 2),
            "ann_confidence": float(ann_conf),
            "xgb_confidence": float(xgb_conf)
        }
    
    def retrain(self, new_data):
        """Retrain models with new data"""
        # This would implement online learning or periodic retraining
        pass
