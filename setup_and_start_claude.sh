#!/bin/bash

# Function to check if a command exists
check_command() {
  if ! command -v "$1" &> /dev/null; then
    return 1
  else
    echo "✓ $1 is installed"
    return 0
  fi
}

# Function to install packages based on OS
install_package() {
  package="$1"
  
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if command -v brew &> /dev/null; then
      echo "Installing $package with Homebrew..."
      brew install "$package"
    else
      echo "Homebrew not found. Installing Homebrew first..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      echo "Installing $package with Homebrew..."
      brew install "$package"
    fi
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    if command -v apt-get &> /dev/null; then
      echo "Installing $package with apt..."
      sudo apt-get update && sudo apt-get install -y "$package"
    elif command -v dnf &> /dev/null; then
      echo "Installing $package with dnf..."
      sudo dnf install -y "$package"
    elif command -v yum &> /dev/null; then
      echo "Installing $package with yum..."
      sudo yum install -y "$package"
    else
      echo "Cannot determine package manager. Please install $package manually."
      exit 1
    fi
  else
    echo "Unsupported operating system. Please install $package manually."
    exit 1
  fi
}

# Install Claude CLI
install_claude_cli() {
  echo "Installing Claude CLI..."
  
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if command -v brew &> /dev/null; then
      brew install anthropic/tools/claude
    else
      echo "Homebrew not found. Installing Homebrew first..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      brew install anthropic/tools/claude
    fi
  else
    # For other OS
    curl -fsSL https://claude.anthropic.com/install.sh | sh
  fi
}

# Check required tools
echo "Checking required tools..."

# Check and install git if needed
check_command "git" || {
  echo "Git not found. Installing git..."
  install_package "git"
}

# Check and install git flow if needed
check_command "git-flow" || {
  echo "Git Flow not found. Installing git-flow..."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    install_package "git-flow-avh"
  else
    install_package "git-flow"
  fi
}

# Check and install claude if needed
check_command "claude" || {
  echo "Claude CLI not found. Installing Claude CLI..."
  install_claude_cli
}

echo "All required tools are installed!"
echo "Starting Claude console..."

# Start claude console
claude

echo "Claude console session ended."