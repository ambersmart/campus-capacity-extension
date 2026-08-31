@echo off
title Scorecard Extension Server - leave this window open
cd /d "%~dp0"
echo.
echo   Goal Metrics Scorecard - local server
echo   -------------------------------------
echo   Serving this folder at http://localhost:8765
echo.
echo   Leave this window OPEN while you use the extension in Tableau.
echo   Close it when you are done.
echo.
python -m http.server 8765
pause
