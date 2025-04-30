# Example Documentation Generator Usage

## Example 1: File-by-File Documentation

**User Request:** "Generate file-by-file documentation for this repository"

**Execution Flow:**
1. The documentation generator analyzes the repository structure
2. It identifies meaningful source files (excluding auto-generated files, etc.)
3. For each file, it creates a corresponding documentation file that includes:
   - Direct link/reference to the source file in the repository
   - Purpose of the file
   - Key functions/classes/interfaces
   - Dependencies and relationships
   - Usage examples where appropriate
4. It generates index files that mirror the source directory structure
5. It self-reviews the documentation for accuracy and completeness

**Output:**
- Documentation structure mirrors the source code structure exactly
- For example, if a source file is at `/src/components/Button.js`:
  - Its documentation will be at `/docs/code/src/components/Button.md`
  - The documentation begins with a link to the source: `[Source File](/src/components/Button.js)`
- Each directory gets a README.md index file:
  - `/docs/code/README.md` (main index)
  - `/docs/code/src/README.md` (src directory index)
  - `/docs/code/src/components/README.md` (components directory index)
- Index files include links to both documentation and source files
- This 1:1 mapping with source references makes finding and relating documentation to code intuitive

## Example 2: System Architecture Documentation

**User Request:** "Document the system architecture"

**Execution Flow:**
1. The documentation generator identifies key components, modules, and services
2. It analyzes interfaces between components
3. It determines the data flow and control flow
4. It creates architectural diagrams (described in markdown)
5. It documents key design patterns and architectural decisions
6. It self-reviews for accuracy and completeness

**Output:**
- `/docs/architecture/README.md` (overview)
- `/docs/architecture/components.md` (component breakdown)
- `/docs/architecture/data_flow.md` (data interactions)
- `/docs/architecture/design_patterns.md` (patterns used)
- `/docs/architecture/interfaces.md` (API and interface documentation)

## Example 3: Test Plan Documentation

**User Request:** "Document test plans"

**Execution Flow:**
1. The documentation generator analyzes test directories and files
2. It identifies testing frameworks and methodologies in use
3. It maps tests to functional components
4. It documents testing strategies (unit, integration, e2e, etc.)
5. It identifies test coverage and potential gaps
6. It creates testing documentation with examples
7. It self-reviews for accuracy and completeness

**Output:**
- `/docs/testing/README.md` (overview)
- `/docs/testing/strategies.md` (testing approaches)
- `/docs/testing/framework.md` (testing infrastructure)
- `/docs/testing/test_cases.md` (key test scenarios)
- `/docs/testing/coverage.md` (coverage analysis)
- `/docs/testing/running_tests.md` (how to execute tests)