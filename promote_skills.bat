@echo off
cd /d "%~dp0"
call .venv\Scripts\activate.bat
echo.
echo ===== DRY RUN (preview only, nothing changes) =====
python promote_skills.py --dry-run
echo.
set /p CONFIRM="Type YES to actually promote these skills, or press Enter to cancel: "
if /i "%CONFIRM%"=="YES" (
    python promote_skills.py
) else (
    echo Cancelled. Nothing was changed.
)
echo.
pause
