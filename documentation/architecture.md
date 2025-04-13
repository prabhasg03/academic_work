# Smart Grid Monitoring System Architecture

## Overview
The system provides real-time stability prediction and anomaly detection for smart grids using machine learning models.

## Components

### Backend Services
1. **Model Training**
   - `model.py`: Trains ANN, XGBoost, Autoencoder, and KMeans models
   - Data preprocessing and feature engineering

2. **Prediction Services**
   - `stability.py`: Stability prediction using ANN + XGBoost ensemble
   - `anomaly.py`: Anomaly detection with Autoencoder + KMeans
   - `data_processor.py`: Data validation and preprocessing

3. **Decision Engine**
   - `decision.py`: Rule-based action recommendations
   - Threshold configuration

### Frontend
- React-based dashboard
- Real-time visualization
- Action logging system
- Interactive parameter controls

## Data Flow
1. Frontend sends sensor data to backend APIs
2. Data processed through validation pipelines
3. Models generate predictions
4. Decision engine recommends actions
5. Results visualized in dashboard

![System Architecture Diagram](architecture.png)
