# Documentation Triggers

This guide explains when documentation should be generated or updated using the Documentation Generator.

## What Are Documentation Triggers?

Documentation triggers are events or conditions that indicate when documentation should be created, updated, or verified. These triggers help ensure documentation remains synchronized with code and accurately reflects the current state of your project.

## Key Documentation Triggers

### 1. New Feature Development

Trigger documentation generation when developing new features:

```bash
# Start documentation for a new feature
docgen flow start feature user-auth-docs

# After implementing the feature
docgen generate --changes-since "feature branch creation"
```

**Best Practice**: Create documentation requirements at the beginning of feature development, then implement documentation alongside code.

### 2. Significant Code Changes

Update documentation when making significant changes to existing code:

```bash
# Generate documentation for recent changes
docgen generate --changes-since "2 weeks ago"

# Generate documentation for specific changed files
docgen generate --files-changed
```

**Best Practice**: Configure thresholds for what constitutes a "significant" change (e.g., >20% change in a component).

### 3. API Changes

Generate updated API documentation when APIs change:

```bash
# Check for API changes
docgen detect-changes --type api

# Generate updated API documentation
docgen generate --type api --changed-only
```

**Best Practice**: Use API version increments as explicit triggers for documentation updates.

### 4. Architecture Changes

Update architecture documentation when system design changes:

```bash
# Generate updated architecture documentation
docgen generate --type architecture --focus "system components"
```

**Best Practice**: Create Architecture Decision Records (ADRs) for significant design changes.

### 5. Version Releases

Generate comprehensive documentation before releases:

```bash
# Start a documentation release
docgen flow start release v1.0-docs

# Generate complete documentation
docgen generate --all

# Generate release notes
docgen generate --type release-notes --version v1.0.0
```

**Best Practice**: Include documentation reviews in your release checklist.

### 6. Bug Fixes Affecting Documentation

Update documentation when fixing bugs that affect documented behavior:

```bash
# Generate documentation for files affected by bug fixes
docgen generate --type user_guide --files-affected
```

**Best Practice**: Add documentation checks to bug fix templates.

### 7. Compliance Requirements

Generate or update compliance documentation when regulations or requirements change:

```bash
# Generate compliance documentation
docgen generate --type compliance --standard ISO27001
```

**Best Practice**: Schedule regular compliance documentation reviews.

### 8. User Feedback

Update documentation based on user feedback or support requests:

```bash
# Create documentation task based on feedback
docgen requirements create --name user-feedback-docs

# Generate documentation to address feedback
docgen generate --requirements user-feedback-docs
```

**Best Practice**: Maintain a feedback log that links user questions to documentation improvements.

## Automated Documentation Triggers

The Documentation Generator can be configured to automatically detect and respond to triggers:

### Git Hook Integration

Set up Git hooks to automatically trigger documentation generation:

```bash
# Install Git hooks
docgen hooks install

# Configure hooks
docgen hooks configure --trigger-on commit
```

This creates hooks that check for documentation needs on commit or push.

### CI/CD Integration

Configure your CI/CD pipeline to check for documentation needs:

```yaml
# GitHub Actions Example
name: Documentation Check
on: [push, pull_request]
jobs:
  check-docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - name: Check documentation needs
        run: docgen detect-changes
      - name: Generate documentation if needed
        if: steps.detect-changes.outputs.needs_update == 'true'
        run: docgen generate --changes-only
```

### Repository Scanning

Schedule regular scans of your repository to detect documentation needs:

```yaml
# GitHub Actions Example
name: Documentation Scan
on:
  schedule:
    - cron: '0 0 * * 0'  # Weekly on Sunday
jobs:
  scan-docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Scan for documentation needs
        run: docgen status --report status.json
      - name: Create issues for documentation gaps
        run: docgen create-issues --from-status status.json
```

## Configuring Documentation Triggers

Configure trigger behavior in `.docgen/config.yml`:

```yaml
triggers:
  auto_detect: true
  on_commit: true
  on_push: true
  on_pull_request: true
  thresholds:
    code_change_percent: 20
    api_changes: any
    architecture_changes: major
  notifications:
    slack: true
    email: false
    issues: true
```

## Trigger Notifications

Configure notifications when documentation needs are detected:

```yaml
notifications:
  slack:
    enabled: true
    webhook: "https://hooks.slack.com/services/..."
    channel: "#documentation"
  email:
    enabled: true
    recipients: ["team@example.com"]
  issues:
    enabled: true
    labels: ["documentation", "needs-update"]
```

## Manual Trigger Check

Check if documentation updates are needed:

```bash
# Check if documentation needs updating
docgen detect-changes

# Generate report of documentation needs
docgen status --report doc-status.json
```

## Best Practices for Documentation Triggers

### 1. Define Clear Trigger Criteria

Establish specific criteria for when documentation should be updated:

```yaml
# .docgen/triggers.yml
triggers:
  - name: api_change
    condition: "files_changed('api/**/*.js') or files_changed('routes/**/*.js')"
    action: "generate --type api"
  - name: architecture_change
    condition: "files_changed('src/core/**/*')"
    action: "generate --type architecture"
```

### 2. Align with Development Workflow

Integrate documentation triggers with your existing workflow:

- Link documentation tasks to user stories or issues
- Include documentation in definition of done
- Add documentation checkpoints to code reviews

### 3. Prioritize Documentation Updates

Not all triggers require immediate action. Prioritize updates based on:

- User impact
- Compliance requirements
- Release schedules
- Resource availability

### 4. Regular Documentation Audits

Schedule regular documentation audits regardless of other triggers:

```bash
# Scheduled comprehensive documentation check
docgen audit --comprehensive
```

### 5. Track Documentation Debt

Maintain a log of deferred documentation tasks:

```bash
# Log documentation debt
docgen debt-log add "Update authentication flow diagrams"

# Review documentation debt
docgen debt-log list

# Prioritize documentation debt
docgen debt-log prioritize
```

## Common Trigger Scenarios

### New API Endpoint

When a new API endpoint is added:

```bash
# Detect API changes
docgen detect-changes --type api

# Generate documentation for new endpoint
docgen generate --type api --endpoint-path "/api/v1/users"
```

### Configuration Option Changes

When configuration options change:

```bash
# Generate updated configuration documentation
docgen generate --type configuration --files-changed
```

### Database Schema Changes

When database schemas are modified:

```bash
# Generate updated data model documentation
docgen generate --type data-model --schema-changes
```

### Security Updates

When security-related changes are made:

```bash
# Generate updated security documentation
docgen generate --type security --urgent
```

## Conclusion

Effective documentation triggers ensure that documentation evolves alongside your code, maintaining accuracy and relevance. By configuring appropriate triggers and integrating them into your development workflow, you can ensure documentation is always up-to-date and valuable to users.

## Next Steps

- Explore the [Review Process](review_process.md) to understand how to verify documentation quality
- Learn about [Compliance Documentation](compliance_documentation.md) for specific regulatory requirements