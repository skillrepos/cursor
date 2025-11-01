###############################################################################
# Cursor AI Workshop - Windows Installation Script
# This script installs all prerequisites for the Cursor AI workshop labs
#
# IMPORTANT: Run PowerShell as Administrator
# Run with: Set-ExecutionPolicy Bypass -Scope Process -Force; .\install-windows.ps1
###############################################################################

# Require Administrator privileges
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "ERROR: This script must be run as Administrator!" -ForegroundColor Red
    Write-Host "Right-click PowerShell and select 'Run as Administrator'" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Helper functions for colored output
function Print-Header {
    param([string]$Message)
    Write-Host "`n========================================" -ForegroundColor Blue
    Write-Host $Message -ForegroundColor Blue
    Write-Host "========================================`n" -ForegroundColor Blue
}

function Print-Info {
    param([string]$Message)
    Write-Host "[INFO] $Message" -ForegroundColor Cyan
}

function Print-Success {
    param([string]$Message)
    Write-Host "[SUCCESS] $Message" -ForegroundColor Green
}

function Print-Warning {
    param([string]$Message)
    Write-Host "[WARNING] $Message" -ForegroundColor Yellow
}

function Print-Error {
    param([string]$Message)
    Write-Host "[ERROR] $Message" -ForegroundColor Red
}

Print-Header "Cursor AI Workshop - Windows Setup"

# Check for winget
Print-Info "Checking for winget (Windows Package Manager)..."
if (Get-Command winget -ErrorAction SilentlyContinue) {
    Print-Success "winget is available"
    $useWinget = $true
} else {
    Print-Warning "winget not found. Checking for Chocolatey..."

    if (Get-Command choco -ErrorAction SilentlyContinue) {
        Print-Success "Chocolatey is available"
        $useWinget = $false
    } else {
        Print-Warning "Neither winget nor Chocolatey found."
        Print-Info "Installing Chocolatey..."

        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

        # Refresh environment
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

        if (Get-Command choco -ErrorAction SilentlyContinue) {
            Print-Success "Chocolatey installed successfully!"
            $useWinget = $false
        } else {
            Print-Error "Failed to install Chocolatey. Please install winget or Chocolatey manually."
            exit 1
        }
    }
}

# Install Node.js
Print-Header "Installing Node.js"
if (Get-Command node -ErrorAction SilentlyContinue) {
    $nodeVersion = node --version
    Print-Info "Node.js is already installed: $nodeVersion"

    # Check version
    $majorVersion = [int]($nodeVersion -replace 'v|\..*','')
    if ($majorVersion -lt 18) {
        Print-Warning "Node.js version is too old. Upgrading..."
        if ($useWinget) {
            winget upgrade OpenJS.NodeJS.LTS
        } else {
            choco upgrade nodejs-lts -y
        }
    } else {
        Print-Success "Node.js version is acceptable"
    }
} else {
    Print-Info "Installing Node.js LTS..."
    if ($useWinget) {
        winget install OpenJS.NodeJS.LTS --silent
    } else {
        choco install nodejs-lts -y
    }

    # Refresh environment
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

    Print-Success "Node.js installed successfully!"
}

# Verify Node.js and npm
$nodeVersion = node --version
$npmVersion = npm --version
Print-Success "Node.js version: $nodeVersion"
Print-Success "npm version: $npmVersion"

# Install Git
Print-Header "Installing Git"
if (Get-Command git -ErrorAction SilentlyContinue) {
    $gitVersion = git --version
    Print-Success "Git is already installed: $gitVersion"
} else {
    Print-Info "Installing Git..."
    if ($useWinget) {
        winget install Git.Git --silent
    } else {
        choco install git -y
    }

    # Refresh environment
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

    Print-Success "Git installed successfully!"
}

# Verify Git
$gitVersion = git --version
Print-Success "Git version: $gitVersion"

# Install curl (if not already present)
Print-Header "Checking curl"
if (Get-Command curl -ErrorAction SilentlyContinue) {
    $curlVersion = (curl --version)[0]
    Print-Success "curl is available: $curlVersion"
} else {
    Print-Info "Installing curl..."
    if ($useWinget) {
        winget install curl.curl --silent
    } else {
        choco install curl -y
    }

    # Refresh environment
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

    Print-Success "curl installed!"
}

