@echo off
setlocal
cd /d "%~dp0"
echo ============================================================
echo  Rooted extension - local test server
echo  Serving this folder at http://localhost:8770
echo  Leave this window OPEN while testing in Tableau Desktop.
echo  Press Ctrl+C to stop.
echo ============================================================
echo.
where py >nul 2>nul
if %errorlevel%==0 ( py -m http.server 8770 & goto :end )
where python >nul 2>nul
if %errorlevel%==0 ( python -m http.server 8770 & goto :end )
where npx >nul 2>nul
if %errorlevel%==0 ( npx --yes http-server -p 8770 & goto :end )
echo Could not find Python or Node.js.
echo Install either one, then double-click this file again.
pause
:end
