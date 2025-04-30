# Documentation Generator Product Documentation

This is the official product documentation for the Documentation Generator, a tool designed to automate the creation and maintenance of comprehensive software documentation.

## Table of Contents

1. [User Guide](user_guide/README.md)
   - [Product Overview](user_guide/overview.md)
   - [Installation](user_guide/installation.md)
   - [Basic Usage](user_guide/basic_usage.md)
   - [Configuration](user_guide/configuration.md)
   - [Command Reference](user_guide/commands.md)
   - [Best Practices](user_guide/best_practices.md)

2. [Process Guide](process_guide/README.md)
   - [TDD Documentation Workflow](process_guide/tdd_workflow.md)
   - [Git Flow Integration](process_guide/git_flow_integration.md)
   - [Documentation Triggers](process_guide/documentation_triggers.md)
   - [Review Process](process_guide/review_process.md)
   - [Compliance Documentation](process_guide/compliance_documentation.md)

## About Documentation Generator

The Documentation Generator is a powerful tool designed to automate the creation and maintenance of comprehensive software documentation. It analyzes your code repository and generates structured, high-quality documentation with minimal manual effort, following a Test-Driven Development (TDD) approach.

### Key Features

- **AI-Powered Analysis**: Automatically analyzes your codebase to extract information
- **Documentation TDD**: Follows a test-driven approach to documentation
- **Git Integration**: Seamlessly integrates with Git and Git Flow
- **Multiple Documentation Types**: Generates architecture, API, user, and compliance documentation
- **Customizable Templates**: Supports custom templates for different documentation needs
- **Review Process**: Built-in review and verification workflows
- **Compliance Support**: Specialized tools for compliance documentation

## Getting Started

If you're new to the Documentation Generator, we recommend starting with:

1. Read the [Product Overview](user_guide/overview.md) to understand key concepts
2. Follow the [Installation](user_guide/installation.md) guide to set up the tool
3. Try the [Basic Usage](user_guide/basic_usage.md) examples to generate your first documentation
4. Explore the [TDD Documentation Workflow](process_guide/tdd_workflow.md) to understand the process

## Documentation Structure

This documentation is organized into two main sections:

### User Guide

The [User Guide](user_guide/README.md) covers how to use the Documentation Generator, including installation, configuration, commands, and best practices. It's focused on practical usage of the tool.

### Process Guide

The [Process Guide](process_guide/README.md) explains the methodology and processes for documentation generation, including the TDD workflow, Git integration, review processes, and compliance documentation. It's focused on the documentation process and methodology.

## Examples

The Documentation Generator can be used for various documentation types:

### Architecture Documentation

```bash
# Generate architecture documentation
docgen generate --type architecture --include-diagrams
```

### API Documentation

```bash
# Generate API documentation
docgen generate --type api --format markdown
```

### User Guides

```bash
# Generate user guides
docgen generate --type user_guide --focus "installation,configuration,usage"
```

### Compliance Documentation

```bash
# Generate compliance documentation
docgen compliance generate --standard GDPR
```

## Support

If you encounter any issues or have questions about the Documentation Generator:

- Check the [Command Reference](user_guide/commands.md) for detailed command information
- Review the [Configuration](user_guide/configuration.md) guide for configuration options
- Explore the [Best Practices](user_guide/best_practices.md) for tips on effective usage

## Contributing

We welcome contributions to the Documentation Generator. Please see our [Contributing Guide](https://github.com/o2alexanderfedin/docgen/blob/master/CONTRIBUTING.md) for more information.