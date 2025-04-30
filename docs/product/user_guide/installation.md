# Installation Guide

This guide walks you through the process of installing and setting up the Documentation Generator on your system.

## System Requirements

The Documentation Generator requires:

- **Operating System**: Windows 10+, macOS 10.15+, or Linux (Ubuntu 20.04+, Debian 10+, RHEL/CentOS 8+)
- **Python**: Version 3.8 or higher
- **Git**: Version 2.23 or higher
- **Storage**: At least 500MB of free disk space
- **Memory**: Minimum 4GB RAM (8GB+ recommended for large repositories)
- **Internet Connection**: Required for AI service integration

## Installation Methods

There are several ways to install the Documentation Generator:

### Method 1: Using pip (Recommended)

```bash
# Install from PyPI
pip install docgen

# Verify installation
docgen --version
```

### Method 2: Using Docker

```bash
# Pull the Docker image
docker pull docgen/docgen:latest

# Verify installation
docker run --rm docgen/docgen:latest --version
```

### Method 3: From Source

```bash
# Clone the repository
git clone https://github.com/o2alexanderfedin/docgen.git

# Navigate to the directory
cd docgen

# Install dependencies
pip install -e .

# Verify installation
docgen --version
```

## Post-Installation Setup

After installing the Documentation Generator, you'll need to perform some additional setup steps:

### 1. Configure AI Service Access

The Documentation Generator uses AI services for advanced analysis. You need to set up your API keys:

```bash
# Set up API keys for OpenAI (required)
docgen config set openai.api_key YOUR_OPENAI_API_KEY

# Optional: Set up API keys for Anthropic
docgen config set anthropic.api_key YOUR_ANTHROPIC_API_KEY
```

Alternatively, you can use environment variables:

```bash
# For OpenAI
export OPENAI_API_KEY=YOUR_OPENAI_API_KEY

# For Anthropic (optional)
export ANTHROPIC_API_KEY=YOUR_ANTHROPIC_API_KEY
```

### 2. Configure GitHub Integration (Optional)

If you want to integrate with GitHub:

```bash
# Set up GitHub CLI authentication
gh auth login

# Configure GitHub integration
docgen config set github.token YOUR_GITHUB_TOKEN
```

### 3. Initialize Documentation in Your Repository

Navigate to your project directory and initialize:

```bash
# Navigate to your project
cd /path/to/your/project

# Initialize documentation
docgen init
```

This will create a `.docgen` directory with default configuration files.

## Configuration File

After initialization, a `.docgen/config.yml` file will be created in your repository. This file contains the basic configuration for the Documentation Generator.

Here's an example configuration:

```yaml
# Documentation Generator Configuration
version: 1.0

# AI Service Configuration
ai:
  service: openai
  model: gpt-4o
  temperature: 0.7

# Output Configuration
output:
  format: markdown
  directory: docs
  
# Documentation Types
types:
  - architecture
  - api
  - user_guide
  - code
```

See the [Configuration Guide](configuration.md) for a detailed explanation of all configuration options.

## Verifying Installation

To verify that the Documentation Generator is properly installed and configured:

```bash
# Check version and installation
docgen --version

# Run a simple test to verify AI service connectivity
docgen test-connection

# View current configuration
docgen config list
```

## Upgrading

To upgrade the Documentation Generator to the latest version:

```bash
# Using pip
pip install --upgrade docgen

# Using Docker
docker pull docgen/docgen:latest
```

## Troubleshooting

If you encounter issues during installation:

### Common Issues

1. **Python Version Error**:
   ```
   Error: Python 3.8 or higher is required
   ```
   Solution: Install Python 3.8 or higher and try again.

2. **Missing Git**:
   ```
   Error: Git executable not found
   ```
   Solution: Install Git (version 2.23+) and ensure it's in your PATH.

3. **API Key Configuration**:
   ```
   Error: OpenAI API key not found
   ```
   Solution: Set up your API keys as described in the Post-Installation Setup section.

For more troubleshooting information, see our [Troubleshooting Guide](../troubleshooting.md).

## Next Steps

Now that you've installed the Documentation Generator, you can:

1. Read the [Basic Usage Guide](basic_usage.md) to start generating documentation
2. Explore [Configuration Options](configuration.md) to customize the output
3. Learn about [Best Practices](best_practices.md) for effective documentation generation