@echo off
title Smart Grid Frontend
echo Starting Smart Grid Frontend Setup

:: Verify Node.js and npm
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Node.js is not installed or not in PATH
    echo Please download and install Node.js from https://nodejs.org/
    pause
    exit /b
)

where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: npm is not working properly
    echo Please reinstall Node.js
    pause
    exit /b
)

:: Change to frontend directory
cd /d "%~dp0smart-grid-frontend" || (
    echo Error: Failed to change to frontend directory
    pause
    exit /b
)

:: Install dependencies
echo Installing dependencies...
call npm install
if %errorlevel% neq 0 (
    echo Error: npm install failed
    pause
    exit /b
)

:: Start development server
echo Starting development server...
call npm start
if %errorlevel% neq 0 (
    echo Error: Failed to start development server
    pause
    exit /b
)

echo Frontend is running at: http://localhost:3000
pause
