@echo off
rem One-click wrapper: bypass PS execution policy and run flash.ps1
rem Usage:  flash.bat              -> build + download
rem         flash.bat -SkipBuild   -> download only
rem         flash.bat -Port COM5   -> specify COM port
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0flash.ps1" %*
exit /b %ERRORLEVEL%
