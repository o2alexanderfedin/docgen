# Compliance Documentation

This guide explains how to use the Documentation Generator to create and maintain compliance documentation for regulated environments.

## Introduction to Compliance Documentation

Compliance documentation provides evidence that a system meets regulatory requirements, industry standards, or organizational policies. It typically addresses:

- Security controls
- Data handling practices
- Risk management
- System operations
- Audit trails
- Testing and validation

The Documentation Generator offers specialized tools for generating and maintaining compliance documentation.

## Supported Compliance Standards

The Documentation Generator supports documentation for various compliance standards:

```bash
# List supported compliance standards
docgen compliance list-standards
```

Supported standards include:

- **GDPR**: General Data Protection Regulation
- **HIPAA**: Health Insurance Portability and Accountability Act
- **ISO 27001**: Information Security Management
- **SOC 2**: Service Organization Control 2
- **PCI DSS**: Payment Card Industry Data Security Standard
- **NIST 800-53**: Security and Privacy Controls
- **FDA 21 CFR Part 11**: Electronic Records for Life Sciences
- **CMMC**: Cybersecurity Maturity Model Certification

## Compliance Documentation Workflow

### 1. Define Compliance Requirements

Begin by defining compliance requirements:

```bash
# Initialize compliance documentation for a standard
docgen compliance init --standard ISO27001

# Add custom compliance requirements
docgen compliance requirements add --name data-handling
```

This creates a compliance requirements file:

```yaml
# .docgen/compliance/iso27001.yml
standard: ISO27001
version: "2013"
sections:
  - id: A.5
    name: "Information Security Policies"
    requirements:
      - id: A.5.1.1
        name: "Policies for information security"
        description: "A set of policies for information security shall be defined, approved by management, published and communicated to employees and relevant external parties."
        documentation_required:
          - "Security policy document"
          - "Evidence of approval"
          - "Distribution records"
  # Additional sections and requirements...
```

### 2. Assess Documentation Gaps

Analyze your current documentation against compliance requirements:

```bash
# Assess compliance documentation gaps
docgen compliance assess --standard ISO27001

# Generate gap analysis report
docgen compliance report --type gap-analysis --output gaps.md
```

This identifies missing or inadequate documentation.

### 3. Generate Compliance Documentation

Generate the required compliance documentation:

```bash
# Generate all compliance documentation
docgen compliance generate --standard ISO27001

# Generate specific compliance section
docgen compliance generate --standard ISO27001 --section A.5
```

The Documentation Generator will:
1. Analyze your codebase for compliance-relevant information
2. Extract security configurations and controls
3. Document data handling practices
4. Generate appropriate evidence documents
5. Create traceability matrices

### 4. Collect Supporting Evidence

Collect evidence to support compliance claims:

```bash
# Collect compliance evidence
docgen compliance evidence collect --standard ISO27001

# Link evidence to requirements
docgen compliance evidence link --requirement A.5.1.1 --file policies/security-policy.pdf
```

Evidence can include:
- Configuration files
- Log samples
- Test results
- Screenshots
- Policies and procedures

### 5. Review and Validate

Review and validate the compliance documentation:

```bash
# Validate compliance documentation
docgen compliance validate --standard ISO27001

# Run compliance checks
docgen compliance check --standard ISO27001
```

This verifies that documentation meets the compliance requirements.

### 6. Generate Compliance Report

Generate a comprehensive compliance report:

```bash
# Generate compliance report
docgen compliance report --standard ISO27001 --output compliance-report.md

# Generate executive summary
docgen compliance report --type executive-summary --output summary.md
```

## Compliance Templates

The Documentation Generator provides templates for common compliance documents:

```bash
# List available compliance templates
docgen compliance templates list

# Create documentation using a specific template
docgen compliance generate --template gdpr-dpia
```

Available templates include:
- Data Protection Impact Assessments (DPIA)
- System Security Plans (SSP)
- Privacy Policies
- Information Security Policies
- Incident Response Plans
- Risk Assessments
- Audit Reports

## Customizing Compliance Documentation

Customize compliance documentation for your organization:

```bash
# Create custom compliance template
docgen compliance template create --name custom-security-plan

# Customize compliance requirements
docgen compliance requirements customize --standard ISO27001
```

Customization options include:
- Organization-specific terminology
- Custom evidence requirements
- Additional compliance checks
- Organization-specific controls

## Traceability Matrices

Generate traceability matrices to map requirements to implementation:

```bash
# Generate traceability matrix
docgen compliance traceability --standard ISO27001 --output traceability.md
```

The matrix shows:
- Compliance requirements
- Corresponding documentation
- Supporting evidence
- Implementation details
- Verification status

```markdown
## ISO 27001 Traceability Matrix

| Requirement ID | Requirement            | Documentation               | Evidence                 | Status      |
|----------------|------------------------|----------------------------|--------------------------|-------------|
| A.5.1.1        | Security Policy        | [Security Policy](link)    | [Approval Email](link)   | ✅ Complete |
| A.8.2.3        | Media Handling         | [Data Handling](link)      | [Procedures Doc](link)   | ✅ Complete |
| A.12.4.1       | Event Logging          | [Logging Policy](link)     | [Log Samples](link)      | ⚠️ Partial  |
| A.18.2.2       | Compliance Review      | -                          | -                        | ❌ Missing  |
```

