# GitHub CLI Usage

This document provides guidelines on using GitHub CLI (`gh`) in the documentation workflow. GitHub CLI is a command-line tool that brings GitHub to your terminal, making it easier to work with repositories, pull requests, issues, and other GitHub features.

## Installation

### macOS

```bash
brew install gh
```

### Windows

```bash
winget install GitHub.cli
```

### Linux

```bash
# Debian/Ubuntu
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Fedora/RHEL
sudo dnf install gh
```

## Authentication

To use GitHub CLI, you need to authenticate:

```bash
gh auth login
```

Follow the interactive prompts to authenticate with GitHub. You can authenticate using:
- A web browser
- A personal access token
- SSH keys

## Repository Management

### Creating a Repository

```bash
# Create a new repository
gh repo create my-documentation-repo --public --description "Documentation for Project X"

# Create a new repository and clone it locally
gh repo create my-documentation-repo --public --clone
```

### Cloning a Repository

```bash
gh repo clone owner/repository
```

### Working with Submodules

Submodules allow you to keep a Git repository as a subdirectory of another Git repository.

```bash
# Add a submodule
git submodule add https://github.com/owner/repository.git path/to/submodule

# Update submodules after cloning a repository
git submodule update --init --recursive

# Pull changes in all submodules
git submodule update --remote
```

### Repository Status

```bash
# View repository status
gh repo view

# View repository settings
gh repo view --json name,description,visibility
```

## Pull Request Workflow

### Creating Pull Requests

```bash
# Create a PR for the current branch
gh pr create --title "Update API documentation" --body "This PR updates the API documentation with new endpoints"

# Create a PR with labels
gh pr create --title "Add installation guide" --body "Adds detailed installation instructions" --label "documentation,enhancement"
```

### Reviewing Pull Requests

```bash
# List open PRs
gh pr list

# View a specific PR
gh pr view 123

# Checkout a PR locally
gh pr checkout 123

# Add a comment to a PR
gh pr comment 123 --body "This looks good, but could use more examples"
```

### Merging Pull Requests

```bash
# Merge a PR
gh pr merge 123

# Merge with a specific strategy
gh pr merge 123 --squash
```

## Issue Management

### Creating Issues

```bash
# Create a new issue
gh issue create --title "Missing API documentation" --body "The authentication API needs documentation"

# Create with labels and assignees
gh issue create --title "Update diagrams" --body "Sequence diagrams need updating" --label "documentation" --assignee "username"
```

### Working with Issues

```bash
# List open issues
gh issue list

# View a specific issue
gh issue view 456

# Close an issue
gh issue close 456

# Reopen an issue
gh issue reopen 456
```

## Automation Tasks

### Workflow Management

```bash
# List GitHub Actions workflows
gh workflow list

# View workflow details
gh workflow view "Documentation CI"

# Run a workflow manually
gh workflow run "Documentation CI"
```

### Release Management

```bash
# Create a new release
gh release create v1.0.0 --title "Version 1.0.0" --notes "Initial documentation release"

# Upload assets to a release
gh release upload v1.0.0 ./documentation.pdf
```

## Documentation-Specific Tasks

### Generating Documentation Sites

```bash
# Build and deploy documentation to GitHub Pages
gh workflow run "Deploy docs" -f version=v1.0.0
```

### Automating Documentation Checks

```bash
# Run link checker workflow
gh workflow run "Check links"

# Run spell checker
gh workflow run "Spell check"
```

### Managing Documentation Issues

```bash
# Create a documentation issue from a template
gh issue create --template "documentation_request.md"

# List all documentation issues
gh issue list --label "documentation"
```

## Tips for Documentation Workflows

1. **Automating repetitive tasks**:
   ```bash
   # Create a shell function to create standardized documentation PRs
   function docpr() {
     gh pr create --title "Docs: $1" --body "This PR updates documentation for $1" --label "documentation"
   }
   ```

2. **Batch operations**:
   ```bash
   # Close all documentation issues that have been completed
   gh issue list --label "documentation,completed" --json number --jq '.[] | .number' | xargs -I{} gh issue close {}
   ```

3. **Generating reports**:
   ```bash
   # Generate a report of documentation contributions
   gh pr list --search "label:documentation merged:>=2023-01-01" --json number,title,author --jq '.[] | [.number, .title, .author.login] | @csv' > doc_contributions.csv
   ```

## Best Practices

1. **Use standardized labels** for documentation-related issues and PRs (e.g., "documentation", "tech-writing").

2. **Create issue templates** for common documentation requests to ensure all necessary information is provided.

3. **Set up documentation-specific CI workflows** to check for broken links, spelling errors, and formatting issues.

4. **Use branch protection rules** for documentation repositories to ensure quality through code reviews.

5. **Leverage GitHub Projects** to track documentation tasks and progress.

## Reference

- [GitHub CLI official documentation](https://cli.github.com/manual/)
- [Git Submodule documentation](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [GitHub Actions documentation](https://docs.github.com/en/actions)