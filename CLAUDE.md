# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build/Lint/Test Commands
- Build: `npm run build`
- Lint: `npm run lint`
- Test (all): `npm test` or `npm run test`
- Test (single): `npm test -- -t 'test name'` or `jest path/to/test.js`

## Code Style Guidelines
- **Formatting**: Use Prettier with default config
- **Imports**: Group imports (libraries, then internal modules)
- **Types**: Use TypeScript with strict mode enabled
- **Naming**: camelCase for variables/functions, PascalCase for classes/interfaces
- **Error Handling**: Use try/catch for async operations, prefer early returns
- **Documentation**: JSDoc for public APIs, inline comments for complex logic
- **Components**: Functional components with hooks preferred over class components
- **State Management**: Use React Context for global state, useState for local state