## Evidence Collection

The Documentation Generator can automatically collect evidence:

```bash
# Collect code-based evidence
docgen compliance evidence collect --type code

# Collect configuration evidence
docgen compliance evidence collect --type configuration

# Collect test result evidence
docgen compliance evidence collect --type test-results
```

Evidence is organized in an evidence repository:

```
evidence/
  iso27001/
    A.5/
      security-policy.pdf
      approval-email.eml
      distribution-list.csv
    A.8/
      data-classification-scheme.md
      media-handling-procedures.md
      ...
```

## Compliance Monitoring

Monitor compliance status over time:

```bash
# Set up compliance monitoring
docgen compliance monitor --standard ISO27001 --interval weekly

# Generate compliance status dashboard
docgen compliance dashboard --output dashboard.html
```

This helps maintain continuous compliance by highlighting:
- Documentation drift
- New requirements
- Evidence expirations
- Compliance gaps

## Audit Preparation

Prepare for compliance audits:

```bash
# Generate audit preparation package
docgen compliance audit-prep --standard ISO27001 --output audit-package/

# Generate audit response templates
docgen compliance audit-response --standard ISO27001
```

The audit package includes:
- Organized documentation
- Evidence mapping
- Response templates
- Traceability matrices

## Versioning and History

Maintain a history of compliance documentation:

```bash
# Create versioned compliance snapshot
docgen compliance snapshot --standard ISO27001 --version v1.0

# View compliance history
docgen compliance history --standard ISO27001

# Compare compliance snapshots
docgen compliance compare --from v1.0 --to v2.0
```

This helps demonstrate compliance over time and track changes.

## Compliance Reports

Generate different types of compliance reports:

```bash
# Generate detailed compliance report
docgen compliance report --type detailed --standard ISO27001

# Generate executive summary
docgen compliance report --type executive-summary --standard ISO27001

# Generate gap analysis
docgen compliance report --type gap-analysis --standard ISO27001

# Generate evidence inventory
docgen compliance report --type evidence-inventory --standard ISO27001
```

## Risk Assessment Integration

Integrate compliance documentation with risk assessments:

```bash
# Generate risk assessment
docgen compliance risk-assessment --standard ISO27001

# Link risks to compliance controls
docgen compliance risk-link --risk data-breach --control A.8.2.3
```

This demonstrates how compliance controls mitigate identified risks.

## Compliance Configuration

Configure compliance documentation generation in `.docgen/compliance/config.yml`:

```yaml
compliance:
  standards:
    - iso27001:
        version: "2013"
        sections: all
    - hipaa:
        version: "2013"
        sections: [164.308, 164.312]
  evidence:
    collection: automatic
    repository: evidence/
    retention: 7 years
  reporting:
    format: markdown
    include_evidence: true
  customization:
    organization_name: "Acme Corp"
    templates_directory: .docgen/compliance/templates/
```

## Best Practices

### 1. Integrate with Development Workflow

Integrate compliance documentation with your development workflow:

```bash
# Check compliance on pull requests
docgen compliance check --ci

# Update compliance documentation for changes
docgen compliance update --changes-only
```

### 2. Maintain Evidence Repository

Organize and maintain a structured evidence repository:

```bash
# Validate evidence repository
docgen compliance evidence validate

# Update evidence repository
docgen compliance evidence update
```

### 3. Regular Compliance Updates

Update compliance documentation regularly:

```bash
# Set up scheduled compliance updates
docgen compliance schedule --interval monthly

# Generate compliance update report
docgen compliance report --type update-summary
```

### 4. Cross-Reference Implementation

Link compliance documentation to implementation details:

```bash
# Generate implementation traceability
docgen compliance trace-implementation --standard ISO27001

# Link compliance requirements to code
docgen compliance trace-code --requirement A.12.4.1
```

### 5. Compliance as Code

Treat compliance documentation as code:

- Version control all compliance documentation
- Review changes through pull requests
- Automatically test compliance assertions
- Deploy updated compliance documentation through CI/CD

## Example: GDPR Documentation

```bash
# Initialize GDPR compliance documentation
docgen compliance init --standard GDPR

# Generate data processing documentation
docgen compliance generate --standard GDPR --section "data-processing"

# Generate data protection impact assessment
docgen compliance generate --template gdpr-dpia

# Generate data subject rights procedures
docgen compliance generate --standard GDPR --section "data-subject-rights"

# Validate GDPR compliance
docgen compliance validate --standard GDPR
```

## Example: HIPAA Documentation

```bash
# Initialize HIPAA compliance documentation
docgen compliance init --standard HIPAA

# Generate security rule documentation
docgen compliance generate --standard HIPAA --section 164.308

# Generate technical safeguards documentation
docgen compliance generate --standard HIPAA --section 164.312

# Collect HIPAA evidence
docgen compliance evidence collect --standard HIPAA

# Validate HIPAA compliance
docgen compliance validate --standard HIPAA
```

## Next Steps

- Explore the [User Guide](../user_guide/README.md) for more information on using the Documentation Generator
- Learn about [Integration Options](../integration_guide/README.md) for your development environment