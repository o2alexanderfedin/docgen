# TDD Documentation Workflow

This guide explains the Test-Driven Documentation (TDD) workflow used by the Documentation Generator.

## Core Concept

Test-Driven Documentation follows the "Red-Green-Refactor" cycle from Test-Driven Development, but applies it to documentation:

1. **Red**: Define requirements and confirm documentation doesn't meet them
2. **Green**: Create documentation that satisfies the requirements
3. **Refactor**: Improve the documentation while maintaining its functionality

## Detailed Workflow

### 1. Write Documentation Requirements ("Tests")

Start by defining the specific requirements for the documentation you're creating:

```bash
# Create documentation requirements
docgen requirements create --name api-docs
```

This creates a requirements file (`.docgen/requirements/api-docs.yml`) where you define what the documentation should cover:

```yaml
# Documentation Requirements for API Reference
name: api-docs
description: "API documentation for the payment service"
sections:
  - title: "Authentication"
    required: true
    description: "Must cover API keys, OAuth, and JWT authentication"
  - title: "Endpoints"
    required: true
    description: "Must document all public endpoints with parameters and responses"
  - title: "Error Handling"
    required: true
    description: "Must include error codes and remediation steps"
  - title: "Rate Limiting"
    required: true
    description: "Must document rate limits and throttling behavior"
  - title: "Versioning"
    required: false
    description: "Should explain API versioning strategy"
verification_criteria:
  - "All required sections are present"
  - "Each endpoint has examples in JSON and curl format"
  - "Response schemas are fully documented"
  - "Security considerations are addressed"
```

You can also manually create a markdown file with the requirements:

```markdown
## Documentation Requirements for API Reference

The documentation must:
- [ ] Cover authentication methods (API keys, OAuth, JWT)
- [ ] Document all public endpoints with parameters and responses
- [ ] Include error codes and remediation steps
- [ ] Explain rate limits and throttling behavior
- [ ] Describe API versioning strategy (optional)

Verification Criteria:
1. All required sections are present
2. Each endpoint has examples in JSON and curl format
3. Response schemas are fully documented
4. Security considerations are addressed
```

### 2. Verify Documentation Fails Requirements (Red)

Assess the current state of documentation against your requirements:

```bash
# Check documentation against requirements
docgen validate --requirements api-docs
```

This will generate a gap analysis showing what's missing:

```
Gap Analysis for API Reference Documentation:
✘ Authentication section missing
✘ Endpoints section incomplete (3/15 endpoints documented)
✘ Error Handling section missing
✘ Rate Limiting section missing
✓ Versioning section present (optional)

Documentation does NOT meet requirements.
```

You can also manually create a gap analysis document:

```markdown
## Gap Analysis for API Reference Documentation

Missing requirements:
- No Authentication section
- Endpoints section incomplete (only 3 of 15 endpoints documented)
- No Error Handling section
- No Rate Limiting section
- Versioning section is present (meets optional requirement)

Current documentation fails to meet 4 of 5 requirements.
```

This step establishes what needs to be done and confirms you're not duplicating existing content.

### 3. Create/Update Documentation (Green)

Generate the documentation to meet the requirements:

```bash
# Generate documentation to meet requirements
docgen generate --type api --requirements api-docs
```

The Documentation Generator will:
1. Analyze your codebase to identify API endpoints, authentication methods, etc.
2. Generate documentation that addresses the requirements
3. Include necessary examples, diagrams, and explanations

The generated documentation will be written to the configured output directory (e.g., `docs/api/`).

### 4. Refactor Documentation

Improve the documentation while maintaining its content:

```bash
# Lint documentation and fix issues
docgen lint --fix
```

You can also manually refine the documentation:
- Enhance formatting and organization
- Improve clarity of explanations
- Add cross-references
- Ensure consistent terminology
- Organize information more logically

### 5. Verify Requirements Are Met

Check the documentation against your requirements:

```bash
# Validate documentation against requirements
docgen validate --requirements api-docs
```

This will report on whether the documentation now meets the requirements:

```
Validation for API Reference Documentation:
✓ Authentication section present
✓ Endpoints section complete (15/15 endpoints documented)
✓ Error Handling section present
✓ Rate Limiting section present
✓ Versioning section present (optional)

All verification criteria met:
✓ All required sections are present
✓ Each endpoint has examples in JSON and curl format
✓ Response schemas are fully documented
✓ Security considerations are addressed

Documentation meets all requirements!
```

