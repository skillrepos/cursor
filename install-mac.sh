#!/bin/bash

###############################################################################
# Cursor AI Workshop - macOS Installation Script
# This script installs all prerequisites for the Cursor AI workshop labs
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

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is for macOS only!"
    exit 1
fi

print_header "Cursor AI Workshop - macOS Setup"

# Check for Homebrew
print_info "Checking for Homebrew..."
if ! command -v brew &> /dev/null; then
    print_warning "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    print_success "Homebrew installed successfully!"
else
    print_success "Homebrew is already installed"
    brew update
fi

# Install Node.js
print_header "Installing Node.js"
if command -v node &> /dev/null; then
    CURRENT_NODE_VERSION=$(node --version)
    print_info "Node.js is already installed: $CURRENT_NODE_VERSION"

    # Check if version is acceptable (v18+)
    NODE_MAJOR=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
    if [ "$NODE_MAJOR" -lt 18 ]; then
        print_warning "Node.js version is too old. Upgrading to latest LTS..."
        brew upgrade node
    else
        print_success "Node.js version is acceptable"
    fi
else
    print_info "Installing Node.js LTS..."
    brew install node@20
    brew link node@20
    print_success "Node.js installed successfully!"
fi

# Verify Node.js and npm
NODE_VERSION=$(node --version)
NPM_VERSION=$(npm --version)
print_success "Node.js version: $NODE_VERSION"
print_success "npm version: $NPM_VERSION"

# Install Git
print_header "Installing Git"
if command -v git &> /dev/null; then
    GIT_VERSION=$(git --version)
    print_success "Git is already installed: $GIT_VERSION"
else
    print_info "Installing Git..."
    brew install git
    print_success "Git installed successfully!"
fi

# Verify Git
GIT_VERSION=$(git --version)
print_success "Git version: $GIT_VERSION"

# curl is pre-installed on macOS, just verify
print_header "Verifying curl"
if command -v curl &> /dev/null; then
    CURL_VERSION=$(curl --version | head -n1)
    print_success "curl is available: $CURL_VERSION"
else
    print_warning "curl not found (unusual for macOS). Installing..."
    brew install curl
fi

# Check for Cursor IDE
print_header "Checking for Cursor IDE"
if [ -d "/Applications/Cursor.app" ]; then
    print_success "Cursor IDE is installed in /Applications"
else
    print_warning "Cursor IDE not found in /Applications"
    print_info "Please download and install Cursor from: https://cursor.com/download"
    print_info "After downloading, drag Cursor.app to your Applications folder"

    read -p "Press Enter after installing Cursor, or Ctrl+C to exit..."
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
    print_info "  ├── install-mac.sh (this script)"
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

echo -e "${GREEN}✓${NC} Homebrew: $(brew --version | head -n1)"
echo -e "${GREEN}✓${NC} Node.js: $NODE_VERSION"
echo -e "${GREEN}✓${NC} npm: v$NPM_VERSION"
echo -e "${GREEN}✓${NC} Git: $GIT_VERSION"
echo -e "${GREEN}✓${NC} curl: Available"
if [ -d "/Applications/Cursor.app" ]; then
    echo -e "${GREEN}✓${NC} Cursor IDE: Installed"
else
    echo -e "${YELLOW}!${NC} Cursor IDE: Please install from https://cursor.com/download"
fi
echo -e "${GREEN}✓${NC} Workshop directory: Verified"
echo -e "${GREEN}✓${NC} Node.js dependencies: Installed"

print_header "Next Steps"
echo "1. Open Cursor IDE from your Applications folder"
echo "2. In Cursor, open the folder: $(pwd | sed "s|/my-api||")"
echo "3. Follow the lab instructions in labs.md"
echo ""
echo "To start the server manually:"
echo "  cd $(pwd)"
echo "  npm start"
echo ""

print_success "You're ready to start the workshop labs!"
