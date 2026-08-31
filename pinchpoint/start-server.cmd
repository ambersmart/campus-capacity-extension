@echo off
title Pinchpoint Extension Server - leave this window open
cd /d "%~dp0"
echo.
echo   Campus Pinchpoint Dashboard - local server
echo   -----------------------------------------
echo   Serving this folder at http://localhost:8767
echo.
echo   Leave this window OPEN while you use the extension in Tableau.
echo   Close it when you are done.
echo.
python -m http.server 8767
pause
