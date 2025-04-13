@echo off
title Anomaly Detection in Smart Grids using Deep Learning
echo Welcome to Anomaly Detection in Smart Grids using Deep Learning
echo This script will guide you through the process of building a deep learning model to detect stability and anomalies in smart grid

echo Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python is not installed or not in PATH
    echo Please download and install Python from https://www.python.org/downloads/
    pause
    exit /b
)
echo Python is installed

echo Checking Node.js installation...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Node.js is not installed or not in PATH
    echo Please download and install Node.js from https://nodejs.org/
    pause
    exit /b
)
echo Node.js is installed

echo Installing required packages using pip
pip install -r requirements.txt
start frontend.bat
python app.py
echo Done! Your Anomaly Detection in Smart Grids using Deep Learning model is now running.