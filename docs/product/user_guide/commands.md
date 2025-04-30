# Command Reference

This document provides a comprehensive reference for all commands available in the Documentation Generator CLI.

## Command Structure

The Documentation Generator CLI follows this general command structure:

```bash
docgen [command] [subcommand] [options]
```

## Global Options

These options can be used with any command:

| Option | Description |
|--------|-------------|
| `--help`, `-h` | Show help information |
| `--version`, `-v` | Show version information |
| `--config <file>` | Specify custom configuration file |
| `--verbose` | Enable verbose output |
| `--quiet` | Suppress all output except errors |
| `--log-level <level>` | Set log level (debug, info, warning, error) |
| `--no-color` | Disable colored output |
| `--json` | Output results in JSON format |

## Core Commands

### `docgen init`

Initializes documentation in a repository.

```bash
docgen init [options]
```

| Option | Description |
|--------|-------------|
| `--template <name>` | Use a predefined template |
| `--list-templates` | List available templates |
| `--force` | Overwrite existing configuration |
| `--minimal` | Create minimal configuration |

Examples:
```bash
# Basic initialization
docgen init

# Initialize with a specific template
docgen init --template python-library

# Force initialization in an existing project
docgen init --force
```

### `docgen generate`

Generates documentation based on configuration.

```bash
docgen generate [options]
```

| Option | Description |
|--------|-------------|
| `--type <type>` | Documentation type to generate (can be used multiple times) |
| `--output <dir>` | Output directory |
| `--format <format>` | Output format (markdown, html, pdf) |
| `--file <file>` | Generate documentation for specific file |
| `--directory <dir>` | Generate documentation for specific directory |
| `--changes-since <date/commit>` | Generate documentation for changes since date or commit |
| `--include-diagrams` | Include diagrams in documentation |
| `--quality <level>` | Set quality level (draft, standard, high) |
| `--requirements <file>` | Use specific requirements file |
| `--continue` | Continue generation if errors are encountered |

Examples:
```bash
# Generate all documentation
docgen generate

# Generate specific types
docgen generate --type architecture --type api

# Generate with high quality setting
docgen generate --quality high

# Generate for specific changes
docgen generate --changes-since "last week"
```

### `docgen status`

Checks documentation status and coverage.

```bash
docgen status [options]
```

| Option | Description |
|--------|-------------|
| `--type <type>` | Check specific documentation type |
| `--report <file>` | Save status report to file |
| `--check-links` | Verify documentation links |
| `--threshold <percent>` | Coverage threshold percentage |

Examples:
```bash
# Check overall documentation status
docgen status

# Check specific documentation type with coverage threshold
docgen status --type api --threshold 80

# Generate status report file
docgen status --report status-report.json
```

### `docgen preview`

Previews generated documentation in a local server.

```bash
docgen preview [options]
```

| Option | Description |
|--------|-------------|
| `--port <port>` | Server port (default: 8000) |
| `--host <host>` | Server host (default: localhost) |
| `--directory <dir>` | Documentation directory to serve |
| `--open` | Open in default browser |
| `--watch` | Watch for changes and reload |

Examples:
```bash
# Basic preview
docgen preview

# Preview on specific port with auto-open
docgen preview --port 9000 --open

# Preview with file watching
docgen preview --watch
```

### `docgen validate`

Validates documentation against requirements.

```bash
docgen validate [options]
```

| Option | Description |
|--------|-------------|
| `--requirements <file>` | Specific requirements file |
| `--fix` | Automatically fix issues where possible |
| `--report <file>` | Save validation report to file |
| `--strict` | Treat warnings as errors |

Examples:
```bash
# Basic validation
docgen validate

# Validation with automatic fixes
docgen validate --fix

# Strict validation with custom requirements
docgen validate --requirements custom-reqs.yml --strict
```

### `docgen lint`

Checks and fixes documentation style and formatting.

```bash
docgen lint [options]
```

| Option | Description |
|--------|-------------|
| `--fix` | Automatically fix issues |
| `--rules <rules>` | Specify lint rules to use |
| `--exclude <pattern>` | Exclude files from linting |
| `--config <file>` | Use custom lint configuration |

Examples:
```bash
# Check documentation style
docgen lint

# Auto-fix style issues
docgen lint --fix

# Lint with specific rules
docgen lint --rules "headers,links,code-blocks"
```

## Configuration Commands

### `docgen config`

Manages Documentation Generator configuration.

```bash
docgen config <subcommand> [options]
```

