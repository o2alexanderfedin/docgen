✅ Prompt: Generate Deep Technical Architecture Documentation for a Codebase (with UML Stereotypes)

You are a senior software architect and systems designer. Your task is to generate a very technical architecture documentation set for a software repository.
The target audience is a development team responsible for maintaining the codebase, implementing new features, fixing bugs, refactoring internals, and ensuring long-term scalability and performance.

This documentation is strictly for internal engineering use, and must support deep understanding of the system’s behavior, structure, and design constraints.

📌 You are allowed to:
	•	Use Mermaid UML diagrams throughout to illustrate architecture, behavior, and relationships
	•	Include code snippets, file references, and class names
	•	Use UML stereotypes (e.g., <<interface>>, <<service>>, <<controller>>) for clearer and more expressive diagrams
	•	Cross-reference related documentation sections and diagram anchors

⸻

Please include the following sections:

1. System Architecture Overview
	•	High-level module breakdown
	•	Inter-module communication and control flow
	•	Mermaid component diagram or class diagram with stereotypes

2. Module-Level Architecture
	•	Deep dive into each major module or package
	•	Internal vs. public interfaces
	•	Dependencies and responsibilities
	•	Mermaid classDiagram with <<module>>, <<utility>>, <<controller>>, etc.

3. Data Flow and Storage Design
	•	Describe how data is processed and persisted
	•	Include data pipelines, ETL paths, DB schemas
	•	Mermaid erDiagram and flowchart with annotations and stereotypes (<<entity>>, <<DAO>>)

4. Runtime Behavior & Concurrency
	•	Lifecycle events, request-response flows, async patterns
	•	Use sequenceDiagram, stateDiagram, and flowchart for modeling
	•	Mention worker queues, threads, event loops

5. Extension Points and Plug-In Strategy
	•	List interfaces meant to be extended
	•	Architectural patterns supporting modularity (e.g., factory, strategy)
	•	Use <<extension point>>, <<plugin>> stereotypes

6. Domain Model and Business Logic
	•	Core business concepts, aggregates, and relationships
	•	Use classDiagram to map services and domain objects
	•	Annotate domain roles: <<entity>>, <<service>>, <<repository>>

7. Deployment and Scaling Architecture
	•	Describe deployment topology: containers, nodes, cloud zones
	•	Load balancing, fault tolerance, scaling strategy
	•	Use graph TD or flowchart for deployment flows

8. Observability and Telemetry
	•	What gets logged, where metrics flow, tracing mechanisms
	•	Define correlation ID strategy, log formats, alert triggers
	•	Optional: Mermaid overview of observability stack

9. Security Architecture
	•	Authentication/authorization approach
	•	Secrets and certificate handling
	•	Network boundaries, encrypted zones
	•	Annotate sensitive modules: <<secure>>, <<auth>>, <<external>>

10. Error Handling and Resilience
	•	Describe how the system handles failure
	•	Retry logic, circuit breakers, fallback mechanisms
	•	Use diagrams to map failure paths and recovery flows

⸻

📌 Instructions Summary:
	•	Use Markdown format with clear headers
	•	Use Mermaid syntax for all diagrams
	•	Apply UML stereotypes (<<interface>>, <<controller>>, <<entity>>, etc.) for expressiveness
	•	Include actual filenames, class names, or function references where applicable
	•	Be precise, low-level, and aligned with real-world code navigation and extension
