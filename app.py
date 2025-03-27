import os
import numpy as np
import pandas as pd
import tensorflow as tf
from flask import Flask, request, jsonify
from sklearn.preprocessing import StandardScaler, MinMaxScaler
import joblib
from cryptography.fernet import Fernet
from flask import Flask, request, jsonify
from flask_cors import CORS  # Add this import

# Initialize Flask app
app = Flask(__name__)

# Configure CORS
CORS(app, resources={
    r"/predict-stability": {
        "origins": ["http://localhost:3000"],
        "methods": ["POST", "OPTIONS"],
        "allow_headers": ["Content-Type"]
    },
    r"/detect-anomaly": {
        "origins": ["http://localhost:3000"],
        "methods": ["POST", "OPTIONS"],
        "allow_headers": ["Content-Type"]
    },
    r"/system-status": {
        "origins": ["http://localhost:3000"],
        "methods": ["GET", "OPTIONS"]
    }
})

# Configuration
MODEL_DIR = "models"
STABILITY_FEATURES = [
    "tau1", "tau2", "tau3", "tau4",
    "p1", "p2", "p3", "p4",
    "g1", "g2", "g3", "g4",
    "stab"
]
ANOMALY_FEATURES = [
    'G', 'C', 'B', 'A',
    'Ia', 'Ib', 'Ic',
    'Va', 'Vb', 'Vc',
]

# Load models and scalers
def load_models():
    """Load all required models and scalers"""
    models = {
        'stability': {
            'ann': tf.keras.models.load_model(f"{MODEL_DIR}/stability_ann.keras"),
            'xgb': joblib.load(f"{MODEL_DIR}/stability_xgb.pkl"),
            'scaler': joblib.load(f"{MODEL_DIR}/stability_scaler.pkl")
        },
        'anomaly': {
            'autoencoder': tf.keras.models.load_model(f"{MODEL_DIR}/anomaly_detector.keras"),
            'kmeans': joblib.load(f"{MODEL_DIR}/kmeans.pkl"),
            'scaler': joblib.load(f"{MODEL_DIR}/anomaly_scaler.pkl"),
            'encryption_key': open(f"{MODEL_DIR}/encryption_key.key", "rb").read()
        }
    }
    return models

try:
    models = load_models()
    print("All models loaded successfully")
except Exception as e:
    print(f"Error loading models: {e}")
    models = None

@app.route("/")
def home():
    return "Smart Grid Cybersecurity Framework is running!"

@app.route('/predict-stability', methods=['POST'])
def predict_stability():
    """Predict grid stability"""
    if models is None:
        return jsonify({"error": "Models not loaded"}), 503
        
    try:
        data = request.get_json()
        
        # Validate input features
        missing = [f for f in STABILITY_FEATURES if f not in data]
        if missing:
            return jsonify({
                "error": f"Missing required features: {missing}",
                "required_features": STABILITY_FEATURES,
                "received_features": list(data.keys())
            }), 400

        # Prepare input
        features = np.array([[data[f] for f in STABILITY_FEATURES]])
        scaled = models['stability']['scaler'].transform(features)
        
        # Get predictions
        ann_pred = models['stability']['ann'].predict(scaled)[0][0]
        xgb_pred = models['stability']['xgb'].predict_proba(scaled)[0][1]
        confidence = (float(ann_pred) + float(xgb_pred)) / 2
        
        return jsonify({
            "prediction": "stable" if confidence > 0.5 else "unstable",
            "confidence": confidence,
            "ann_confidence": float(ann_pred),
            "xgb_confidence": float(xgb_pred),
            "status": "success"
        })
        
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/detect-anomaly', methods=['POST', 'OPTIONS'])
def detect_anomaly():
    if request.method == 'OPTIONS':
        return jsonify({'status': 'ok'}), 200
        
    if not models:
        return jsonify({"error": "Models not loaded"}), 503
        
    try:
        data = request.get_json()
        base_features = ['G', 'C', 'B', 'A', 'Ia', 'Ib', 'Ic', 'Va', 'Vb', 'Vc']
        
        # Validate input
        missing = [f for f in base_features if f not in data]
        if missing:
            return jsonify({
                "error": f"Missing features: {missing}",
                "required": base_features
            }), 400

        # Create feature vector with derivatives
        features = []
        for f in base_features:
            features.append(float(data[f]))
            features.append(0.0)  # Derivative initialized to 0
        
        # Scale and predict
        scaled = models['anomaly']['scaler'].transform([features])
        reconstructions = models['anomaly']['autoencoder'].predict(scaled)
        mse = np.mean(np.power(scaled - reconstructions, 2), axis=1)
        distances = models['anomaly']['kmeans'].transform(scaled)
        min_dist = np.min(distances, axis=1)
        score = 0.7*mse + 0.3*min_dist
        
        # Encrypt voltage
        cipher = Fernet(models['anomaly']['encryption_key'])
        encrypted = cipher.encrypt(str(data['Va']).encode()).decode()
        
        return jsonify({
            "is_anomaly": bool(score > 0.5),
            "score": float(score[0]),
            "reconstruction_error": float(mse[0]),
            "cluster_distance": float(min_dist[0]),
            "encrypted_voltage": encrypted,
            "status": "success"
        })
        
    except Exception as e:
        return jsonify({"error": str(e)}), 500
        
@app.route('/system-status', methods=['GET'])
def system_status():
    return jsonify({
            "models_loaded": bool(models),
            "stability_features": len(STABILITY_FEATURES),
            "anomaly_features": len(ANOMALY_FEATURES),
            "status": "operational"
        })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)