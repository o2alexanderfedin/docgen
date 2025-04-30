# Basic Usage Guide

This guide covers the fundamental operations of the Documentation Generator, helping you quickly start generating documentation for your projects.

## Getting Started

After [installing](installation.md) the Documentation Generator, you can start using it with a few simple commands.

## Initializing a Project

Before generating documentation, you need to initialize your project:

```bash
# Navigate to your project root
cd /path/to/your/project

# Initialize documentation
docgen init
```

This creates a `.docgen` directory with default configuration files and templates. The initialization process will:

1. Analyze your repository structure
2. Detect the type of project and technologies used
3. Create appropriate configuration files
4. Set up default documentation templates

## Basic Commands

### Generating Documentation

To generate documentation for your entire project:

```bash
docgen generate
```

This will analyze your repository and create documentation in the output directory specified in your configuration (defaults to `docs/`).

### Generating Specific Documentation Types

You can generate specific types of documentation:

```bash
# Generate architecture documentation
docgen generate --type architecture

# Generate API documentation
docgen generate --type api

# Generate user guide
docgen generate --type user_guide

# Generate code documentation
docgen generate --type code
```

### Previewing Documentation

To preview the generated documentation:

```bash
docgen preview
```

This starts a local server (typically at http://localhost:8000) that serves your documentation as a website.

### Checking Documentation Status

To check the status of your documentation:

```bash
docgen status
```

This shows a report of your documentation coverage, highlighting areas that might need attention.

## Example Workflow

Here's a typical workflow for generating documentation for a project:

1. **Initialize the project**:
   ```bash
   cd /path/to/your/project
   docgen init
   ```

2. **Review and adjust the configuration**:
   ```bash
   # Open the configuration file in your editor
   edit .docgen/config.yml
   ```

3. **Generate documentation**:
   ```bash
   docgen generate
   ```

4. **Preview the results**:
   ```bash
   docgen preview
   ```

5. **Refine the documentation**:
   ```bash
   # Generate with more specific options
   docgen generate --verbose --quality high
   ```

## Working with Git Flow

The Documentation Generator integrates with Git Flow for managing documentation:

```bash
# Start a documentation feature branch
docgen flow start feature document-api

# Work on documentation...

# Finish the feature
docgen flow finish feature document-api
```

This creates and manages Git branches following the Git Flow model.

## Command Structure

Most Documentation Generator commands follow this structure:

```bash
docgen [command] [subcommand] [options]
```

Common commands include:

- `init`: Initialize documentation in a repository
- `generate`: Generate documentation
- `status`: Check documentation status
- `preview`: Preview generated documentation
- `flow`: Work with Git Flow integration
- `config`: Manage configuration
- `validate`: Validate documentation against requirements

## Example: Generating Architecture Documentation

```bash
# Generate architecture documentation with diagrams
docgen generate --type architecture --include-diagrams

# Generate with specific focus
docgen generate --type architecture --focus "system boundaries"
```

## Example: Incremental Documentation

To generate documentation incrementally (for specific files or directories):

```bash
# Document a specific file
docgen generate --file src/main.py

# Document a specific directory
docgen generate --directory src/models

# Document recent changes
docgen generate --changes-since "1 week ago"
```

## Example: Documentation with Requirements

To generate documentation based on specific requirements:

```bash
# Create documentation requirements
docgen requirements create --name api-docs

# Generate documentation based on requirements
docgen generate --requirements api-docs
```

## Interactive Mode

For more guided documentation generation:

```bash
docgen interactive
```

This starts an interactive session that guides you through the documentation process with step-by-step prompts.

## Content Quality Control

To ensure high-quality documentation:

```bash
# Validate documentation against requirements
docgen validate

# Check documentation style
docgen lint

# Fix common documentation issues
docgen lint --fix
```

## Next Steps

Now that you understand the basics, you can:

- Explore [Configuration Options](configuration.md) to customize the output
- Learn about [Command Reference](commands.md) for detailed command information
- Read the [Best Practices](best_practices.md) for effective documentation generation
- Dive into the [Process Guide](../process_guide/README.md) to understand the documentation TDD workflow