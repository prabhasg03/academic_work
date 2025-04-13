# Smart Grid Frontend Documentation

## Core Components

### 1. Dashboard Layout
- **Header**: System title and status indicators
- **Input Sections**: Stability and anomaly parameter controls
- **Results Panel**: Prediction visualizations
- **Action Log**: Historical system alerts

### 2. Key Features
- **Interactive Controls**:
  - Real-time parameter adjustment
  - Form validation
  - Loading states
- **Terminology System**:
  - Hover tooltips
  - Reference section
  - 50+ defined terms
- **Visual Feedback**:
  - Color-coded results
  - Severity indicators
  - Threshold comparisons

## State Management

### Redux Store Structure
```javascript
{
  formData: {
    // All input parameters
  },
  systemStatus: {
    modelsLoaded: boolean,
    stabilityFeatures: number,
    anomalyFeatures: number  
  },
  results: {
    stability: null|object,
    anomaly: null|object
  },
  actions: [alertObjects],
  error: null|string
}
```

## API Integration

### Service Methods
1. `checkSystemStatus()` - GET /system-status
2. `predictStability(data)` - POST /predict-stability
3. `detectAnomaly(data)` - POST /detect-anomaly

### Error Handling
- Network error display
- Validation feedback
- Retry mechanisms

## Responsive Design

### Breakpoints
- **Desktop**: 1200px+ (full layout)
- **Tablet**: 768px-1199px (stacked sections)
- **Mobile**: <768px (compact controls)

### Adaptive Elements
- Parameter grid columns
- Result card stacking
- Font size scaling

## Development Setup
1. Install dependencies: `npm install`
2. Start dev server: `npm start`
3. Environment variables:
   - `REACT_APP_API_URL`: Backend base URL
