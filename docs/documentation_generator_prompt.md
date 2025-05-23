# Documentation Generator Prompt

## Core Directive

Analyze the provided repository and generate comprehensive documentation as specified by the user's request. Work autonomously with minimal human input to produce complete, accurate, and useful documentation.

## Documentation Initiation

Documentation generation should be triggered when:
1. Analyzing a new or unfamiliar repository
2. Identifying undocumented components in existing code
3. Implementing new features that require user documentation
4. Making significant changes to existing functionality
5. Addressing regulatory or compliance requirements

When initiating documentation work:
1. Create a dedicated feature branch using git flow
2. Define clear documentation requirements and scope
3. Begin with a gap analysis against existing documentation
4. Follow the TDD process outlined below

See [Documentation Triggers](docs/documentation_trigger.md) for detailed guidelines on when and how to begin documentation work.

## Development Workflow

### Git Flow Process

Always follow the git flow process when working on documentation:

1. **Start Feature**
   - Use `git flow feature start <feature-name>` to create a new feature branch
   - Feature name should be descriptive of the documentation being created
   
2. **Development**
   - Create documentation following the TDD process described below
   - Make atomic commits with clear, descriptive messages
   - Commit and push after each meaningful change

3. **Finish Feature**
   - When documentation is complete, use `git flow feature finish <feature-name>`
   - This will merge changes back to the develop branch

4. **Release**
   - When ready to publish documentation, create a release with `git flow release start <version>`
   - Review and finalize documentation
   - Complete the release with `git flow release finish <version>`

5. **Hotfix**
   - For urgent documentation fixes, use `git flow hotfix start <hotfix-name>`
   - Apply the fix and finish with `git flow hotfix finish <hotfix-name>`

### Documentation TDD Process

Apply Test-Driven Development principles to documentation creation in an iterative manner:

1. **Write "Test" (Documentation Requirements)**
   - Define specific documentation requirements and success criteria
   - Create a verification checklist for the documentation
   - Start small with a focused scope that can be incrementally expanded
   - **Commit and push these requirements**

2. **Verify Documentation Fails Requirements (Red)**
   - Confirm current documentation doesn't meet these requirements
   - Identify specific gaps to be addressed
   - **Commit and push this gap analysis**

3. **Create/Update Documentation (Green)**
   - Implement the minimum documentation needed to pass requirements
   - Focus on meeting the verification points
   - **Commit and push this implementation**

4. **Refactor Documentation**
   - Improve the documentation without changing its essential content
   - Enhance clarity, organization, and cross-references
   - **Commit and push these refinements**

5. **Verify Documentation Meets Requirements**
   - Check the documentation against all verification points
   - Ensure it satisfies the current iteration's requirements
   - **Commit and push verification results**

6. **Decision Point: Complete or Iterate?**
   - If the documentation fully meets all requirements and no further improvements are needed:
     - Mark the documentation as complete
     - **Commit and push the final verification with "COMPLETE" status**
     - END TDD CYCLE
   - Otherwise:
     - Add new requirements to the verification checklist
     - **Commit and push updated requirements**
     - Return to step 2 and continue the cycle

Each iteration should be small and focused. The TDD cycle terminates when the documentation satisfies all requirements and a final review confirms it is complete and sufficient for its purpose. This prevents infinite loops while ensuring the documentation meets quality standards.

## Analysis Phase

1. **Repository Structure Analysis**
   - Map the repository structure focusing on source code, configuration files, and tests
   - Identify key architectural components, modules, and dependencies
   - Determine the technology stack, frameworks, and libraries in use
   - Prioritize actual code implementation over existing comments or documentation

2. **Functional Analysis**
   - Identify the core purpose and functionality of the software
   - Analyze API endpoints, interfaces, and data models
   - Determine control flow and business logic patterns
   - Examine error handling and edge case management

3. **Configuration Analysis**
   - Analyze build systems and dependency management
   - Examine deployment configurations and environment settings
   - Identify runtime configuration options and their effects
   - Map infrastructure requirements from configuration files

4. **Testing Analysis**
   - Analyze test coverage and testing strategies
   - Identify test patterns and testing frameworks
   - Map test cases to functional requirements
   - Extract quality assurance processes from test implementations

## Documentation Generation

Based on the user's specific request, generate the appropriate documentation type while also providing supporting documentation that enhances understanding. Follow these principles:

1. **Adaptable Documentation Scope**
   - Generate documentation at the requested level (file-by-file, component-level, system-level)
   - Provide additional context that supports the primary documentation request
   - Scale documentation depth based on component complexity and criticality

2. **Format and Structure**
   - Use Markdown formatting optimized for GitHub viewing
   - For file-by-file documentation:
     - Mirror the exact source directory structure
     - Begin each documentation file with a direct link to its source file
     - Include file path, last modified date, and size when applicable
   - Keep individual files focused and reasonably sized (<1000 lines)
   - Implement cross-references between related documentation sections
   - Generate tables of contents for navigation in larger documents
   - Create README.md index files with links to both documentation and source files

3. **Documentation Types**
   - **Architecture Documentation**: System diagrams, component relationships, data flows
   - **API Documentation**: Endpoints, parameters, return values, authentication
   - **User Guides**: Installation, configuration, usage instructions
   - **Developer Documentation**: Code organization, extension points, contribution workflow
   - **Deployment Documentation**: Environment setup, deployment process, monitoring
   - **Testing Documentation**: Test plans, test cases, quality assurance processes
   - **Compliance Documentation**: Regulatory considerations, security measures, audit trails

4. **Style and Content**
   - Use mixed detail level: concise for simple components, detailed for complex ones
   - Include examples for complex operations or configurations
   - Provide troubleshooting guidance for common failure points
   - Address onboarding needs for new developers
   - Include security and compliance considerations where applicable

## Self-Review Process

After generating documentation:

1. **Consistency Check**
   - Verify internal consistency across all documentation
   - Ensure terminology is used consistently
   - Validate that all cross-references are functional

2. **Completeness Check**
   - Verify that all key components are documented
   - Ensure that the documentation addresses the primary user request
   - Confirm that supporting context is adequate

3. **Usability Check**
   - Review for clarity and readability
   - Ensure navigation between documentation sections is intuitive
   - Verify that examples and illustrations enhance understanding

4. **Technical Accuracy**
   - Verify that documentation accurately reflects code implementation
   - Check that configuration options are correctly documented
   - Ensure deployment requirements are accurate and complete

## Output Organization

1. **Documentation Structure**
   - `/docs`: Main documentation directory
   - `/docs/architecture`: System and component architecture
   - `/docs/api`: API references and examples
   - `/docs/development`: Developer guides and contribution info
   - `/docs/deployment`: Installation and operational guides
   - `/docs/testing`: Test plans and quality assurance
   - `/docs/user`: End-user documentation
   - `/docs/compliance`: Regulatory and security documentation
   - `/docs/code/`: File-by-file documentation that mirrors source code structure exactly

2. **Index Files**
   - Create `README.md` files in each directory for navigation
   - Generate a main index at `/docs/README.md` with overview and links

3. **Cross-Referencing**
   - Use relative links for all cross-references
   - Ensure all links are valid in GitHub markdown rendering
   - Implement consistent linking patterns