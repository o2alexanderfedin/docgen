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

# Install Brain CLI
install_brain_cli() {
  echo "Installing Brain CLI..."
  
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

# Install GitHub CLI
install_gh_cli() {
  echo "Installing GitHub CLI..."
  
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if command -v brew &> /dev/null; then
      brew install gh
    else
      echo "Homebrew not found. Installing Homebrew first..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      brew install gh
    fi
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    if command -v apt-get &> /dev/null; then
      curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
      echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
      sudo apt update
      sudo apt install gh
    elif command -v dnf &> /dev/null; then
      sudo dnf install -y 'dnf-command(config-manager)'
      sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
      sudo dnf install -y gh
    elif command -v yum &> /dev/null; then
      sudo yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
      sudo yum install -y gh
    else
      echo "Installing GitHub CLI using official installer..."
      curl -fsSL https://cli.github.com/packages/rpm/gh-cli.repo | sudo tee /etc/yum.repos.d/gh-cli.repo
      sudo yum install gh
    fi
  else
    echo "Please install GitHub CLI manually: https://github.com/cli/cli#installation"
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

# Check and install brain if needed
check_command "claude" || {
  echo "Brain CLI not found. Installing Brain CLI..."
  install_brain_cli
}

# Check and install GitHub CLI if needed
check_command "gh" || {
  echo "GitHub CLI not found. Installing GitHub CLI..."
  install_gh_cli
}

echo "All required tools are installed!"
echo "Starting Brain console..."

# Start brain console
claude

echo "Brain console session ended."