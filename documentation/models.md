# Smart Grid Monitoring Models Documentation

## 1. Stability Prediction Models

### ANN Architecture
- **Type**: 3-layer fully connected network
- **Input Layer**: 13 nodes (matching input features)
- **Hidden Layer**: 64 nodes (ReLU activation)
- **Output Layer**: 1 node (Sigmoid activation)
- **Loss**: Binary crossentropy
- **Optimizer**: Adam (learning rate=0.001)

### XGBoost Model
- **Objective**: binary:logistic
- **Max Depth**: 6
- **Learning Rate**: 0.1
- **N_estimators**: 100
- **Subsample**: 0.8
- **Colsample_bytree**: 0.8

### Ensemble Approach
- Predictions averaged with weights:
  - ANN: 50%
  - XGBoost: 50%
- Final threshold: 0.5

## 2. Anomaly Detection Models

### Autoencoder
- **Encoder**: 
  - Input: 10 nodes
  - Hidden: 8 nodes (ReLU)
  - Latent: 3 nodes
- **Decoder**: 
  - Latent: 3 nodes
  - Hidden: 8 nodes (ReLU)
  - Output: 10 nodes (Linear)
- **Loss**: Mean squared error
- **Optimizer**: Adam (learning rate=0.001)

### KMeans Clustering
- **Clusters**: 5
- **Distance Metric**: Euclidean
- **Max Iterations**: 300

### Anomaly Scoring
- **Formula**: 0.7*MSE + 0.3*ClusterDistance
- **Threshold**: 0.5 (configurable)

## Feature Engineering

### Stability Features
- 12 raw parameters (τ1-4, p1-4, g1-4)
- 1 calculated stability metric

### Anomaly Features
- 10 raw parameters (G,C,B,A,Ia-c,Va-c)
- 10 calculated derivatives (dG, dC, etc.)

## Training Process
1. Data preprocessing (scaling, normalization)
2. Class balancing (SMOTE for stability data)
3. 80/20 train-test split
4. Early stopping (patience=10)
5. Model persistence (Keras, joblib)
