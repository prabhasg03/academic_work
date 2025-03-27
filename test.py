import requests
import json
import pandas as pd
from framework.anomaly import AnomalyDetector
import numpy as np
BASE_URL = "http://127.0.0.1:5000"
STABILITY_URL = f"{BASE_URL}/predict-stability"
ANOMALY_URL = f"{BASE_URL}/detect-anomaly"

def print_result(label, result):
    print(f"\n=== {label} ===")
    if 'error' in result:
        print(f"ERROR: {result['error']}")
        if 'expected_features' in result:
            print("\nExpected Features:", result['expected_features'])
        if 'received_features' in result:
            print("Received Features:", result['received_features'])
    else:
        print(json.dumps(result, indent=2))
    print("=" * 40)

def test_stability_prediction():
    print("\nTesting Stability Prediction...")
    
    # Complete test data
    test_data = {
        "tau1": 2.95906002455997,
        "tau2": 3.07988520422811,
        "tau3": 8.38102539191882,
        "tau4": 9.78075443222607,
        "p1": 3.76308477206316,
        "p2": -0.782603630987543,
        "p3": -1.25739482958732,
        "p4": -1.7230863114883,
        "g1": 0.650456460887227,
        "g2": 0.859578105752345,
        "g3": 0.887444920638513,
        "g4": 0.958033987602737,
        "stab": 0.055347489172775
    }
    
    try:
        # Verify local processing first
        features = np.array([list(test_data.values())])
        print(f"Input features: {features.shape[1]} (should be 13)")
        
        # Test API endpoint
        response = requests.post(STABILITY_URL, json=test_data)
        result = response.json()
        
        if 'error' in result:
            print("\nAPI Error Details:")
            print(f"Required features: {result.get('required_features', 'N/A')}")
            print(f"Received features: {result.get('received_features', 'N/A')}")
        
        print_result("STABILITY PREDICTION", result)
        return result
    except Exception as e:
        print(f"Test failed: {str(e)}")
        return {"error": str(e)}
    
def test_anomaly_detection():
    print("\nTesting Anomaly Detection...")
    detector = AnomalyDetector()
    
    test_data = {
        "G": 1, "C": 0, "B": 0, "A": 1,
        "Ia": -151.29, "Ib": -9.67, "Ic": 85.80,
        "Va": 0.40, "Vb": -0.13, "Vc": -0.26
    }
    
    # Local verification
    try:
        prepared = detector.prepare_input(test_data)
        print(f"Local preparation - Input features: {len(test_data)}")
        print(f"Local preparation - Output features: {prepared.shape[1]} (should be 10)")
    except Exception as e:
        print(f"Local preparation failed: {str(e)}")
        return {"error": str(e)}
    
    # API test
    try:
        response = requests.post(ANOMALY_URL, json=test_data)
        result = response.json()
        print_result("ANOMALY DETECTION", result)
        return result
    except Exception as e:
        print(f"API test failed: {str(e)}")
        return {"error": str(e)}

def test_edge_cases():
    print("\nTesting Edge Cases...")
    cases = [
        {
            "name": "Complete Features",
            "data": {
                "G": 1, "C": 0, "B": 0, "A": 1,
                "Ia": -150, "Ib": -10, "Ic": 85,
                "Va": 0.4, "Vb": -0.1, "Vc": -0.2
            },
            "should_pass": True
        },
        {
            "name": "Missing Base Features",
            "data": {"G": 1, "Ia": -150},  # Intentionally incomplete
            "should_pass": False,
            "expected_error": "Missing required base features"
        },
        {
            "name": "Extra Features",
            "data": {
                "G": 1, "C": 0, "B": 0, "A": 1,
                "Ia": -150, "Ib": -10, "Ic": 85,
                "Va": 0.4, "Vb": -0.1, "Vc": -0.2,
                "Extra1": 123, "Extra2": 456
            },
            "should_pass": True
        }
    ]
    
    results = []
    for case in cases:
        print(f"\nCase: {case['name']}")
        try:
            response = requests.post(ANOMALY_URL, json=case['data'])
            result = response.json()
            
            if case.get('should_pass', True):
                if 'error' in result:
                    print(f"UNEXPECTED ERROR: {result['error']}")
                    results.append(False)
                else:
                    results.append(True)
            else:
                if 'error' in result and case.get('expected_error', '') in result['error']:
                    results.append(True)
                else:
                    print(f"Did not get expected error for {case['name']}")
                    results.append(False)
            
            print_result(case['name'].upper(), result)
        except Exception as e:
            print(f"Test failed: {str(e)}")
            results.append(False)
    return results

if __name__ == "__main__":
    print("=== Smart Grid Cybersecurity Framework Tester ===")
    
    # Test core functionality
    stability_result = test_stability_prediction()
    anomaly_result = test_anomaly_detection()
    
    # Test edge cases
    edge_case_results = test_edge_cases()
    
    # Print summary
    print("\n=== TEST SUMMARY ===")
    print(f"Stability Test: {'SUCCESS' if 'prediction' in stability_result else 'FAILED'}")
    print(f"Anomaly Test: {'SUCCESS' if 'is_anomaly' in anomaly_result else 'FAILED'}")
    print(f"Edge Cases: {sum(1 for r in edge_case_results if True==r)}/{len(edge_case_results)} passed")
    print("\nTesting complete!")
