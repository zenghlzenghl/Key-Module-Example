@echo off
rem ============================================================
rem  One-click build script for CH554 USB CDC firmware
rem  Usage:  build.bat            -> clean + full rebuild
rem          build.bat flash      -> rebuild then flash
rem          build.bat <target>   -> pass any target to make
rem ============================================================
setlocal

set "PROJ_DIR=%~dp0"
set "BUILD_DIR=%PROJ_DIR%build"

rem ---- Toolchain paths (only used when not found in PATH) ----
set "SDCC_DIR=C:\Users\Y5043\.eide\tools\sdcc\bin"
set "MAKE_DIR=C:\Users\Y5043\.eide\bin\builder\msys\bin"

where sdcc >nul 2>nul || set "PATH=%SDCC_DIR%;%PATH%"
where make >nul 2>nul || set "PATH=%MAKE_DIR%;%PATH%"

where sdcc >nul 2>nul
if errorlevel 1 (
    echo [ERROR] sdcc not found. Fix SDCC_DIR in this script or add it to PATH.
    goto fail
)
where make >nul 2>nul
if errorlevel 1 (
    echo [ERROR] make not found. Fix MAKE_DIR in this script or add it to PATH.
    goto fail
)

echo ---- Toolchain ----
for /f "delims=" %%i in ('where sdcc') do (echo sdcc: %%i & goto tc_done)
:tc_done
sdcc --version | findstr /r "." >nul 2>nul
echo.

rem ---- Step 1: clean previous output ----
echo [1/3] Cleaning "%BUILD_DIR%" ...
if exist "%BUILD_DIR%" (
    pushd "%BUILD_DIR%" && (del /f /q * >nul 2>nul & popd)
) else (
    mkdir "%BUILD_DIR%" >nul 2>nul
)

rem ---- Step 2: build ----
echo [2/3] Building ...
pushd "%PROJ_DIR%"
if "%1"=="" (
    make all
) else (
    make %*
)
set "RC=%ERRORLEVEL%"
popd
if not "%RC%"=="0" goto fail

rem ---- Step 3: report ----
echo.
echo [3/3] Build OK. Output files:
for %%f in ("%BUILD_DIR%\usb_device_cdc.bin" "%BUILD_DIR%\usb_device_cdc.hex") do (
    if exist "%%~f" echo   %%~nxf  %%~zf bytes
)
echo.
echo Done.
pause
endlocal
exit /b 0

:fail
echo.
echo !!!! BUILD FAILED !!!!
endlocal
pause
exit /b 1
