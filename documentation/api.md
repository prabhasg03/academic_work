# Smart Grid Monitoring API Documentation

## Base URL
`http://localhost:5000`

## Endpoints

### 1. System Status
**GET** `/system-status`

**Response:**
```json
{
  "models_loaded": true,
  "stability_features": 13,
  "anomaly_features": 10,
  "version": "1.0.0"
}
```

### 2. Stability Prediction
**POST** `/predict-stability`

**Request Body:**
```json
{
  "tau1": 1.0,
  "tau2": 2.0,
  "tau3": 1.0,
  "tau4": 2.0,
  "p1": 1.0,
  "p2": 1.0,
  "p3": 1.0,
  "p4": 1.0,
  "g1": 1.0,
  "g2": 1.0,
  "g3": 1.0,
  "g4": 1.0,
  "stab": 0.0
}
```

**Response:**
```json
{
  "prediction": "stable",
  "confidence": 0.85,
  "ann_confidence": 0.82,
  "xgb_confidence": 0.88
}
```

### 3. Anomaly Detection
**POST** `/detect-anomaly`

**Request Body:**
```json
{
  "G": 1.0,
  "C": 2.0,
  "B": 3.0,
  "A": 4.0,
  "Ia": 1.0,
  "Ib": 2.0,
  "Ic": 3.0,
  "Va": 4.0,
  "Vb": 1.0,
  "Vc": 2.0
}
```

**Response:**
```json
{
  "is_anomaly": false,
  "score": 0.32,
  "reconstruction_error": 0.25,
  "cluster_distance": 0.42,
  "threshold": 0.5
}
```

## Error Responses
**400 Bad Request** - Invalid input data
```json
{
  "error": "Expected 13 features for stability, got 12"
}
```

**500 Server Error** - Model loading failed
```json
{
  "error": "Failed to load anomaly detection models"
}
