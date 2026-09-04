#!/bin/bash

echo "=========================================="
echo "🔥 GURU BOT INSTALLATION 🔥"
echo "=========================================="

# Update system
echo "📦 Updating system packages..."
sudo apt-get update

# Install Python and dependencies
echo "📦 Installing Python and dependencies..."
sudo apt-get install -y python3 python3-pip python3-venv

# Install Playwright dependencies
echo "📦 Installing Playwright dependencies..."
sudo apt-get install -y \
    libnss3 \
    libatk-bridge2.0-0 \
    libdrm2 \
    libxkbcommon0 \
    libgbm1 \
    libasound2 \
    libxshmfence1 \
    libx11-xcb1

# Create virtual environment
echo "📦 Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

# Install Python packages
echo "📦 Installing Python packages..."
pip install --upgrade pip
pip install -r requirements.txt

# Install Playwright browsers
echo "📦 Installing Playwright browsers..."
playwright install chromium
playwright install-deps

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating .env file..."
    cp .env.example .env
    echo "⚠️ Please edit .env file with your credentials!"
fi

# Create screenshots directory
mkdir -p screenshots

echo "=========================================="
echo "✅ Installation complete!"
echo "=========================================="
echo "Next steps:"
echo "1. Edit .env file with your credentials"
echo "2. Run: python app.py"
echo "=========================================="
