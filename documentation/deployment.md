# Smart Grid Monitoring Deployment Guide

## System Requirements

### Backend
- Python 3.8+
- TensorFlow 2.6+
- XGBoost 1.5+
- scikit-learn 1.0+
- Flask 2.0+

### Frontend
- Node.js 16+
- npm 8+
- React 18+

## Installation

### 1. Backend Setup
```bash
# Clone repository
git clone https://github.com/your-repo/smart-grid-monitoring.git
cd smart-grid-monitoring

# Create virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows

# Install dependencies
pip install -r requirements.txt

# Initialize models
python model.py
```

### 2. Frontend Setup
```bash
cd smart-grid-frontend
npm install
```

## Configuration

### Backend
- Edit `config.py`:
  ```python
  DEBUG = True  # Set to False in production
  MODEL_DIR = "models"  # Model storage location
  ```

### Frontend
- Create `.env`:
  ```
  REACT_APP_API_URL=http://localhost:5000
  ```

## Running the System

1. Start backend:
   ```bash
   flask run
   ```

2. Start frontend (in separate terminal):
   ```bash
   cd smart-grid-frontend
   npm start
   ```

## Production Deployment

### Recommended Stack
- **Backend**: Gunicorn + Nginx
- **Frontend**: Nginx static hosting
- **Database**: PostgreSQL (for action logging)

### Environment Variables
| Variable | Description | Example |
|----------|-------------|---------|
| `FLASK_ENV` | Runtime environment | `production` |
| `SECRET_KEY` | Encryption key | Random string |
| `DATABASE_URL` | Database connection | `postgresql://user:pass@localhost/db` |

## Troubleshooting

### Common Issues
1. **Models fail to load**:
   - Verify `models/` directory exists
   - Check file permissions
   - Run `model.py` to regenerate

2. **CORS errors**:
   - Ensure frontend URL is whitelisted in backend
   - Verify `REACT_APP_API_URL` matches backend

3. **Performance problems**:
   - Enable GPU acceleration for TensorFlow
   - Increase XGBoost nthreads
