import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

// Terminology definitions
const TERM_DEFINITIONS = {
  // Stability Parameters
  'tau1': 'Generator 1 mechanical torque - Rotational force applied by generator prime mover',
  'tau2': 'Generator 2 mechanical torque - Rotational force applied by generator prime mover',
  'tau3': 'Generator 3 mechanical torque - Rotational force applied by generator prime mover',
  'tau4': 'Generator 4 mechanical torque - Rotational force applied by generator prime mover',
  'p1': 'Power injection at bus 1 - Active power being fed into the grid at this node',
  'p2': 'Power injection at bus 2 - Active power being fed into the grid at this node',
  'p3': 'Power injection at bus 3 - Active power being fed into the grid at this node',
  'p4': 'Power injection at bus 4 - Active power being fed into the grid at this node',
  'g1': 'Power gain for generator 1 - Proportional control gain for power output regulation',
  'g2': 'Power gain for generator 2 - Proportional control gain for power output regulation',
  'g3': 'Power gain for generator 3 - Proportional control gain for power output regulation',
  'g4': 'Power gain for generator 4 - Proportional control gain for power output regulation',
  'stab': 'Stability measurement - Composite indicator of grid dynamic stability (0-1 scale)',

  // Anomaly Parameters
  'G': 'Grid conductance - Measure of how easily current flows through the network',
  'C': 'Grid capacitance - Ability to store electrical energy in the network',
  'B': 'Grid susceptance - Imaginary component of admittance',
  'A': 'Grid admittance - Measure of how easily current flows considering both resistance and reactance',
  'Ia': 'Phase A current - Current measurement on the first phase conductor',
  'Ib': 'Phase B current - Current measurement on the second phase conductor',
  'Ic': 'Phase C current - Current measurement on the third phase conductor',
  'Va': 'Phase A voltage - Voltage measurement on the first phase conductor',
  'Vb': 'Phase B voltage - Voltage measurement on the second phase conductor',
  'Vc': 'Phase C voltage - Voltage measurement on the third phase conductor',

  // Results Terminology
  'prediction': 'System forecast of grid stability (stable/unstable)',
  'confidence': 'Certainty level of the prediction (0-100%) combining ANN and XGBoost results',
  'ANN': 'Artificial Neural Network - Deep learning model for stability prediction',
  'XGB': 'XGBoost - Advanced decision tree ensemble algorithm',
  'is_anomaly': 'Abnormality detection status (true/false)',
  'score': 'Composite anomaly score combining reconstruction error and cluster distance',
  'reconstruction_error': 'How much input data differs from autoencoder reconstruction (higher=more anomalous)',
  'cluster_distance': 'Distance to nearest normal operation cluster center in feature space',
  'threshold': 'Predefined value above which alerts are triggered',
  'encrypted_voltage': 'Voltage measurement encrypted with AES-128 for secure transmission'
};

// Term component for tooltips
const Term = ({ name, children }) => {
  const [showTooltip, setShowTooltip] = useState(false);

  return (
    <span 
      className="term" 
      onMouseEnter={() => setShowTooltip(true)}
      onMouseLeave={() => setShowTooltip(false)}
    >
      {children}
      {showTooltip && (
        <div className="tooltip">
          <strong>{name}:</strong> {TERM_DEFINITIONS[name] || 'Definition not available'}
        </div>
      )}
    </span>
  );
};

