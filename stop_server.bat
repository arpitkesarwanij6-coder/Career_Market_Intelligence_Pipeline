@echo off
echo Looking for a server on port 8000...
echo.

set FOUND=0
for /f "tokens=5" %%P in ('netstat -ano ^| findstr :8000 ^| findstr LISTENING') do (
    set FOUND=1
    echo Stopping process ID %%P ...
    taskkill /PID %%P /F
)

echo.
if "%FOUND%"=="0" (
    echo No server was running on port 8000. Nothing to stop.
) else (
    echo Done. The server has been stopped.
)
echo.
pause
