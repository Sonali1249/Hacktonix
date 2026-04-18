@echo off
echo ==============================================
echo  Starting BlindSpot.AI Local Setup
echo ==============================================

cd backend
echo Checking backend dependencies...
if not exist "venv\Scripts\python.exe" (
    echo [ERROR] Virtual environment not found in backend/venv. Run setup first.
    pause
    exit /b 1
)

echo Initializing DB...
call venv\Scripts\activate.bat
python init_db.py
echo Starting FastAPI Backend (Port 8000)...
start "BlindSpot.AI Backend" cmd /k "venv\Scripts\uvicorn.exe main:app --reload --host 0.0.0.0 --port 8000"

cd ..\frontend
echo Starting React Frontend (Port 3000)...
start "BlindSpot.AI Frontend" cmd /c "npm start"

echo ==============================================
echo  Servers are starting in new windows!
echo  Backend: http://localhost:8000
echo  Frontend: http://localhost:3000
echo ==============================================
cd ..
