@echo off
title Campus Capacity Extension Server - leave this window open
cd /d "%~dp0"
echo.
echo   Campus Capacity ^& Service Strategy - local server
echo   ------------------------------------------------
echo   Serving this folder at http://localhost:8772
echo.
echo   Leave this window OPEN while you use the extension in Tableau.
echo   Close it when you are done.
echo.
python -m http.server 8772
pause
