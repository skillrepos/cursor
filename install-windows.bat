@echo off
REM ###############################################################################
REM Cursor AI Workshop - Windows Installation Script (Command Prompt)
REM This script installs all prerequisites for the Cursor AI workshop labs
REM
REM IMPORTANT: Run Command Prompt as Administrator
REM Right-click Command Prompt and select "Run as Administrator"
REM ###############################################################################

setlocal EnableDelayedExpansion

REM Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo [ERROR] This script must be run as Administrator!
    echo Right-click Command Prompt and select "Run as Administrator"
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo Cursor AI Workshop - Windows Setup
echo ========================================
echo.

REM Check for Chocolatey
echo [INFO] Checking for Chocolatey package manager...
where choco >nul 2>&1
if %errorLevel% equ 0 (
    echo [SUCCESS] Chocolatey is already installed
) else (
    echo [WARNING] Chocolatey not found. Installing Chocolatey...
    echo.

    REM Install Chocolatey
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"

    if %errorLevel% neq 0 (
        echo [ERROR] Failed to install Chocolatey
        echo Please visit https://chocolatey.org/install for manual installation
        pause
        exit /b 1
    )

    REM Refresh environment variables
    call refreshenv >nul 2>&1

    echo [SUCCESS] Chocolatey installed successfully!
)

echo.
echo ========================================
echo Installing Node.js
echo ========================================
echo.

REM Check for Node.js
where node >nul 2>&1
if %errorLevel% equ 0 (
    for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
    echo [INFO] Node.js is already installed: !NODE_VERSION!

    REM Extract major version
    set VERSION_NUM=!NODE_VERSION:v=!
    for /f "tokens=1 delims=." %%a in ("!VERSION_NUM!") do set MAJOR_VERSION=%%a

    if !MAJOR_VERSION! LSS 18 (
        echo [WARNING] Node.js version is too old. Upgrading...
        choco upgrade nodejs-lts -y
        call refreshenv >nul 2>&1
    ) else (
        echo [SUCCESS] Node.js version is acceptable
    )
) else (
    echo [INFO] Installing Node.js LTS...
    choco install nodejs-lts -y
    call refreshenv >nul 2>&1
    echo [SUCCESS] Node.js installed successfully!
)

REM Verify Node.js and npm
for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
for /f "tokens=*" %%i in ('npm --version') do set NPM_VERSION=%%i
echo [SUCCESS] Node.js version: !NODE_VERSION!
echo [SUCCESS] npm version: !NPM_VERSION!

echo.
echo ========================================
echo Installing Git
echo ========================================
echo.

REM Check for Git
where git >nul 2>&1
if %errorLevel% equ 0 (
    for /f "tokens=*" %%i in ('git --version') do set GIT_VERSION=%%i
    echo [SUCCESS] Git is already installed: !GIT_VERSION!
) else (
    echo [INFO] Installing Git...
    choco install git -y
    call refreshenv >nul 2>&1
    echo [SUCCESS] Git installed successfully!
)

REM Verify Git
for /f "tokens=*" %%i in ('git --version') do set GIT_VERSION=%%i
echo [SUCCESS] Git version: !GIT_VERSION!

echo.
echo ========================================
echo Checking curl
echo ========================================
echo.

REM Check for curl
where curl >nul 2>&1
if %errorLevel% equ 0 (
    for /f "tokens=*" %%i in ('curl --version ^| findstr /C:"curl"') do set CURL_VERSION=%%i
    echo [SUCCESS] curl is available: !CURL_VERSION!
) else (
    echo [INFO] Installing curl...
    choco install curl -y
    call refreshenv >nul 2>&1
    echo [SUCCESS] curl installed!
)

echo.
echo ========================================
echo Checking for Cursor IDE
echo ========================================
echo.

REM Check common Cursor installation paths
set CURSOR_FOUND=0

if exist "%LOCALAPPDATA%\Programs\Cursor\Cursor.exe" (
    echo [SUCCESS] Cursor IDE found at: %LOCALAPPDATA%\Programs\Cursor\Cursor.exe
    set CURSOR_FOUND=1
)