Subcommands:
- `list`: List current configuration
- `get <key>`: Get specific configuration value
- `set <key> <value>`: Set configuration value
- `unset <key>`: Remove configuration value
- `validate`: Validate configuration
- `init`: Re-initialize configuration

Examples:
```bash
# List all configuration
docgen config list

# Get specific configuration value
docgen config get output.format

# Set configuration value
docgen config set ai.temperature 0.5

# Validate configuration
docgen config validate
```

## Git Flow Commands

### `docgen flow`

Manages documentation using Git Flow.

```bash
docgen flow <subcommand> [options]
```

Subcommands:
- `start <type> <name>`: Start a new feature/release/hotfix
- `finish <type> <name>`: Finish a feature/release/hotfix
- `publish <type> <name>`: Publish a feature/release/hotfix
- `status`: Show Git Flow status

Examples:
```bash
# Start a documentation feature
docgen flow start feature api-docs

# Finish a documentation feature
docgen flow finish feature api-docs

# Publish a documentation release
docgen flow publish release v1.0.0
```

## Template Commands

### `docgen template`

Manages documentation templates.

```bash
docgen template <subcommand> [options]
```

Subcommands:
- `list`: List available templates
- `show <name>`: Show template content
- `create <name>`: Create new template
- `edit <name>`: Edit existing template
- `export <name> <file>`: Export template to file
- `import <file> <name>`: Import template from file

Examples:
```bash
# List available templates
docgen template list

# Create new template
docgen template create custom-api-doc

# Export template to file
docgen template export architecture-overview arch-template.md
```

## Advanced Commands

### `docgen requirements`

Manages documentation requirements.

```bash
docgen requirements <subcommand> [options]
```

Subcommands:
- `create <name>`: Create new requirements
- `list`: List existing requirements
- `show <name>`: Show specific requirements
- `validate <name>`: Validate against requirements

Examples:
```bash
# Create new requirements
docgen requirements create api-docs

# List all requirements
docgen requirements list
```

### `docgen analyze`

Performs repository analysis without generating documentation.

```bash
docgen analyze [options]
```

| Option | Description |
|--------|-------------|
| `--depth <level>` | Analysis depth (1-5) |
| `--focus <area>` | Focus area for analysis |
| `--report <file>` | Save analysis report to file |

Examples:
```bash
# Basic repository analysis
docgen analyze

# Deep analysis with focus on architecture
docgen analyze --depth 5 --focus architecture

# Save analysis to file
docgen analyze --report analysis.json
```

### `docgen export`

Exports documentation to various formats.

```bash
docgen export [options]
```

| Option | Description |
|--------|-------------|
| `--format <format>` | Export format (pdf, html, docx) |
| `--output <file>` | Output file or directory |
| `--template <template>` | Export template to use |

Examples:
```bash
# Export to PDF
docgen export --format pdf --output docs.pdf

# Export to HTML website
docgen export --format html --output website/
```

### `docgen sync`

Synchronizes documentation with external systems.

```bash
docgen sync <target> [options]
```

Targets:
- `github`: Sync with GitHub Pages
- `gitlab`: Sync with GitLab Pages
- `confluence`: Sync with Confluence
- `sharepoint`: Sync with SharePoint

Examples:
```bash
# Sync with GitHub Pages
docgen sync github

# Sync with Confluence
docgen sync confluence --space "DOCS" --parent "12345"
```

## Utility Commands

### `docgen version`

Displays version information.

```bash
docgen version [options]
```

| Option | Description |
|--------|-------------|
| `--check` | Check for updates |
| `--json` | Output in JSON format |

### `docgen help`

Displays help information.

```bash
docgen help [command]
```

### `docgen doctor`

Checks and fixes installation issues.

```bash
docgen doctor [options]
```

| Option | Description |
|--------|-------------|
| `--fix` | Attempt to fix issues |
| `--report <file>` | Save diagnostic report to file |

## Plugin Commands

### `docgen plugin`

Manages Documentation Generator plugins.

```bash
docgen plugin <subcommand> [options]
```

Subcommands:
- `list`: List installed plugins
- `install <name>`: Install plugin
- `uninstall <name>`: Uninstall plugin
- `update <name>`: Update plugin
- `info <name>`: Show plugin information

Examples:
```bash
# List all plugins
docgen plugin list

# Install plugin
docgen plugin install docgen-compliance
```

## Next Steps

- Learn how to effectively configure the Documentation Generator in the [Configuration Guide](configuration.md)
- Explore [Best Practices](best_practices.md) for documentation generation
- Understand the [Process Guide](../process_guide/README.md) for documentation workflows