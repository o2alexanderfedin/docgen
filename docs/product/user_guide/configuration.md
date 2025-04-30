# Configuration Guide

This guide covers the configuration options for the Documentation Generator, allowing you to customize the tool to your specific requirements.

## Configuration File

The Documentation Generator uses a YAML configuration file (`.docgen/config.yml`) to control its behavior. This file is created during initialization (`docgen init`) and can be customized to suit your needs.

## Basic Configuration Structure

Here's the basic structure of the configuration file:

```yaml
# Documentation Generator Configuration
version: 1.0

# Project Information
project:
  name: "Project Name"
  description: "Project Description"
  repository: "https://github.com/username/repository"

# AI Service Configuration
ai:
  service: openai
  model: gpt-4o
  temperature: 0.7
  max_tokens: 4000

# Output Configuration
output:
  format: markdown
  directory: docs
  structure:
    architecture: architecture/
    api: api/
    user_guide: user_guide/
    code: code/

# Documentation Types
types:
  - architecture
  - api
  - user_guide
  - code

# Git Integration
git:
  use_flow: true
  main_branch: main
  develop_branch: develop
  prefix:
    feature: documentation/
    release: release/

# Template Configuration
templates:
  directory: .docgen/templates
  override: true
```

## Configuration Sections

### Project Information

```yaml
project:
  name: "Project Name"          # Name of your project
  description: "Description"     # Short description
  repository: "repo-url"         # Repository URL
  version: "1.0.0"               # Project version
  license: "MIT"                 # License information
```

### AI Service Configuration

```yaml
ai:
  service: openai                # AI service provider (openai, anthropic, azure)
  model: gpt-4o                  # Model name
  temperature: 0.7               # Creativity (0.0-1.0)
  max_tokens: 4000               # Maximum response length
  timeout: 60                    # Timeout in seconds
  retry:
    attempts: 3                  # Retry attempts
    backoff: 2                   # Backoff multiplier
```

### Output Configuration

```yaml
output:
  format: markdown               # Output format (markdown, html, pdf)
  directory: docs                # Output directory
  structure:                     # Structure of output directories
    architecture: architecture/  # Architecture docs location
    api: api/                    # API docs location
    user_guide: user_guide/      # User guide location
    code: code/                  # Code docs location
  index: true                    # Generate index files
  toc: true                      # Generate table of contents
  links: relative                # Link type (relative, absolute)
  assets:
    directory: assets            # Assets directory
    images: images/              # Images directory
    diagrams: diagrams/          # Diagrams directory
```

### Documentation Types

```yaml
types:
  - architecture                 # Generate architecture documentation
  - api                          # Generate API documentation
  - user_guide                   # Generate user guide
  - code                         # Generate code documentation
  - operations                   # Generate operations documentation
  - compliance                   # Generate compliance documentation
```

### Git Integration

```yaml
git:
  use_flow: true                 # Use Git Flow
  main_branch: main              # Main branch name
  develop_branch: develop        # Development branch name
  prefix:
    feature: documentation/      # Feature branch prefix
    release: release/            # Release branch prefix
  commit:
    message_template: "docs: {summary}"  # Commit message template
    atomic: true                 # Use atomic commits
```

### Template Configuration

```yaml
templates:
  directory: .docgen/templates    # Templates directory
  override: true                  # Override default templates
  custom:
    architecture: custom_arch.md  # Custom template for architecture docs
    api: custom_api.md            # Custom template for API docs
```

## Advanced Configuration Options

### Analysis Configuration

```yaml
analysis:
  include:                        # Files/directories to include
    - src/
    - include/
    - README.md
  exclude:                        # Files/directories to exclude
    - node_modules/
    - build/
    - "**/*.test.js"
  depth: 3                        # Analysis depth (1-5)
  focus:                          # Analysis focus areas
    - architecture
    - public_api
  timeout: 300                    # Analysis timeout (seconds)
```

### Diagram Configuration

```yaml
diagrams:
  enabled: true                   # Enable diagram generation
  type: mermaid                   # Diagram type (mermaid, plantuml)
  include:                        # Types of diagrams to generate
    - class
    - sequence
    - component
    - entity_relationship
  style: default                  # Diagram style
  max_complexity: 15              # Max diagram complexity
```

### Compliance Configuration

```yaml
compliance:
  standards:                      # Compliance standards
    - GDPR
    - HIPAA
    - ISO27001
  evidence_collection: true       # Collect compliance evidence
  template: compliance.md         # Compliance template
```

## Using Environment Variables

Configuration values can be overridden with environment variables using the `DOCGEN_` prefix:

```bash
# Override AI service configuration
export DOCGEN_AI_SERVICE=anthropic
export DOCGEN_AI_MODEL=claude-3-haiku

# Override output directory
export DOCGEN_OUTPUT_DIRECTORY=./documentation
```

## Using Command Line Options

Many configuration options can be overridden on the command line:

```bash
# Override output format
docgen generate --format html

# Override AI model
docgen generate --ai-model gpt-4o

# Override documentation types
docgen generate --type architecture --type api
```

## Configuration Inheritance

Configuration can be inherited from multiple sources, in the following order (highest priority first):

1. Command line options
2. Environment variables
3. Project config file (`.docgen/config.yml`)
4. User config file (`~/.docgen/config.yml`)
5. Default configuration

## Configuration Templates

The Documentation Generator provides configuration templates for common project types:

```bash
# Use a predefined template
docgen init --template python-library

# List available templates
docgen init --list-templates
```

Available templates include:
- `python-library`: Documentation for Python libraries
- `node-package`: Documentation for Node.js packages
- `web-application`: Documentation for web applications
- `microservices`: Documentation for microservice architectures
- `compliance-focused`: Documentation with focus on compliance

## Validating Configuration

To validate your configuration:

```bash
docgen config validate
```

This checks your configuration for errors and provides suggestions for improvement.

## Configuration Examples

### Minimal Configuration

```yaml
version: 1.0
project:
  name: "My Project"
output:
  directory: docs
types:
  - architecture
  - code
```

### Comprehensive Configuration

```yaml
version: 1.0
project:
  name: "Enterprise App"
  description: "Enterprise Application Suite"
  repository: "https://github.com/company/enterprise-app"
  version: "2.1.0"
ai:
  service: azure
  model: gpt-4
  temperature: 0.5
output:
  format: markdown
  directory: documentation
  structure:
    architecture: architecture/
    api: api-reference/
    user_guide: guides/
    operations: ops/
  assets:
    directory: assets
    images: img/
    diagrams: diagrams/
types:
  - architecture
  - api
  - user_guide
  - code
  - operations
  - compliance
analysis:
  include:
    - src/
    - api/
    - docs/
  exclude:
    - "**/*.test.js"
    - "**/*.spec.js"
    - node_modules/
  depth: 4
diagrams:
  enabled: true
  type: mermaid
  include:
    - component
    - sequence
    - class
git:
  use_flow: true
  main_branch: main
  develop_branch: develop
```

## Next Steps

- Explore the [Command Reference](commands.md) for detailed command information
- Learn about [Best Practices](best_practices.md) for effective documentation generation
- Understand how to [Customize Templates](../reference/templates.md) for your documentation