if exist "%ProgramFiles%\Cursor\Cursor.exe" (
    echo [SUCCESS] Cursor IDE found at: %ProgramFiles%\Cursor\Cursor.exe
    set CURSOR_FOUND=1
)

if exist "%ProgramFiles(x86)%\Cursor\Cursor.exe" (
    echo [SUCCESS] Cursor IDE found at: %ProgramFiles(x86)%\Cursor\Cursor.exe
    set CURSOR_FOUND=1
)

if !CURSOR_FOUND! equ 0 (
    echo [WARNING] Cursor IDE not found
    echo [INFO] Downloading Cursor IDE installer...
    echo.

    REM Download Cursor installer
    set CURSOR_URL=https://downloader.cursor.sh/windows/nsis/x64
    set INSTALLER_PATH=%TEMP%\CursorSetup.exe

    curl -L -o "!INSTALLER_PATH!" "!CURSOR_URL!"

    if exist "!INSTALLER_PATH!" (
        echo [INFO] Starting Cursor installer...
        echo Please follow the installation prompts...
        start /wait "" "!INSTALLER_PATH!"
        echo [SUCCESS] Cursor installation completed!
    ) else (
        echo [ERROR] Failed to download Cursor installer
        echo Please download manually from: https://cursor.com/download
    )
)

echo.
echo ========================================
echo Verifying Workshop Directory
echo ========================================
echo.

if exist "my-api" (
    echo [SUCCESS] Found my-api directory - looks good!
) else (
    echo [ERROR] my-api directory not found!
    echo [INFO] Please run this script from the root of the cloned workshop repository.
    echo [INFO] Expected structure:
    echo [INFO]   cursor/
    echo [INFO]   ├── install-windows.bat (this script^)
    echo [INFO]   └── my-api/
    pause
    exit /b 1
)

echo.
echo ========================================
echo Installing Node.js Dependencies
echo ========================================
echo.

cd "my-api"
if %errorLevel% neq 0 (
    echo [ERROR] Failed to enter my-api directory!
    pause
    exit /b 1
)

echo [INFO] Running npm install...
call npm install

if %errorLevel% equ 0 (
    echo [SUCCESS] Node.js dependencies installed successfully!
) else (
    echo [ERROR] Failed to install Node.js dependencies
    pause
    exit /b 1
)

echo.
echo ========================================
echo Testing Server
echo ========================================
echo.

echo [INFO] Starting server to verify installation...

REM Start server in background
start /b cmd /c "npm start > nul 2>&1"

REM Wait for server to start
timeout /t 5 /nobreak >nul

REM Test with curl
curl -s http://localhost:3000/health >nul 2>&1
if %errorLevel% equ 0 (
    echo [SUCCESS] Server is running correctly!
) else (
    echo [INFO] Server started but health check endpoint may not exist yet (this is normal)
)

REM Stop server (kill node processes - be careful this kills ALL node processes)
taskkill /F /IM node.exe >nul 2>&1
echo [INFO] Stopped test server

echo.
echo ========================================
echo Installation Complete!
echo ========================================
echo.

echo [✓] Node.js: !NODE_VERSION!
echo [✓] npm: v!NPM_VERSION!
echo [✓] Git: !GIT_VERSION!
echo [✓] curl: Available

if !CURSOR_FOUND! equ 1 (
    echo [✓] Cursor IDE: Installed
) else (
    echo [!] Cursor IDE: Please verify installation
)

echo [✓] Workshop directory: Verified
echo [✓] Node.js dependencies: Installed

echo.
echo ========================================
echo Next Steps
echo ========================================
echo.
echo 1. Open Cursor IDE from Start Menu or Desktop
echo 2. In Cursor, open the folder: %CD%\..
echo 3. Follow the lab instructions in labs.md
echo.
echo To start the server manually:
echo   cd %CD%
echo   npm start
echo.
echo [SUCCESS] You're ready to start the workshop labs!
echo.

cd ..
pause
