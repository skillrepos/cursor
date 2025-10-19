# Lab 2: Project Rules & AI Agents - Build Consistent, Automated Workflows

**Duration:** 10 minutes
**Difficulty:** Intermediate
**Goal:** Master .cursorrules for project standards and AGENTS.md for autonomous AI workflows

## What You'll Learn

- ✅ Create `.cursorrules` to enforce team coding standards
- ✅ Write `AGENTS.md` to guide AI Agent behavior
- ✅ Use Agent Mode with Plan Mode for complex tasks
- ✅ Configure Background Agents for autonomous work
- ✅ Set up Hooks for custom AI behavior control

## Real-World Scenario

You're joining a team project that needs:
1. Consistent code style across all developers
2. Automated testing and documentation
3. Security scanning before commits
4. AI agents that understand your project structure

---

## Part 1: Create .cursorrules (3 min)

`.cursorrules` teaches Cursor your project's standards. Every AI suggestion follows these rules automatically.

### Step 1: Create .cursorrules File

Create `.cursorrules` in your project root:

```bash
# In terminal
touch .cursorrules
```

### Step 2: Add Project-Specific Rules

Copy this into `.cursorrules`:

```markdown
# Project: Task Management API
# Team: Engineering
# Updated: 2024

## Code Style & Standards

### JavaScript/Node.js Rules
- Use ES6+ syntax (const/let, arrow functions, async/await)
- Prefer functional programming over imperative
- No var declarations
- Use template literals for string interpolation
- Always use strict equality (=== not ==)

### Error Handling
- ALWAYS use try-catch for async operations
- Return consistent error format: { success: false, message: string }
- Log errors with context: console.error('Context:', error)
- Never swallow errors silently

### Security
- NEVER hardcode secrets, API keys, or passwords
- Use environment variables for sensitive config
- Validate ALL user inputs
- Sanitize data before database operations
- Use parameterized queries (prevent SQL injection)

### Documentation
- Add JSDoc comments to ALL exported functions
- Include @param, @returns, @throws tags
- Explain WHY not just WHAT in comments
- Keep README.md updated with API changes

### Testing
- Write tests for ALL new features
- Test happy path AND edge cases
- Use descriptive test names: "should return 404 when task not found"
- Mock external dependencies

### File Organization
- One export per file (Single Responsibility)
- Group related functions in directories
- Use index.js for barrel exports
- Config files in /config directory
- Tests next to source files: user.js → user.test.js

### Naming Conventions
- Variables/Functions: camelCase (getUserById)
- Constants: UPPER_SNAKE_CASE (MAX_RETRIES)
- Classes: PascalCase (UserService)
- Files: kebab-case (user-service.js)
- Routes: kebab-case (/api/user-profiles)

### API Design
- Use RESTful conventions
- Plural nouns for resources (/tasks not /task)
- Use proper HTTP methods (GET, POST, PUT, DELETE)
- Return appropriate status codes
- Include "success" flag in all responses

### Performance
- Use async/await consistently
- Avoid n+1 queries
- Implement pagination for list endpoints
- Cache frequently accessed data
- Use connection pooling for databases

### Git Commits
- Use conventional commits: feat: add user authentication
- Types: feat, fix, docs, test, refactor, chore
- Keep commits atomic (one concern per commit)

## AI Behavior Guidelines

### When Generating Code
- Always include error handling
- Add input validation
- Include JSDoc comments
- Suggest tests for new functions
- Consider edge cases

### When Refactoring
- Preserve existing functionality
- Add tests to verify behavior
- Explain changes in comments
- Update related documentation

### When Debugging
- Explain the root cause
- Suggest fixes with trade-offs
- Consider performance impact
- Recommend preventive measures

## Context Awareness

### This Project Uses
- Express.js for REST API
- JWT for authentication
- bcrypt for password hashing
- In-memory storage (replace with DB later)
- Jest for testing

### Common Patterns
- Middleware for auth: authenticate, authorize
- Consistent error responses
- async/await for all I/O
- Centralized error handling

## Response Format Preferences

### Code
- Include imports at top
- Add comments for complex logic
- Show usage examples
- Suggest improvements

### Explanations
- Start with high-level overview
- Then dive into details
- Include pros/cons for decisions
- Link to docs when relevant
```

### Step 3: Test Your Rules

