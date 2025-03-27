class DecisionEngine:
    def __init__(self):
        self.thresholds = {
            "stability_confidence": 0.7,
            "anomaly_threshold": 0.5,
            "severe_anomaly": 1.0
        }
        
    def decide_stability(self, stability_results):
        """Make decisions based on stability predictions"""
        actions = []
        
        if stability_results["confidence"] < self.thresholds["stability_confidence"]:
            actions.append({
                "action": "low_confidence_warning",
                "message": "Low confidence in stability prediction"
            })
            
        if stability_results["prediction"] == "unstable":
            actions.append({
                "action": "grid_instability_detected",
                "severity": "high",
                "recommendation": "Initiate stabilization protocols"
            })
            
        return actions if actions else [{"action": "grid_stable", "message": "No action required"}]
    
    def decide_anomaly(self, anomaly_results):
        """Make decisions based on anomaly detection"""
        severity = "low"
        if anomaly_results["anomaly_score"] > self.thresholds["severe_anomaly"]:
            severity = "critical"
        elif anomaly_results["anomaly_score"] > self.thresholds["anomaly_threshold"]:
            severity = "high"
        
        recommendations = {
            "low": "Monitor system",
            "high": "Isolate affected components and investigate",
            "critical": "Immediate shutdown and security alert"
        }
        
        return [{
            "action": "anomaly_response",
            "severity": severity,
            "recommendation": recommendations[severity],
            "score": anomaly_results["anomaly_score"]
        }]