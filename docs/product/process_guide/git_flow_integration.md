# Git Flow Integration

This guide explains how the Documentation Generator integrates with the Git Flow branching model to manage documentation changes effectively.

## Introduction to Git Flow for Documentation

Git Flow provides a structured branching model that is particularly well-suited for documentation development:

- **Feature branches** for new documentation sections
- **Develop branch** for integrating documentation changes
- **Release branches** for preparing documentation releases
- **Hotfix branches** for urgent documentation fixes
- **Main branch** for published documentation

The Documentation Generator provides built-in support for Git Flow through the `docgen flow` command set.

## Setting Up Git Flow

### Automatic Setup

The Documentation Generator can automatically set up Git Flow for your repository:

```bash
# Initialize Git Flow with documentation-specific settings
docgen flow init
```

This configures Git Flow with appropriate branch prefixes for documentation.

### Manual Setup

If you prefer to set up Git Flow manually:

```bash
# Initialize Git Flow
git flow init

# Configure branch prefixes
git config gitflow.prefix.feature "docs/"
git config gitflow.prefix.release "docs-release/"
git config gitflow.prefix.hotfix "docs-hotfix/"
```

## Basic Git Flow Commands

The Documentation Generator provides wrapper commands for Git Flow:

```bash
# Start a documentation feature
docgen flow start feature api-docs

# Finish a documentation feature
docgen flow finish feature api-docs

# Start a documentation release
docgen flow start release v1.0.0

# Finish a documentation release
docgen flow finish release v1.0.0

# Start a documentation hotfix
docgen flow start hotfix missing-auth-docs

# Finish a documentation hotfix
docgen flow finish hotfix missing-auth-docs
```

These commands handle both Git Flow operations and documentation-specific tasks.

## Documentation Feature Workflow

The typical workflow for creating new documentation:

### 1. Start a Documentation Feature

```bash
# Start a documentation feature branch
docgen flow start feature architecture-docs
```

This creates a new branch `docs/architecture-docs` based on the `develop` branch.

### 2. Define Documentation Requirements

```bash
# Create documentation requirements
docgen requirements create --name architecture-docs
```

Edit the requirements file to define what the documentation should cover.

### 3. Analyze Documentation Gaps

```bash
# Validate against requirements
docgen validate --requirements architecture-docs
```

This identifies gaps between current documentation and requirements.

### 4. Generate Documentation

```bash
# Generate documentation
docgen generate --requirements architecture-docs
```

This creates or updates documentation to meet the requirements.

### 5. Refactor and Improve

```bash
# Lint and fix documentation
docgen lint --fix
```

Refine the documentation for clarity and consistency.

### 6. Verify Requirements

```bash
# Validate documentation
docgen validate --requirements architecture-docs
```

Verify that the documentation meets all requirements.

### 7. Complete Documentation

```bash
# Mark as complete
docgen requirements status architecture-docs --complete
```

Update the status to indicate completion.

### 8. Finish the Feature

```bash
# Finish the documentation feature
docgen flow finish feature architecture-docs
```

This merges the changes into the `develop` branch and cleans up.

## Documentation Release Workflow

The workflow for releasing documentation:

### 1. Start a Documentation Release

```bash
# Start a documentation release
docgen flow start release v1.0.0
```

This creates a new branch `docs-release/v1.0.0` based on the `develop` branch.

### 2. Prepare Release Documentation

```bash
# Validate all documentation
docgen validate --all

# Generate release notes
docgen generate --type release-notes --version v1.0.0
```

Ensure all documentation is complete and prepare release notes.

### 3. Finish the Release

```bash
# Finish the documentation release
docgen flow finish release v1.0.0
```

This merges the changes into both `main` and `develop` branches, creates a tag, and cleans up.

## Documentation Hotfix Workflow

The workflow for urgent documentation fixes:

### 1. Start a Documentation Hotfix

```bash
# Start a documentation hotfix
docgen flow start hotfix auth-error
```