1. Open Chat (Cmd+L)
2. Ask: "Create a function to delete a user"
3. Notice how Cursor automatically follows your rules:
   - Uses async/await
   - Includes try-catch
   - Adds JSDoc comments
   - Has proper error handling
   - Uses your naming conventions

**📝 Key Learning:** .cursorrules affects ALL AI interactions - Chat, Cmd+K, and Composer automatically follow these rules.

---

## Part 2: Create AGENTS.md (4 min)

`AGENTS.md` guides autonomous AI Agents through complex, multi-step tasks.

### Step 1: Create AGENTS.md

```bash
touch AGENTS.md
```

### Step 2: Define Agent Workflows

```markdown
# AI Agent Guidelines

## Agent Capabilities

Our AI agents can:
- Read and understand the entire codebase
- Create and modify multiple files
- Run tests and check results
- Install dependencies
- Execute git commands
- Make architectural decisions

## Project Structure

```
/
├── server.js           # Main entry point
├── middleware/         # Express middleware
│   └── auth.js
├── models/            # Data models
│   ├── User.js
│   └── Task.js
├── routes/            # Route handlers (to be created)
├── config/            # Configuration files
├── tests/             # Test files
├── .cursorrules       # Project rules
└── AGENTS.md          # This file
```

## Common Agent Tasks

### Task 1: Add New API Endpoint

When asked to add a new endpoint:

1. **Plan Phase**
   - Determine HTTP method and route
   - Design request/response format
   - Identify required middleware
   - Consider edge cases

2. **Implementation Phase**
   - Create route file in /routes if needed
   - Add validation middleware
   - Implement handler with error handling
   - Update server.js to use route

3. **Testing Phase**
   - Create test file
   - Test happy path
   - Test error cases
   - Test authentication/authorization

4. **Documentation Phase**
   - Add JSDoc comments
   - Update API documentation
   - Add example request/response

### Task 2: Add Database Integration

When adding database support:

1. Research best practices for the chosen DB
2. Create /config/database.js with connection logic
3. Update models to use real DB operations
4. Add migration files if needed
5. Update .env.example with DB variables
6. Add error handling for connection issues
7. Test all CRUD operations

### Task 3: Security Audit

When asked to review security:

1. Check for hardcoded secrets
2. Verify input validation on all routes
3. Test authentication/authorization
4. Look for SQL injection vulnerabilities
5. Check rate limiting implementation
6. Verify HTTPS usage
7. Test password hashing
8. Generate security report

### Task 4: Add Feature with Tests

When adding a complete feature:

1. **Planning**
   - Break down into subtasks
   - Identify affected files
   - Determine test strategy

2. **Implementation**
   - Create necessary files
   - Implement core logic
   - Add middleware if needed
   - Update routes

3. **Testing**
   - Unit tests for models
   - Integration tests for routes
   - Test edge cases

4. **Documentation**
   - Update README.md
   - Add inline comments
   - Create usage examples

## Agent Constraints

### DO
✅ Follow .cursorrules automatically
✅ Ask for clarification if requirements unclear
✅ Provide progress updates for long tasks
✅ Test code after generating it
✅ Suggest improvements proactively
✅ Explain your decisions
✅ Use Plan Mode for complex tasks

### DON'T
❌ Make breaking changes without warning
❌ Delete existing functionality
❌ Commit code without testing
❌ Ignore edge cases
❌ Skip error handling
❌ Hardcode sensitive data
❌ Create files outside project structure

## Background Agent Configuration

### Long-Running Tasks

For tasks that take >2 minutes:
- Use Background Agent mode
- Provide progress callbacks
- Allow cancellation
- Save state periodically

### Example: Database Migration

```
Agent: Run database migration

Steps:
1. Backup current data
2. Run migration scripts
3. Verify data integrity
4. Update schema version
5. Run tests
6. Report results
```

## Hooks Configuration

### Pre-Generation Hook
Before generating code, verify:
- Task is within scope
- All dependencies available
- No conflicting changes in progress

### Post-Generation Hook
After generating code:
- Run linter
- Run tests
- Check for security issues
- Suggest documentation updates

### Custom Hooks

```javascript
// .cursor/hooks/validate-security.js
module.exports = {
  onBeforeEdit: (context) => {
    // Check for secrets before allowing edit
    if (containsSecrets(context.content)) {
      return {
        allow: false,
        message: "Detected potential secrets. Use environment variables."
      };
    }
    return { allow: true };
  }
};
```

## Plan Mode Usage

### When to Use Plan Mode

Use Plan Mode for:
- Multi-step refactorings
- Adding complete features
- Architectural changes
- Database migrations
- Security improvements

### How Plan Mode Works

1. Agent creates detailed, editable plan
2. You review and modify the plan
3. Agent executes approved plan
4. You review results at each step

### Example: Add Authentication

```
Plan Mode Request: "Add JWT authentication to the API"

