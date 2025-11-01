#!/bin/bash

###############################################################################
# Cursor AI Workshop - Linux Installation Script
# This script installs all prerequisites for the Cursor AI workshop labs
# Designed for Ubuntu/Debian-based distributions
###############################################################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "\n${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}\n"
}

# Check if running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    print_error "This script is for Linux only!"
    exit 1
fi

# Check for apt (Ubuntu/Debian)
if ! command -v apt &> /dev/null; then
    print_error "This script requires apt package manager (Ubuntu/Debian)"
    print_info "For other distributions, please install dependencies manually"
    exit 1
fi

print_header "Cursor AI Workshop - Linux Setup"

# Update package list
print_info "Updating package list..."
sudo apt update

# Install curl and wget if not present (needed for installations)
print_info "Ensuring curl and wget are installed..."
sudo apt install -y curl wget

# Install Git
print_header "Installing Git"
if command -v git &> /dev/null; then
    GIT_VERSION=$(git --version)
    print_success "Git is already installed: $GIT_VERSION"
else
    print_info "Installing Git..."
    sudo apt install -y git
    print_success "Git installed successfully!"
fi

# Verify Git
GIT_VERSION=$(git --version)
print_success "Git version: $GIT_VERSION"

# Install Node.js using NodeSource repository
print_header "Installing Node.js"
if command -v node &> /dev/null; then
    CURRENT_NODE_VERSION=$(node --version)
    print_info "Node.js is already installed: $CURRENT_NODE_VERSION"

    # Check if version is acceptable (v18+)
    NODE_MAJOR=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
    if [ "$NODE_MAJOR" -lt 18 ]; then
        print_warning "Node.js version is too old. Installing Node.js 20 LTS..."

        # Remove old Node.js
        sudo apt remove -y nodejs npm

        # Install Node.js 20.x
        curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
        sudo apt install -y nodejs

        print_success "Node.js upgraded successfully!"
    else
        print_success "Node.js version is acceptable"
    fi
else
    print_info "Installing Node.js 20 LTS..."

    # Install Node.js 20.x from NodeSource
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt install -y nodejs

    print_success "Node.js installed successfully!"
fi

# Verify Node.js and npm
NODE_VERSION=$(node --version)
NPM_VERSION=$(npm --version)
print_success "Node.js version: $NODE_VERSION"
print_success "npm version: $NPM_VERSION"

# Verify curl
print_header "Verifying curl"
if command -v curl &> /dev/null; then
    CURL_VERSION=$(curl --version | head -n1)
    print_success "curl is available: $CURL_VERSION"
else
    # Should not happen as we installed it earlier
    print_warning "curl not found. Installing..."
    sudo apt install -y curl
fi

# Install build-essential (may be needed for some npm packages)
print_info "Installing build-essential (for native npm modules)..."
sudo apt install -y build-essential

# Check for Cursor IDE
print_header "Installing Cursor IDE"

# Check common installation locations
CURSOR_INSTALLED=false
if [ -f "$HOME/.local/bin/cursor" ] || [ -f "/usr/local/bin/cursor" ] || [ -f "/usr/bin/cursor" ]; then
    print_success "Cursor IDE appears to be installed"
    CURSOR_INSTALLED=true
elif [ -f "$HOME/.cursor/cursor" ]; then
    print_success "Cursor IDE found in ~/.cursor"
    CURSOR_INSTALLED=true
fi

if [ "$CURSOR_INSTALLED" = false ]; then
    print_warning "Cursor IDE not detected"
    print_info "Downloading Cursor IDE AppImage..."

    # Create installation directory
    mkdir -p "$HOME/.local/bin"
    mkdir -p "$HOME/.cursor"

    # Download Cursor AppImage
    CURSOR_URL="https://downloader.cursor.sh/linux/appImage/x64"
    CURSOR_PATH="$HOME/.cursor/cursor.AppImage"

    if wget -O "$CURSOR_PATH" "$CURSOR_URL"; then
        chmod +x "$CURSOR_PATH"

        # Create symlink for easy access
        ln -sf "$CURSOR_PATH" "$HOME/.local/bin/cursor"

        print_success "Cursor IDE downloaded to $CURSOR_PATH"
        print_info "You can launch it with: cursor"

        # Add to PATH if not already there
        if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
            print_info "Added ~/.local/bin to PATH in ~/.bashrc"
            print_warning "Please run 'source ~/.bashrc' or restart your terminal"
        fi
    else
        print_error "Failed to download Cursor IDE"
        print_info "Please download manually from: https://cursor.com/download"
    fi
else
    print_info "Cursor IDE is already installed"
fi

# Verify we're in the workshop directory
print_header "Verifying Workshop Directory"
if [ -d "my-api" ]; then
    print_success "Found my-api directory - looks good!"
else
    print_error "my-api directory not found!"
    print_info "Please run this script from the root of the cloned workshop repository."
    print_info "Expected structure:"
    print_info "  cursor/"
    print_info "  ├── install-linux.sh (this script)"
    print_info "  └── my-api/"
    exit 1
fi

# Install Node.js dependencies
print_header "Installing Node.js Dependencies"
cd "my-api" || {
    print_error "Failed to enter my-api directory!"
    exit 1
}

print_info "Running npm install..."
npm install

print_success "Node.js dependencies installed successfully!"

# Test the server
print_header "Testing Server"
print_info "Starting server to verify installation..."

# Start server in background
npm start &
SERVER_PID=$!

# Wait for server to start
sleep 3

# Test with curl
if curl -s http://localhost:3000/health > /dev/null 2>&1; then
    print_success "Server is running correctly!"
else
    print_info "Server started but health check endpoint may not exist yet (this is normal)"
fi

# Stop server
kill $SERVER_PID 2>/dev/null || true
print_info "Stopped test server"

# Final summary
print_header "Installation Complete!"

echo -e "${GREEN}✓${NC} Node.js: $NODE_VERSION"
echo -e "${GREEN}✓${NC} npm: v$NPM_VERSION"
echo -e "${GREEN}✓${NC} Git: $GIT_VERSION"
echo -e "${GREEN}✓${NC} curl: Available"
echo -e "${GREEN}✓${NC} build-essential: Installed"

if [ "$CURSOR_INSTALLED" = true ] || [ -f "$HOME/.cursor/cursor.AppImage" ]; then
    echo -e "${GREEN}✓${NC} Cursor IDE: Installed"
else
    echo -e "${YELLOW}!${NC} Cursor IDE: Please install from https://cursor.com/download"
fi

echo -e "${GREEN}✓${NC} Workshop directory: Verified"
echo -e "${GREEN}✓${NC} Node.js dependencies: Installed"

print_header "Next Steps"

if [ -f "$HOME/.cursor/cursor.AppImage" ]; then
    echo "1. Launch Cursor IDE:"
    echo "   cursor"
    echo "   (or run: $HOME/.cursor/cursor.AppImage)"
elif command -v cursor &> /dev/null; then
    echo "1. Launch Cursor IDE:"
    echo "   cursor"
else
    echo "1. Launch Cursor IDE from your applications menu or command line"
fi

echo "2. In Cursor, open the folder: $(pwd | sed "s|/my-api||")"
echo "3. Follow the lab instructions in labs.md"
echo ""
echo "To start the server manually:"
echo "  cd $(pwd)"
echo "  npm start"
echo ""

if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    print_warning "Don't forget to run: source ~/.bashrc"
    print_info "This will add Cursor to your PATH"
fi

print_success "You're ready to start the workshop labs!"