You can also manually update your requirements checklist:

```markdown
## Documentation Requirements for API Reference

The documentation now:
- [x] Covers authentication methods (API keys, OAuth, JWT)
- [x] Documents all public endpoints with parameters and responses
- [x] Includes error codes and remediation steps
- [x] Explains rate limits and throttling behavior
- [x] Describes API versioning strategy (optional)

All requirements have been met.
```

### 6. Decision Point: Complete or Iterate?

After verification, decide if the documentation is complete or if new requirements should be added:

#### If Complete:

```bash
# Mark documentation as complete
docgen requirements status api-docs --complete
```

This updates the status in the requirements file:

```yaml
# Documentation Requirements for API Reference
name: api-docs
status: COMPLETE
completed_date: "2024-04-30"
# ...
```

You can also manually add a completion status:

```markdown
# API Reference Documentation

Status: ✅ COMPLETE

The API Reference documentation has been successfully completed. All required sections have been created and verified against the original requirements.
```

#### If Further Iteration Needed:

Add new requirements and repeat the cycle:

```bash
# Update requirements with new sections
docgen requirements update api-docs --add-section "Webhooks"
```

Or manually update your requirements:

```markdown
## Additional Documentation Requirements for API Reference

The documentation must also:
- [ ] Document webhook events and payloads
- [ ] Explain webhook security best practices
- [ ] Provide webhook testing tools information
```

## Workflow Automation

The Documentation TDD workflow can be automated with the Documentation Generator:

```bash
# Run the complete TDD cycle
docgen tdd --requirements api-docs --auto-commit
```

This will:
1. Check for existing documentation against requirements
2. Generate documentation to meet requirements
3. Refactor the documentation
4. Verify requirements are met
5. Commit changes with appropriate messages
6. Update the requirements status

## Commit Guidelines

Each step in the TDD cycle should be committed separately:

1. **RED** - Commit requirements definition and gap analysis:
   ```bash
   git commit -m "RED: Define documentation requirements for API Reference"
   ```

2. **GREEN** - Commit documentation implementation:
   ```bash
   git commit -m "GREEN: Implement API Reference documentation"
   ```

3. **REFACTOR** - Commit documentation improvements:
   ```bash
   git commit -m "REFACTOR: Improve API Reference documentation formatting and clarity"
   ```

4. **VERIFY** - Commit verification results:
   ```bash
   git commit -m "VERIFY: Confirm API Reference documentation meets requirements"
   ```

5. **COMPLETE/ITERATE** - Commit completion status or new requirements:
   ```bash
   git commit -m "COMPLETE: Finalize API Reference documentation"
   # or
   git commit -m "ITERATE: Add webhook documentation requirements for API Reference"
   ```

## Example TDD Documentation Workflow

Here's a complete example workflow:

1. **Define Requirements**:
   ```bash
   docgen requirements create --name architecture-docs
   # Edit requirements
   docgen commit --message "RED: Define documentation requirements for system architecture"
   ```

2. **Analyze Gaps**:
   ```bash
   docgen validate --requirements architecture-docs
   docgen commit --message "RED: Document gaps in system architecture documentation"
   ```

3. **Generate Documentation**:
   ```bash
   docgen generate --requirements architecture-docs
   docgen commit --message "GREEN: Create system architecture documentation"
   ```

4. **Improve Documentation**:
   ```bash
   docgen lint --fix
   docgen commit --message "REFACTOR: Improve system architecture documentation clarity"
   ```

5. **Verify Requirements**:
   ```bash
   docgen validate --requirements architecture-docs
   docgen commit --message "VERIFY: Confirm system architecture documentation meets requirements"
   ```

6. **Complete Documentation**:
   ```bash
   docgen requirements status architecture-docs --complete
   docgen commit --message "COMPLETE: Finalize system architecture documentation"
   ```

## Benefits of Documentation TDD

- **Purpose-Driven**: Documentation meets specific, predefined needs
- **Measurable**: Documentation progress can be quantified
- **Incremental**: Documentation is developed in manageable iterations
- **Verified**: Documentation is validated against requirements
- **Tracked**: Documentation history is preserved with meaningful commits
- **Transparent**: Documentation status is clear and visible

## Next Steps

- Explore [Git Flow Integration](git_flow_integration.md) to see how documentation TDD works with branch-based development
- Understand [Documentation Triggers](documentation_triggers.md) to know when to start the TDD cycle
- Learn about the [Review Process](review_process.md) for collaborative documentation development