Generated Plan:
1. Install dependencies (jsonwebtoken, bcryptjs)
2. Create middleware/auth.js with JWT verification
3. Create models/User.js with password hashing
4. Add /auth/register and /auth/login routes
5. Protect existing routes with auth middleware
6. Add tests for authentication
7. Update documentation

[Approve] [Edit Plan] [Cancel]
```

## Team Rules Integration

### Shared Standards

This project syncs with team-wide rules:
- Code style from company .cursorrules
- Security policies from security team
- API conventions from architecture team

### Override Priority

1. Project .cursorrules (highest)
2. Team rules
3. Default Cursor behavior

## Agent Performance Tips

### Make Tasks Easier for Agents

✅ **Good Request**: "Add user search endpoint with pagination, filtering by role, and sorting by created date. Use /users/search route. Return max 50 results per page."

❌ **Vague Request**: "Add search feature"

### Provide Context

Use @ symbols:
- `@Files` - Point to relevant files
- `@Folder` - Include directory context
- `@Code` - Reference specific functions
- `@Docs` - Link to documentation

### Iterative Refinement

For complex tasks:
1. Start with high-level plan
2. Agent breaks into steps
3. Review and refine
4. Execute step by step
5. Test and iterate

## Monitoring Agent Actions

### What to Watch

- Files created/modified
- Commands executed
- Tests run
- Dependencies added
- Git operations

### Safety Checks

Before accepting agent changes:
- Review all file diffs
- Run tests locally
- Check for breaking changes
- Verify security implications

## Example Agent Workflows

### Workflow 1: Add Rate Limiting

```
You: "Add rate limiting to the API using express-rate-limit"

Agent Plan:
1. Install express-rate-limit
2. Create middleware/rateLimit.js
3. Configure limits (100 req/15 min)
4. Apply to API routes
5. Add tests
6. Update documentation

Agent executes → You review → Accept changes
```

### Workflow 2: Security Audit

```
You: "Perform security audit and fix issues"

Agent Plan:
1. Scan for hardcoded secrets
2. Check input validation
3. Review authentication
4. Test for injection vulnerabilities
5. Check dependencies for vulnerabilities
6. Generate security report
7. Fix identified issues

Agent runs in background → Reports findings → You prioritize → Agent fixes
```

## Questions for Agent to Ask

When task is ambiguous, agent should ask:

- "Should this be a GET or POST endpoint?"
- "What authentication level is required?"
- "Should this change be backward compatible?"
- "Do you want me to create tests?"
- "Should I update the documentation?"

## Success Metrics

Agent-generated code should:
- ✅ Pass all tests
- ✅ Follow .cursorrules
- ✅ Include documentation
- ✅ Handle edge cases
- ✅ Be production-ready

---

_This AGENTS.md is a living document. Update it as the project evolves._
```

### Step 3: Test Agent Mode with Plan Mode

1. Open Composer (Cmd+I)
2. Enable Plan Mode (if available in your Cursor version)
3. Request a complex task:

```
Add comprehensive logging system:
- Create /utils/logger.js with Winston
- Log all API requests (method, path, status, duration)
- Log errors with stack traces
- Rotate logs daily
- Different log levels (debug, info, warn, error)
- Add request ID tracking
- Update all routes to use logger

Use Plan Mode to show me the steps first.
```

4. Review the generated plan
5. Modify if needed
6. Execute the plan
7. Review each file created

**📝 Key Learning:** AGENTS.md guides the AI's decision-making process for autonomous, multi-step tasks.

---

## Part 3: Configure Background Agents (2 min)

Background Agents work independently while you continue coding.

### Step 1: Start a Background Agent

1. Open a new Chat tab (Cmd+Shift+L)
2. Request a long-running task:

