@echo off
title Scorecard (by Objective) Server - leave this window open
cd /d "%~dp0"
echo.
echo   Goal Metrics Scorecard - Grouped by Objective - local server
echo   -----------------------------------------------------------
echo   Serving this folder at http://localhost:8766
echo.
echo   Leave this window OPEN while you use the extension in Tableau.
echo   Close it when you are done.
echo.
python -m http.server 8766
pause