const App = () => {
  // Form state
  const [formData, setFormData] = useState({
    // Stability parameters
    tau1: '1', tau2: '2', tau3: '1', tau4: '2',
    p1: '1', p2: '1', p3: '1', p4: '1',
    g1: '1', g2: '1', g3: '1', g4: '1',
    stab: '0',
    // Anomaly parameters
    G: '1', C: '2', B: '3', A: '4',
    Ia: '1', Ib: '2', Ic: '3',
    Va: '4', Vb: '1', Vc: '2'
  });

  // App state
  const [state, setState] = useState({
    loading: false,
    error: null,
    results: {
      stability: null,
      anomaly: null
    },
    systemStatus: null,
    actions: []
  });

  // Check system status on component mount
  useEffect(() => {
    checkSystemStatus();
  }, []);

  // Handle input changes
  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  // Check system status
  const checkSystemStatus = async () => {
    try {
      const response = await axios.get('http://localhost:5000/system-status');
      setState(prev => ({
        ...prev,
        systemStatus: response.data,
        error: null
      }));
    } catch (error) {
      setState(prev => ({
        ...prev,
        error: 'Failed to check system status',
        systemStatus: null
      }));
    }
  };

  // Test grid stability
  const testStability = async () => {
    setState(prev => ({
      ...prev,
      loading: true,
      error: null,
      results: { ...prev.results, stability: null }
    }));

    try {
      // Prepare stability data
      const stabilityData = {};
      Object.keys(formData)
        .filter(key => TERM_DEFINITIONS[key] && key !== 'stab')
        .forEach(key => {
          stabilityData[key] = parseFloat(formData[key]);
        });
      stabilityData.stab = parseFloat(formData.stab);

      const response = await axios.post(
        'http://localhost:5000/predict-stability',
        stabilityData
      );

      // Generate actions based on results
      const actions = [];
      if (response.data.confidence < 0.7) {
        actions.push({
          type: 'warning',
          message: 'Low confidence prediction - verify sensor readings',
          timestamp: new Date().toLocaleTimeString()
        });
      }
      if (response.data.prediction === 'unstable') {
        actions.push({
          type: 'critical',
          message: 'GRID INSTABILITY DETECTED - Initiate stabilization protocols',
          timestamp: new Date().toLocaleTimeString()
        });
      }

      setState(prev => ({
        ...prev,
        loading: false,
        results: {
          ...prev.results,
          stability: response.data
        },
        actions: [...prev.actions, ...actions]
      }));
    } catch (error) {
      setState(prev => ({
        ...prev,
        loading: false,
        error: error.response?.data?.error || 'Stability test failed'
      }));
    }
  };

  // Detect anomalies
  const detectAnomaly = async () => {
    setState(prev => ({
      ...prev,
      loading: true,
      error: null,
      results: { ...prev.results, anomaly: null }
    }));

    try {
      // Prepare anomaly data
      const anomalyData = {};
      Object.keys(formData)
        .filter(key => ['G', 'C', 'B', 'A', 'Ia', 'Ib', 'Ic', 'Va', 'Vb', 'Vc'].includes(key))
        .forEach(key => {
          anomalyData[key] = parseFloat(formData[key]);
        });

      const response = await axios.post(
        'http://localhost:5000/detect-anomaly',
        anomalyData
      );

      // Generate actions based on results
      const actions = [];
      if (response.data.is_anomaly) {
        let severity = 'moderate';
        let message = 'Potential anomaly detected - monitor closely';
        
        if (response.data.score > 1.5) {
          severity = 'high';
          message = 'Severe anomaly detected - isolate affected components';
        }
        if (response.data.score > 3.0) {
          severity = 'critical';
          message = 'CRITICAL ANOMALY - Immediate shutdown required';
        }

        actions.push({
          type: severity,
          message,
          timestamp: new Date().toLocaleTimeString(),
          score: response.data.score
        });
      }

      setState(prev => ({
        ...prev,
        loading: false,
        results: {
          ...prev.results,
          anomaly: response.data
        },
        actions: [...prev.actions, ...actions]
      }));
    } catch (error) {
      setState(prev => ({
        ...prev,
        loading: false,
        error: error.response?.data?.error || 'Anomaly detection failed'
      }));
    }
  };

  // Clear action log
  const clearActions = () => {
    setState(prev => ({ ...prev, actions: [] }));
  };

  return (
    <div className="dashboard-container">
      <header className="dashboard-header">
        <h1>Smart Grid Cybersecurity Dashboard</h1>
        <div className="status-controls">
          <button 
            onClick={checkSystemStatus}
            className="status-button"
          >
            Check System Status
          </button>
          {state.systemStatus && (
            <div className="status-indicator">
              <span className={`status-dot ${state.systemStatus.models_loaded ? 'active' : 'inactive'}`}></span>
              <span>Models: {state.systemStatus.models_loaded ? 'Loaded' : 'Unavailable'}</span>
            </div>
          )}
        </div>
      </header>

      {state.systemStatus && (
        <div className="system-info">
          <div className="info-item">
            <Term name="stability">Stability Model:</Term>
            <span>{state.systemStatus.stability_features} parameters</span>
          </div>
          <div className="info-item">
            <Term name="anomaly">Anomaly Model:</Term>
            <span>{state.systemStatus.anomaly_features} parameters</span>
          </div>
        </div>
      )}

      <div className="dashboard-content">
        <div className="input-sections">
          {/* Stability Parameters Section */}
          <section className="parameter-section">
            <h2>Stability Parameters</h2>
            <div className="parameter-grid">
              {['tau1', 'tau2', 'tau3', 'tau4', 'p1', 'p2', 'p3', 'p4', 'g1', 'g2', 'g3', 'g4', 'stab'].map(param => (
                <div key={param} className="parameter-group">
                  <label><Term name={param}>{param}</Term></label>
                  <input
                    type="number"
                    name={param}
                    value={formData[param]}
                    onChange={handleInputChange}
                    step="0.01"
                  />
                </div>
              ))}
            </div>
            <button 
              onClick={testStability} 
              disabled={state.loading}
              className={`action-button ${state.results.stability ? 'has-results' : ''}`}
            >
              {state.loading ? 'Testing...' : 'Test Stability'}
            </button>
          </section>

          {/* Anomaly Parameters Section */}
          <section className="parameter-section">
            <h2>Anomaly Parameters</h2>
            <div className="parameter-grid">
              {['G', 'C', 'B', 'A', 'Ia', 'Ib', 'Ic', 'Va', 'Vb', 'Vc'].map(param => (
                <div key={param} className="parameter-group">
                  <label><Term name={param}>{param}</Term></label>
                  <input
                    type="number"
                    name={param}
                    value={formData[param]}
                    onChange={handleInputChange}
                    step="0.01"
                  />
                </div>
              ))}
            </div>
            <button 
              onClick={detectAnomaly} 
              disabled={state.loading}
              className={`action-button ${state.results.anomaly ? 'has-results' : ''}`}
            >
              {state.loading ? 'Detecting...' : 'Detect Anomaly'}
            </button>
          </section>
        </div>

        {/* Results and Actions Section */}
        <div className="results-section">
          {state.error && (
            <div className="error-message">
              <span className="error-icon">⚠️</span>
              {state.error}
            </div>
          )}

          <div className="results-container">
            {/* Stability Results */}
            {state.results.stability && (
              <div className="result-card stability-results">
                <h3>Stability Results</h3>
                <div className="result-item">
                  <Term name="prediction">Prediction:</Term>
                  <span className={`prediction-value ${state.results.stability.prediction}`}>
                    {state.results.stability.prediction}
                  </span>
                </div>
                </div>
            )}

            {/* Anomaly Results */}
            {state.results.anomaly && (
              <div className={`result-card anomaly-results ${state.results.anomaly.is_anomaly ? 'anomaly-detected' : ''}`}>
                <h3>Anomaly Results</h3>
                <div className="result-item">
                  <Term name="is_anomaly">Status:</Term>
                  <span className={`status-value ${state.results.anomaly.is_anomaly ? 'danger' : 'safe'}`}>
                    {state.results.anomaly.is_anomaly ? 'ANOMALY DETECTED!' : 'Normal Operation'}
                  </span>
                </div>
                <div className="result-item">
                  <Term name="score">Score:</Term>
                  <span className="score-value">
                    {state.results.anomaly.score.toFixed(4)} 
                    <span className="threshold"> (Threshold: 0.5)</span>
                  </span>
                </div>
              </div>
            )}
          </div>

          {/* Action Log */}
          {state.actions.length > 0 && (
            <div className="action-log">
              <div className="action-log-header">
                <h3>Action Log</h3>
                <button onClick={clearActions} className="clear-button">
                  Clear Log
                </button>
              </div>
              <div className="action-items">
                {state.actions.map((action, index) => (
                  <div key={index} className={`action-item ${action.type}`}>
                    <span className="action-time">{action.timestamp}</span>
                    <span className="action-message">{action.message}</span>
                    {action.score && (
                      <span className="action-score">Score: {action.score.toFixed(4)}</span>
                    )}
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Terminology Reference */}
          <div className="terminology-reference">
            <h3>Terminology Reference</h3>
            <div className="term-categories">
              <div className="term-category">
                <h4>Stability Parameters</h4>
                <ul>
                  <li><Term name="tau1">τ1-τ4</Term>: Generator mechanical torque</li>
                  <li><Term name="p1">p1-p4</Term>: Power injection measurements</li>
                  <li><Term name="g1">g1-g4</Term>: Generator power gain settings</li>
                  <li><Term name="stab">stab</Term>: Stability measurement</li>
                </ul>
              </div>
              <div className="term-category">
                <h4>Anomaly Parameters</h4>
                <ul>
                  <li><Term name="G">G,C,B,A</Term>: Grid configuration matrices</li>
                  <li><Term name="Ia">Ia,Ib,Ic</Term>: Phase current measurements</li>
                  <li><Term name="Va">Va,Vb,Vc</Term>: Phase voltage measurements</li>
                </ul>
              </div>
              <div className="term-category">
                <h4>Results Terminology</h4>
                <ul>
                  <li><Term name="confidence">Confidence</Term>: Prediction certainty</li>
                  <li><Term name="ANN">ANN/XGB</Term>: Machine learning models</li>
                  <li><Term name="score">Anomaly Score</Term>: Composite risk indicator</li>
                  <li><Term name="encrypted_voltage">Encrypted Data</Term>: Secure measurement</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default App;