```
Background Agent Task: Add comprehensive testing

Please:
1. Create tests for all existing routes
2. Add integration tests
3. Set up test database
4. Configure Jest properly
5. Add coverage reports
6. Update package.json scripts

Run this as a background agent so I can keep working.
```

### Step 2: Continue Working

- Agent runs in background
- You can code in other files
- Check progress in Agent panel
- Review when complete

**📝 Key Learning:** Background Agents enable multitasking - AI works on one feature while you work on another.

---

## Part 4: Set Up Hooks (Optional, 1 min)

Hooks control AI behavior with custom scripts.

### Create a Security Hook

Create `.cursor/hooks/security-check.js`:

```javascript
/**
 * Pre-commit security hook
 * Blocks commits containing potential secrets
 */
module.exports = {
  name: 'Security Validator',

  onBeforeEdit: async (context) => {
    const secretPatterns = [
      /api[_-]?key/i,
      /secret/i,
      /password\s*=\s*['"][^'"]+['"]/i,
      /token\s*=\s*['"][^'"]+['"]/i,
      /sk_live_/,
      /sk_test_/,
    ];

    for (const pattern of secretPatterns) {
      if (pattern.test(context.content)) {
        return {
          allow: false,
          message: `⚠️ Potential secret detected. Use environment variables instead.

Pattern matched: ${pattern}
File: ${context.filePath}

Suggestion: Move to .env file`
        };
      }
    }

    return { allow: true };
  },

  onAfterEdit: async (context) => {
    console.log(`✓ Security check passed for ${context.filePath}`);
    return { success: true };
  }
};
```

**📝 Key Learning:** Hooks add custom validation and automation to your AI workflow.

---

## Verification Checklist

- [ ] Created .cursorrules with project standards
- [ ] Tested that AI follows your rules
- [ ] Created AGENTS.md with workflows
- [ ] Used Plan Mode for complex task
- [ ] Started a Background Agent
- [ ] Understand when to use each feature

---

## Real-World Comparison

### Without .cursorrules + AGENTS.md
```
You: "Add user endpoint"
AI: *generates inconsistent code*
You: "Use async/await"
AI: *regenerates*
You: "Add error handling"
AI: *regenerates again*
You: "Follow our naming conventions"
... (many iterations)
```

### With .cursorrules + AGENTS.md
```
You: "Add user endpoint"
AI: *generates code that*:
  ✓ Uses async/await
  ✓ Has error handling
  ✓ Follows naming conventions
  ✓ Includes tests
  ✓ Has documentation
  ✓ Matches team standards
  (First try!)
```

---

## Bonus Challenges

### Challenge 1: Team Rules Sync
Create a team-wide .cursorrules in your organization's repo:
```
# In company-wide repo
.cursor/team-rules.md

# In your project
.cursorrules references team rules
```

### Challenge 2: Custom Agent Workflow
Add to AGENTS.md:
```
### Workflow: Deploy to Production

1. Run all tests
2. Check test coverage > 80%
3. Run security audit
4. Build production bundle
5. Run smoke tests
6. Create git tag
7. Deploy to staging
8. Run E2E tests
9. Deploy to production
10. Monitor for errors
```

### Challenge 3: Advanced Hook
Create a hook that automatically:
- Runs tests before accepting AI changes
- Checks code coverage
- Validates against linter
- Blocks if checks fail

---

## Key Takeaways

1. **`.cursorrules` = Team Standards**
   - Every AI interaction follows these rules
   - Ensures consistent code across team
   - Reduces review time

2. **`AGENTS.md` = AI Workflows**
   - Guides autonomous AI agents
   - Defines complex multi-step tasks
   - Ensures quality and completeness

3. **Plan Mode = Transparency**
   - See AI's plan before execution
   - Edit and refine the approach
   - Better results for complex tasks

4. **Background Agents = Productivity**
   - AI works while you work
   - Parallel development
   - Faster overall delivery

5. **Hooks = Custom Control**
   - Enforce policies automatically
   - Add validation and checks
   - Integrate with your tools

---

## Next Steps

Move to **Lab 3: Production Refactoring** to use these rules while refactoring real legacy code with before/after comparison.

---

**Pro Tip:** Commit your .cursorrules and AGENTS.md to git so the entire team benefits from consistent AI behavior!
