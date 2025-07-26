# Anomaly detection Smart Grid Monitoring System

A real-time monitoring system for smart grid stability and anomaly detection using machine learning.

## Features

- **Stability Prediction**: ANN + XGBoost ensemble model
- **Anomaly Detection**: Autoencoder + KMeans clustering
- **Dashboard**: Interactive React frontend
- **Action Logging**: Historical alert tracking
- **Terminology System**: Built-in technical reference

## Quick Start

### Windows Users:
Simply double-click `start_system.bat` to:
1. Set up Python virtual environment
2. Install dependencies
3. Start both backend and frontend servers

Note: First run may take several minutes to install dependencies.

### Manual Setup:
1. **Backend Setup**:
```bash
cd smart-grid-backend
python -m venv venv
source venv/bin/activate  # Linux/Mac
pip install -r requirements.txt
flask run
```

2. **Frontend Setup**:
```bash
cd smart-grid-frontend
npm install
npm start
```

## Documentation

- [System Architecture](documentation/architecture.md)
- [API Reference](documentation/api.md)
- [Model Details](documentation/models.md)
- [Frontend Guide](documentation/frontend.md)
- [Deployment](documentation/deployment.md)