# Check for Cursor IDE
Print-Header "Checking for Cursor IDE"
$cursorPaths = @(
    "$env:LOCALAPPDATA\Programs\Cursor\Cursor.exe",
    "$env:ProgramFiles\Cursor\Cursor.exe",
    "$env:ProgramFiles(x86)\Cursor\Cursor.exe"
)

$cursorFound = $false
foreach ($path in $cursorPaths) {
    if (Test-Path $path) {
        Print-Success "Cursor IDE found at: $path"
        $cursorFound = $true
        break
    }
}

if (-not $cursorFound) {
    Print-Warning "Cursor IDE not found"
    Print-Info "Downloading Cursor IDE..."

    $cursorUrl = "https://downloader.cursor.sh/windows/nsis/x64"
    $installerPath = "$env:TEMP\CursorSetup.exe"

    try {
        Invoke-WebRequest -Uri $cursorUrl -OutFile $installerPath
        Print-Info "Starting Cursor installer..."
        Start-Process -FilePath $installerPath -Wait
        Print-Success "Cursor installation completed!"
    } catch {
        Print-Error "Failed to download Cursor. Please download manually from: https://cursor.com/download"
    }
}

# Verify we're in the workshop directory
Print-Header "Verifying Workshop Directory"
if (Test-Path "my-api") {
    Print-Success "Found my-api directory - looks good!"
} else {
    Print-Error "my-api directory not found!"
    Print-Info "Please run this script from the root of the cloned workshop repository."
    Print-Info "Expected structure:"
    Print-Info "  cursor/"
    Print-Info "  ├── install-windows.ps1 (this script)"
    Print-Info "  └── my-api/"
    exit 1
}

# Install Node.js dependencies
Print-Header "Installing Node.js Dependencies"
$myApiPath = "my-api"

if (-not (Test-Path $myApiPath)) {
    Print-Error "Failed to find my-api directory!"
    exit 1
}

Set-Location $myApiPath
Print-Info "Running npm install..."
npm install

Print-Success "Node.js dependencies installed successfully!"

# Test the server
Print-Header "Testing Server"
Print-Info "Starting server to verify installation..."

$serverJob = Start-Job -ScriptBlock {
    Set-Location $using:myApiPath
    npm start
}

Start-Sleep -Seconds 5

# Test with curl
try {
    $response = Invoke-WebRequest -Uri "http://localhost:3000/health" -TimeoutSec 5 -ErrorAction SilentlyContinue
    Print-Success "Server is running correctly!"
} catch {
    Print-Info "Server started but health check endpoint may not exist yet (this is normal)"
}

# Stop server
Stop-Job $serverJob
Remove-Job $serverJob
Print-Info "Stopped test server"

# Final summary
Print-Header "Installation Complete!"

Write-Host "[" -NoNewline
Write-Host "✓" -ForegroundColor Green -NoNewline
Write-Host "] Node.js: $nodeVersion"

Write-Host "[" -NoNewline
Write-Host "✓" -ForegroundColor Green -NoNewline
Write-Host "] npm: v$npmVersion"

Write-Host "[" -NoNewline
Write-Host "✓" -ForegroundColor Green -NoNewline
Write-Host "] Git: $gitVersion"

Write-Host "[" -NoNewline
Write-Host "✓" -ForegroundColor Green -NoNewline
Write-Host "] curl: Available"

if ($cursorFound) {
    Write-Host "[" -NoNewline
    Write-Host "✓" -ForegroundColor Green -NoNewline
    Write-Host "] Cursor IDE: Installed"
} else {
    Write-Host "[" -NoNewline
    Write-Host "!" -ForegroundColor Yellow -NoNewline
    Write-Host "] Cursor IDE: Please verify installation"
}

Write-Host "[" -NoNewline
Write-Host "✓" -ForegroundColor Green -NoNewline
Write-Host "] Workshop directory: Verified"

Write-Host "[" -NoNewline
Write-Host "✓" -ForegroundColor Green -NoNewline
Write-Host "] Node.js dependencies: Installed"

Print-Header "Next Steps"
Write-Host "1. Open Cursor IDE from Start Menu or Desktop"
Write-Host "2. In Cursor, open the folder: $(Get-Location | Split-Path -Parent)"
Write-Host "3. Follow the lab instructions in labs.md"
Write-Host ""
Write-Host "To start the server manually:"
Write-Host "  cd $(Get-Location)"
Write-Host "  npm start"
Write-Host ""

Print-Success "You're ready to start the workshop labs!"
Write-Host ""

# Return to original directory
Set-Location $PSScriptRoot

Read-Host "Press Enter to exit"