This creates a new branch `docs-hotfix/auth-error` based on the `main` branch.

### 2. Fix Documentation

```bash
# Generate specific documentation fix
docgen generate --file docs/api/authentication.md
```

Make the necessary corrections to the documentation.

### 3. Finish the Hotfix

```bash
# Finish the documentation hotfix
docgen flow finish hotfix auth-error
```

This merges the changes into both `main` and `develop` branches, creates a tag, and cleans up.

## Automatic Commits

The Documentation Generator can automatically create structured commit messages that follow the documentation TDD workflow:

```bash
# Enable automatic commits
docgen config set git.auto_commit true

# Generate documentation with automatic commits
docgen generate --requirements api-docs --auto-commit
```

This creates commits with standardized messages:

```
RED: Define documentation requirements for API docs
RED: Document gaps in API documentation
GREEN: Create API documentation
REFACTOR: Improve API documentation formatting
VERIFY: Confirm API documentation meets requirements
COMPLETE: Finalize API documentation
```

## Integration with GitHub Flow

If you prefer GitHub Flow over Git Flow, the Documentation Generator also supports that workflow:

```bash
# Enable GitHub Flow mode
docgen config set git.workflow github-flow

# Create a documentation branch
docgen github-flow start api-docs

# Complete documentation
docgen github-flow finish api-docs
```

## Branch Naming Conventions

When using Git Flow for documentation, follow these naming conventions:

- **Feature branches**: `docs/feature-name` or `documentation/feature-name`
- **Release branches**: `docs-release/version` or `release/docs-version`
- **Hotfix branches**: `docs-hotfix/issue-name` or `hotfix/docs-issue-name`

The Documentation Generator automatically applies these conventions.

## Configuration

You can customize the Git Flow integration in your `.docgen/config.yml`:

```yaml
git:
  use_flow: true
  workflow: git-flow  # or github-flow
  main_branch: main
  develop_branch: develop
  prefix:
    feature: docs/
    release: docs-release/
    hotfix: docs-hotfix/
  commit:
    auto: true
    message_template: "{type}: {summary}"
```

## Branch Protection

To ensure documentation quality, consider configuring branch protection rules in your Git repository:

1. Protect the `main` and `develop` branches
2. Require pull request reviews for documentation changes
3. Require status checks that validate documentation
4. Require up-to-date branches before merging

## Handling Documentation Conflicts

When multiple people are working on documentation, conflicts may occur. The Documentation Generator provides tools to help resolve these conflicts:

```bash
# Check for potential conflicts
docgen flow check-conflicts

# Resolve conflicts interactively
docgen flow resolve-conflicts
```

## Best Practices

### 1. Use Feature Branches for Logical Documentation Units

Create feature branches for cohesive documentation units:

```bash
# Good: Specific documentation focus
docgen flow start feature api-authentication-docs

# Avoid: Too broad or vague
docgen flow start feature update-docs
```

### 2. Keep Documentation Branches Short-Lived

Complete documentation tasks quickly to avoid branch divergence:

```bash
# Start feature, complete documentation, finish feature
docgen flow start feature quick-docs
# ... complete documentation ...
docgen flow finish feature quick-docs
```

### 3. Use Meaningful Branch Names

Choose descriptive names that indicate the documentation content:

```bash
# Good: Clear purpose
docgen flow start feature security-compliance-docs

# Avoid: Uninformative names
docgen flow start feature doc-update
```

### 4. Regularly Synchronize with Develop

Keep documentation branches up to date with the develop branch:

```bash
# Update current documentation branch
docgen flow update
```

This helps avoid complex merge conflicts.

## Next Steps

- Learn about [Documentation Triggers](documentation_triggers.md) to understand when to create documentation branches
- Explore the [Review Process](review_process.md) for collaborative documentation development
- Understand [Compliance Documentation](compliance_documentation.md) requirements for regulated environments