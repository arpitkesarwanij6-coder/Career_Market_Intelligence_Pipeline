@echo off
cd /d "%~dp0"
call .venv\Scripts\activate.bat
echo.
echo Starting Career Market Intelligence server...
echo Open your browser to http://127.0.0.1:8000
echo.
echo To turn the server OFF: close this window, or press Ctrl+C then Y.
echo (Double-clicking stop_server.bat also works if you lose track of this window.)
echo.
uvicorn app:app
echo.
echo Server stopped.
pause
