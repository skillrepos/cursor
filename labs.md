# Cursor AI Workshop
## Mastering AI-Powered Development
## Session Labs
## Revision 1.0 - 10/19/25

**Follow the startup instructions in the README.md file IF NOT ALREADY DONE!**

**NOTE: To copy and paste, you may need to use keyboard commands - CTRL-C and CTRL-V (or CMD-C and CMD-V on Mac). Chrome may work best for this.**

---

**Lab 1 - Understanding Cursor's Three Modes - Build a REST API**

**Purpose: In this lab, we'll learn when to use Chat, Edit (Cmd+K), and Composer modes by building a real Express API. You will use Chat mode for planning and questions, Edit mode for focused single-file changes, and Composer mode for multi-file coordination.**

**Setup**

1. From the workshop root directory, run the setup script and navigate to the API directory. Then open the folder in Cursor using one of the available methods (drag folder onto Cursor icon, use File → Open Folder in Cursor, or use the CLI command).

```
npm run lab1:setup
cd my-api
```

<br><br>

2. Verify that you see the following files:
   - `server.js` - Basic Express server with TODO
   - `package.json` - Dependencies (express, jsonwebtoken, bcrypt)

**Important: Understanding Cursor's Modes**

Cursor Chat has three modes:
- **"Ask"** - Chat-only, AI gives advice/code, YOU execute manually
- **"Plan"** - AI creates a plan → You approve → AI executes the plan
- **"Agent"** - Fully autonomous, AI executes without showing detailed plan first

For this lab:
- **Part 1 (Chat):** Use **"Ask"** mode - just getting advice, no execution
- **Part 2 (Cmd+K):** No mode selection - this is direct inline editing
- **Part 3 (Composer):** Use **"Plan"** or **"Agent"** mode to see autonomous file creation

<br><br>

**Part 1: Planning with Chat Mode**

3. Open Chat by pressing Cmd+L (Mac) or Ctrl+L (Windows).

<br><br>

4. In the Chat panel, make sure the mode dropdown at the top is set to **"Ask"**. This is perfect for planning because you're just asking for advice with no code execution needed yet.

<br><br>

5. Ask for architecture advice with the following prompt:

```
I need to build a REST API for a task management system with these endpoints:
- POST /tasks - Create task
- GET /tasks - List all tasks
- GET /tasks/:id - Get single task
- PUT /tasks/:id - Update task
- DELETE /tasks/:id - Delete task

What's the best architecture for this Express API?
What middleware should I include?
```

<br><br>

6. Review the response from Chat. It should provide recommended project structure, middleware suggestions, and best practices.

**📝 Key Learning:** Use Chat when you need to understand the big picture or plan your approach.

<br><br>

**Part 2: Single-File Editing with Edit Mode**

7. Open `server.js` in Cursor. You should see the basic Express server with a TODO comment.

<br><br>

8. Place cursor after `app.use(express.json());` and press `Cmd+K` (or `Ctrl+K`). Type this specific instruction:

```
Add all 5 CRUD routes for tasks with:
- Proper HTTP methods
- Route parameters where needed
- Placeholder handlers that return status and JSON
- Comments explaining each route
```

Press Enter and wait for the inline suggestion. Review the code, then accept with Cmd+Enter.

<br><br>

9. Select the entire file (Cmd+A), press Cmd+K, and provide this instruction to add error handling:

```
Wrap all route handlers with try-catch
Add a global error handling middleware at the end
Include 404 handler
Return proper JSON error responses with status codes
```

Review and accept the changes.

<br><br>

10. Select just the POST route, press Cmd+K, and add input validation:

```
Add validation middleware before the handler that checks:
- title is present and is a string
- description is optional but must be string if present
- priority is one of: low, medium, high
Return 400 with validation errors if invalid
```

Accept the changes.

**📝 Key Learning:** Use Cmd+K (Edit mode) when making focused changes to one file. You see the diff inline and can accept/reject easily.

<br><br>

**Part 3: Multi-File Coordination with Composer**

11. Open Composer by pressing Cmd+I (Mac) or Ctrl+I (Windows), or click the Composer icon in the sidebar.

<br><br>

12. Choose your mode. For this lab, try **"Plan"** mode to see the planning + execution workflow:

**Plan Mode (Recommended for this lab) ⭐**
- Set the mode dropdown to **"Plan"**
- Cursor creates a detailed plan and shows it to you
- You can edit the plan if needed
- You click "Approve Plan"
- Cursor executes and creates all files automatically
- You see each step as it happens

**Agent Mode (Fastest)**
- Set the mode dropdown to **"Agent"**
- Cursor executes immediately without showing detailed plan
- Files are created automatically
- Faster but less transparency

<br><br>

13. Type this in Composer to request a multi-file authentication feature:

```
Create a complete authentication system for the API:

1. Create middleware/auth.js with:
   - JWT validation middleware
   - Role-based access control (admin, user)
   - Token generation function

2. Create models/User.js with:
   - User schema (email, password hash, role)
   - Login method
   - Password hashing

3. Update server.js to:
   - Add POST /auth/login route
   - Add POST /auth/register route
   - Protect /tasks routes with auth middleware
   - Add auth imports

4. Create .env.example with:
   - JWT_SECRET placeholder
   - DATABASE_URL placeholder

Make sure all files work together seamlessly.
```

<br><br>

14. If using Plan mode, Cursor will show you a detailed plan with steps it will take and list files it will create/modify. Review the plan carefully, read each step, edit if needed, then click **"Approve Plan"** when ready.

<br><br>

15. After approving (or immediately if using Agent mode), watch as Cursor creates each file automatically, shows progress as it works, and displays the final results.

<br><br>

16. After execution, check the file explorer - new files should appear. Open each file to review the code and verify:
   - `middleware/auth.js` exists
   - `models/User.js` exists
   - `server.js` has auth routes added
   - `.env.example` exists

**📝 Key Learning:** Use Composer when changes span multiple files and need coordination. It understands the relationships between files.

<br><br>

**Verification**

After completing this lab, you should have:
- Used Chat to plan the API architecture
- Used Cmd+K to add routes to server.js
- Used Cmd+K to add error handling
- Used Cmd+K to add validation
- Used Composer to create multi-file auth system
- Understanding of when to use each mode

**Key Takeaways:**

1. **Chat = Brain** 🧠 - Planning, understanding, learning
2. **Edit = Scalpel** 🔪 - Precise, focused changes
3. **Composer = Conductor** 🎼 - Orchestrates multiple files
4. **Use the right tool for the job** - Don't use a hammer for everything
5. **Always review AI output** - AI is powerful but not perfect

<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 2 - Project Rules & AI Agents - Build Consistent, Automated Workflows**

**Purpose: In this lab, we'll master .cursorrules for project standards and AGENTS.md for autonomous AI workflows. You will create .cursorrules to enforce team coding standards, write AGENTS.md to guide AI Agent behavior, and use Agent Mode with Plan Mode for complex tasks.**

**Part 1: Create .cursorrules**

1. `.cursorrules` teaches Cursor your project's standards. Every AI suggestion follows these rules automatically. Create the file in your project root:

```
touch .cursorrules
```

<br><br>

2. Copy this into `.cursorrules`:

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

<br><br>

3. Test your rules by opening Chat (Cmd+L) and asking: "Create a function to delete a user". Notice how Cursor automatically follows your rules by using async/await, including try-catch, adding JSDoc comments, having proper error handling, and using your naming conventions.

**📝 Key Learning:** .cursorrules affects ALL AI interactions - Chat, Cmd+K, and Composer automatically follow these rules.

<br><br>

**Part 2: Create AGENTS.md**

4. `AGENTS.md` guides autonomous AI Agents through complex, multi-step tasks. Create the file:

```
touch AGENTS.md
```

<br><br>

5. Add the following content to define agent workflows:

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

<br><br>

6. Test Agent Mode with Plan Mode by opening Composer (Cmd+I), enabling Plan Mode (if available), and requesting a complex task:

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

<br><br>

7. Review the generated plan, modify if needed, execute the plan, and review each file created.

**📝 Key Learning:** AGENTS.md guides the AI's decision-making process for autonomous, multi-step tasks.

<br><br>

**Part 3: Configure Background Agents**

8. Background Agents work independently while you continue coding. Open a new Chat tab (Cmd+Shift+L) and request a long-running task:

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

<br><br>

9. The agent runs in background while you can code in other files. Check progress in Agent panel and review when complete.

**📝 Key Learning:** Background Agents enable multitasking - AI works on one feature while you work on another.

<br><br>

**Verification**

After completing this lab, you should have:
- Created .cursorrules with project standards
- Tested that AI follows your rules
- Created AGENTS.md with workflows
- Used Plan Mode for complex task
- Started a Background Agent
- Understanding of when to use each feature

**Key Takeaways:**

1. **`.cursorrules` = Team Standards** - Every AI interaction follows these rules, ensures consistent code across team, reduces review time
2. **`AGENTS.md` = AI Workflows** - Guides autonomous AI agents, defines complex multi-step tasks, ensures quality and completeness
3. **Plan Mode = Transparency** - See AI's plan before execution, edit and refine the approach, better results for complex tasks
4. **Background Agents = Productivity** - AI works while you work, parallel development, faster overall delivery

<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 3 - Production Refactoring - Transform Legacy Code to Modern Standards**

**Purpose: In this lab, we'll refactor real legacy e-commerce code using Composer and diff comparison. You will transform code with callback hell, SQL injection vulnerabilities, no error handling, hardcoded credentials, poor naming conventions, no input validation, memory leaks, and no tests into modern, secure, well-tested code.**

**Before You Start**

1. View the diff to see the changes needed. This opens VS Code's diff view showing the legacy code (left) and refactored code (right) with exact changes highlighted. Study the differences for 2 minutes before starting.

```
cd labs/lab3-production-refactoring
code -d before/ complete/
```

<br><br>

**Part 1: Understand the Legacy Code**

2. Open Chat (press Cmd+L) and analyze the legacy code:

```
@Folder before/ - Analyze this legacy e-commerce code.
List all security vulnerabilities, code smells, and issues.
Prioritize by severity.
```

<br><br>

3. Review Chat's analysis. It should identify:
   - **Critical Security Issues:** SQL injection in cart.js, hardcoded database credentials, no password hashing, XSS vulnerabilities
   - **Code Quality Issues:** Callback pyramid of doom, no error handling, global variables, poor naming (a, b, c variables)
   - **Architecture Problems:** Monolithic files, no separation of concerns, tight coupling, no dependency injection

**📝 Key Learning:** Always understand the problems before refactoring.

<br><br>

**Part 2: Security Fixes with Cmd+K**

4. Open `before/cart.js`, find the `addToCart` function (around line 15), select the SQL query line, and press Cmd+K:

```
Fix this SQL injection vulnerability.
Use parameterized queries with placeholders.
Show the before/after difference in a comment.
```

Review the change and accept with Cmd+Enter.

<br><br>

5. Open `before/db.js`, select the connection config (lines 5-10), and press Cmd+K:

```
Move all credentials to environment variables.
Create .env.example file.
Add dotenv package.
Use process.env for all config.
Add validation for required env vars.
```

Accept the changes.

<br><br>

6. Open `before/auth.js`, select the `register` function, and press Cmd+K:

```
Replace plain text password storage with bcrypt hashing.
Add password strength validation.
Use salt rounds = 10.
Handle errors properly.
```

Accept the changes.

**📝 Key Learning:** Cmd+K is perfect for focused security fixes in specific functions.

<br><br>

**Part 3: Modernize with Composer**

7. Open Composer (press Cmd+I or Ctrl+I) and request complete modernization:

```
Refactor this entire codebase from callbacks to modern async/await:

FILES TO REFACTOR:
@Folder before/

REQUIREMENTS:
1. Convert ALL callbacks to async/await
2. Add try-catch error handling everywhere
3. Create proper service layer (services/cart.js, services/auth.js)
4. Extract database config to config/database.js
5. Add middleware for validation (middleware/validate.js)
6. Implement proper error responses
7. Add JSDoc comments
8. Follow the .cursorrules from Lab 2

MAINTAIN:
- Same functionality
- Same API endpoints
- Backward compatibility

REFERENCE:
Use @Folder complete/ as the target architecture
```

<br><br>

8. Composer will show files to create (services/, middleware/, config/), files to modify (app.js, cart.js, auth.js), code changes in each file, and how they connect together.

<br><br>

9. Click through each file tab in Composer and verify:
   - ✅ Check error handling added
   - ✅ Verify async/await usage
   - ✅ Confirm no callbacks remain
   - ✅ Check imports updated
   - ✅ Validate security fixes

<br><br>

10. If everything looks good, click "Accept All". If needs tweaking, edit the prompt, accept individual files, or reject and refine.

**📝 Key Learning:** Composer coordinates complex refactors across multiple files while maintaining consistency.

<br><br>

**Part 4: Add Tests**

11. Open Chat (new tab: Cmd+Shift+L) and generate tests:

```
Create comprehensive tests for the refactored code:

@Folder complete/

Generate:
1. Unit tests for all services (cart, auth, products)
2. Integration tests for API endpoints
3. Test error handling
4. Test validation
5. Test authentication
6. Mock database operations

Use Jest and supertest.
Aim for 80%+ coverage.

Run this as a background agent so I can continue working.
```

<br><br>

12. The agent will create test files, generate test cases, set up test database, configure Jest, and update package.json scripts. While the agent runs, you can continue with other work. Check progress in the Agent panel and review when complete.

**📝 Key Learning:** Background Agents handle time-consuming tasks like test generation while you stay productive.

<br><br>

**Verification**

Compare your refactored code with the `complete/` folder and verify:

**Security:**
- No SQL injection vulnerabilities
- Passwords properly hashed
- No hardcoded credentials
- Input validation on all endpoints
- Proper authentication checks
- XSS protection

**Code Quality:**
- All async/await (no callbacks)
- Try-catch error handling
- Descriptive variable names
- Proper separation of concerns
- No global variables
- Clean file structure

**Architecture:**
- Service layer created
- Middleware extracted
- Config centralized
- Routes separated
- Models defined
- Tests added

**Key Takeaways:**

1. **Always Understand First** - Use Chat to analyze legacy code, identify security issues, prioritize by severity
2. **Focused Fixes with Cmd+K** - Single-function security fixes, targeted improvements, quick precise changes
3. **Coordinated Refactors with Composer** - Multi-file modernization, architectural changes, consistent patterns across files
4. **Automate Testing** - Background Agents for test generation, ensure refactors don't break functionality, build safety net
5. **Security is Priority #1** - Fix SQL injection immediately, hash passwords properly, validate all inputs, use environment variables

<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 4 - Real-Time Notifications - Multi-File Feature with Composer & Background Agents**

**Purpose: In this lab, we'll build a complete real-time notification system using Composer for coordinated multi-file changes. You will create a production-ready notification system with WebSocket server (Socket.io), notification service layer, database schema and models, event emitters across the app, real-time frontend components, notification preferences, read/unread status tracking, and push notification queue.**

**Before You Start**

1. View what you're building by comparing the before and complete folders:

```
cd labs/lab4-realtime-notifications
code -d before/ complete/
```

**before/**: Basic API without notifications
**complete/**: Full real-time notification system

Study the complete/ folder to see new files created, existing files modified, and how everything connects.

<br><br>

**Part 1: Plan with Chat & AGENTS.md**

2. Add this workflow to your AGENTS.md:

```markdown
### Workflow: Add Real-Time Notifications

**Goal:** Implement WebSocket-based notification system

**Steps:**
1. Install dependencies (socket.io, socket.io-client)
2. Create database schema for notifications
3. Set up WebSocket server in app.js
4. Create notification service (create, mark read, delete)
5. Create notification model with database operations
6. Add event emitters in existing features (orders, cart)
7. Create frontend NotificationBell component
8. Add notification preferences endpoint
9. Implement notification queue for offline users
10. Add comprehensive tests

**Files to Create:**
- server/sockets/index.js
- server/services/notification.js
- server/models/Notification.js
- server/routes/notifications.js
- client/components/NotificationBell.jsx
- database/migrations/notifications.sql

**Files to Modify:**
- app.js (add WebSocket)
- routes/orders.js (emit events)
- routes/cart.js (emit events)

**Testing:**
- Unit tests for notification service
- Integration tests for WebSocket
- E2E tests for real-time updates
```

<br><br>

3. Press Cmd+L to open Chat and ask for architecture advice:

```
I need to add real-time notifications to this e-commerce API.
Reference: @Folder before/ and AGENTS.md workflow

Questions:
1. Should I use Socket.io or native WebSockets?
2. How should I structure the notification service?
3. What events should trigger notifications?
4. How to handle offline users?
5. Best practices for WebSocket scaling?
```

Review Chat's recommendations before proceeding.

**📝 Key Learning:** Plan complex features before implementing. Chat + AGENTS.md ensure nothing is missed.

<br><br>

**Part 2: Use Composer with Plan Mode**

4. Open Composer (press Cmd+I or Ctrl+I) and enable Plan Mode (if available).

<br><br>

5. Type this in Composer to request the complete feature:

```
Add complete real-time notification system to the e-commerce API:

CONTEXT:
@Folder before/ - Current codebase
@File AGENTS.md - Implementation workflow

REQUIREMENTS:

1. WebSocket Server Setup
   - Integrate Socket.io with Express
   - Handle connection/disconnection
   - Implement authentication for sockets
   - Add room-based notifications (per user)

2. Notification Service (services/notification.js)
   - createNotification(userId, type, message, metadata)
   - getNotifications(userId, filters)
   - markAsRead(notificationId)
   - markAllAsRead(userId)
   - deleteNotification(notificationId)
   - getUnreadCount(userId)

3. Database Schema
   - notifications table with:
     - id, user_id, type, title, message, metadata (JSON)
     - read (boolean), created_at, read_at
     - link (optional URL)
   - Add indexes for performance

4. Notification Model (models/Notification.js)
   - Database operations with transactions
   - Input validation
   - Error handling

5. Event Integration
   - Emit "order.created" when order placed
   - Emit "cart.reminder" for abandoned carts
   - Emit "product.back_in_stock" when restocked
   - Emit "order.shipped" when order ships

6. REST API Endpoints (routes/notifications.js)
   - GET /notifications (with pagination)
   - GET /notifications/unread-count
   - PUT /notifications/:id/read
   - PUT /notifications/read-all
   - DELETE /notifications/:id
   - GET /notifications/preferences
   - PUT /notifications/preferences

7. Frontend Component (client/NotificationBell.jsx)
   - Real-time notification bell icon
   - Unread count badge
   - Dropdown with recent notifications
   - Mark as read on click
   - Auto-refresh via WebSocket

8. Notification Queue
   - Queue notifications for offline users
   - Send when user reconnects
   - Handle connection drops gracefully

9. Preferences System
   - User preferences (email, push, in-app)
   - Notification types they want
   - Quiet hours support

10. Testing
    - Unit tests for service
    - WebSocket connection tests
    - Real-time event tests
    - Offline/online scenarios

CONSTRAINTS:
- Follow .cursorrules standards
- Use async/await throughout
- Add comprehensive error handling
- Include JSDoc comments
- Ensure backward compatibility
- No breaking changes to existing APIs

OUTPUT:
Show me a detailed plan first, then implement.
```

<br><br>

6. Composer with Plan Mode will show a detailed plan organized in phases. Review the plan showing:

**Phase 1: Setup** - Install socket.io, create database migration
**Phase 2: Backend Core** - Create socket handler, services, models, update app.js
**Phase 3: Integration** - Update routes, create notification routes
**Phase 4: Frontend** - Create NotificationBell component
**Phase 5: Testing** - Create test files

You can click "Edit Plan" to modify steps, add/remove files, or adjust implementation details.

<br><br>

7. Click "Execute" and Composer will show progress for each phase. Review file diffs as they're created and accept or modify each change.

**📝 Key Learning:** Plan Mode gives you transparency and control. You see the approach before execution and can guide it.

<br><br>

**Part 3: Background Agent for Dependencies**

8. While Composer works, use a Background Agent for setup tasks. Open a new Chat tab (Cmd+Shift+L) and start the background agent:

```
Background Agent Task: Setup notification system infrastructure

Please:
1. Run: npm install socket.io socket.io-client
2. Run database migration (create notifications table)
3. Set up test database
4. Configure Jest for WebSocket testing
5. Generate seed data (50 sample notifications)
6. Update package.json scripts

Run as background agent.
```

The agent works in parallel while you review Composer changes.

**📝 Key Learning:** Background Agents handle setup/maintenance while you focus on code review.

<br><br>

**Part 4: Test Real-Time System**

9. Review the WebSocket code by opening `complete/server/sockets/index.js` and studying how WebSocket handles authentication, room management, event broadcasting, error handling, and reconnection logic.

<br><br>

10. Test locally by starting the server and testing the WebSocket connection:

```
# Terminal 1: Start server
npm start

# Terminal 2: Test WebSocket connection
node test-websocket.js
```

<br><br>

11. Verify these features work:
    - User receives notification in real-time
    - Unread count updates live
    - Mark as read works
    - Offline queue delivers on reconnect
    - Multiple tabs stay in sync

**📝 Key Learning:** Always test real-time features with actual connections.

<br><br>

**Verification**

After completing this lab, verify:
- WebSocket server integrated with Express
- Notifications stored in database
- Real-time delivery working
- Unread count accurate
- Mark as read functional
- Offline queue implemented
- Frontend component working
- Tests passing
- Events emit from cart/orders
- Preferences system working

**Key Takeaways:**

1. **Composer Excels at Multi-File Features** - Coordinates changes across 10+ files, ensures consistency, updates imports automatically, maintains integration
2. **Plan Mode Provides Control** - See the approach before execution, edit and refine the plan, understand the architecture, catch issues early
3. **Background Agents Enable Parallelism** - Setup tasks run while you code, install dependencies, run migrations, generate boilerplate
4. **AGENTS.md Guides Implementation** - Defines workflows, ensures completeness, maintains standards, documents decisions
5. **Real-Time Requires Special Handling** - Authentication for WebSocket, room-based broadcasting, offline queue, reconnection logic

<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 5 - Production-Ready Deployment - Complete AI-Powered Workflow**

**Purpose: In this lab, we'll transform development code to production-ready with CI/CD, testing, security, and deployment using all Cursor features. You will create a comprehensive test suite (80%+ coverage), CI/CD pipeline (GitHub Actions), Docker containerization, security hardening, monitoring and logging, API documentation, deployment automation, and performance optimization.**

**Part 1: Security Audit with Custom Hook**

1. Create `.cursor/hooks/security-audit.js`:

```javascript
/**
 * Security Audit Hook
 * Runs before major changes to catch security issues
 */
const fs = require('fs');
const path = require('path');

module.exports = {
  name: 'Security Auditor',

  async onBeforeComposer(context) {
    const securityIssues = [];

    // Check for common vulnerabilities
    const patterns = {
      'Hardcoded Secret': /(['"])(api[_-]?key|secret|password|token)\1\s*[:=]\s*['"][^'"]{8,}/gi,
      'SQL Injection': /query\s*\([^?]*\+/gi,
      'Eval Usage': /eval\s*\(/gi,
      'Unsafe Regex': /new\s+RegExp\([^,]*\+/gi
    };

    for (const [issue, pattern] of Object.entries(patterns)) {
      if (pattern.test(context.prompt)) {
        securityIssues.push({
          severity: 'high',
          type: issue,
          message: `Potential ${issue} detected in prompt`
        });
      }
    }

    if (securityIssues.length > 0) {
      return {
        allow: false,
        message: `⚠️  Security Issues Detected:\n\n${
          securityIssues.map(i => `- ${i.type}: ${i.message}`).join('\n')
        }\n\nPlease address these issues first.`
      };
    }

    return { allow: true };
  },

  async onAfterGeneration(context) {
    // Run automated security scan
    console.log('✓ Security audit passed');
    return { success: true };
  }
};
```

<br><br>

2. Test the hook by trying to use Composer with a vulnerable pattern:

```
Composer: Add user authentication with password = 'admin123'
```

The hook should block this and suggest using environment variables.

**📝 Key Learning:** Hooks act as automated quality gates, preventing security issues before they're committed.

<br><br>

**Part 2: Comprehensive Testing with Background Agent**

3. Open new Chat tab (Cmd+Shift+L) and start a background agent for testing:

```
Background Agent Task: Generate Complete Test Suite

@Folder before/ - Analyze all files

Create comprehensive tests:

1. UNIT TESTS (services/, models/)
   - Test all functions
   - Mock dependencies
   - Cover edge cases
   - Test error handling

2. INTEGRATION TESTS (routes/)
   - Test all API endpoints
   - Test authentication flows
   - Test database operations
   - Test WebSocket connections

3. E2E TESTS (with Playwright)
   - Test complete user workflows
   - Test checkout process
   - Test real-time notifications
   - Test error scenarios

4. PERFORMANCE TESTS
   - Load testing with k6
   - Stress testing critical endpoints
   - Memory leak detection

5. SECURITY TESTS
   - SQL injection attempts
   - XSS attempts
   - CSRF protection
   - Rate limiting

SETUP:
- Configure Jest
- Set up test database
- Add coverage reporting
- Create test helpers
- Mock external services

TARGET: 80%+ code coverage

Run as background agent.
```

While tests generate, continue with other tasks.

**📝 Key Learning:** Background Agents handle time-consuming test generation while you work on other production concerns.

<br><br>

**Part 3: CI/CD Pipeline with Composer**

4. Open Composer (Cmd+I), enable Plan Mode, and create a complete CI/CD pipeline:

```
Create complete CI/CD pipeline using GitHub Actions:

WORKFLOWS NEEDED:

1. .github/workflows/test.yml
   - Run on every PR
   - Install dependencies
   - Run linter (ESLint)
   - Run tests with coverage
   - Upload coverage to Codecov
   - Check coverage threshold (80%)
   - Security scan with npm audit

2. .github/workflows/deploy-staging.yml
   - Run on merge to develop
   - Build Docker image
   - Push to container registry
   - Deploy to staging environment
   - Run smoke tests
   - Notify team on Slack

3. .github/workflows/deploy-production.yml
   - Run on release tag
   - Require manual approval
   - Build production Docker image
   - Run security scan
   - Deploy to production
   - Run health checks
   - Rollback on failure
   - Notify team

4. .github/workflows/security-scan.yml
   - Run weekly
   - Dependency vulnerability scan
   - SAST analysis
   - Container image scan
   - Report findings

ALSO CREATE:
- Dockerfile (multi-stage build)
- docker-compose.yml (for local dev)
- .dockerignore
- Health check endpoints
- Deployment scripts

Follow best practices for:
- Secrets management
- Environment variables
- Caching strategies
- Parallel execution
```

<br><br>

5. Review Composer's Plan showing:

**Phase 1: CI Configuration** - Create workflow files for test, staging deployment, production deployment, security scan
**Phase 2: Containerization** - Create Dockerfile, docker-compose.yml, .dockerignore
**Phase 3: Deployment Scripts** - Create deploy.sh, rollback.sh, health-check.sh

Click Execute Plan to proceed.

**📝 Key Learning:** Composer handles complex multi-file CI/CD setup, ensuring all pieces work together.

<br><br>

**Part 4: Monitoring & Logging with AGENTS.md Workflow**

6. Add to AGENTS.md:

```markdown
### Workflow: Add Production Monitoring

**Goal:** Implement comprehensive monitoring and logging

**Steps:**
1. Set up Winston for structured logging
2. Add request/response logging middleware
3. Integrate error tracking (Sentry/LogRocket)
4. Add performance monitoring (New Relic/Datadog)
5. Create custom metrics
6. Set up health check endpoint
7. Add database query logging
8. Implement log rotation
9. Create monitoring dashboard config
10. Set up alerts

**Files to Create:**
- utils/logger.js
- middleware/requestLogger.js
- config/monitoring.js
- config/sentry.js
- monitoring/metrics.js
- health/checks.js

**Integration Points:**
- Add to app.js
- Wrap all routes
- Catch all errors
- Log all database queries
```

<br><br>

7. Use Chat with AGENTS.md to implement the monitoring workflow:

```
Chat: @File AGENTS.md - Implement production monitoring workflow

Follow the monitoring workflow to add:
- Structured logging with Winston
- Error tracking with Sentry
- Performance monitoring
- Custom business metrics
- Health checks
- Alerting rules

Reference the production-ready patterns from .cursorrules
```

Chat + AGENTS.md will guide through complete implementation.

**📝 Key Learning:** AGENTS.md workflows ensure nothing is missed in complex production setup.

<br><br>

**Part 5: API Documentation**

8. Use Cmd+K on app.js to add Swagger/OpenAPI documentation:

```
Add Swagger/OpenAPI documentation:
- Install swagger-jsdoc and swagger-ui-express
- Create /api-docs endpoint
- Document all routes with JSDoc annotations
- Include request/response examples
- Add authentication details
- Generate interactive docs
```

<br><br>

9. Use Composer to auto-document all routes:

```
Add OpenAPI documentation to all route files

For each route in:
- routes/auth.js
- routes/products.js
- routes/cart.js
- routes/orders.js
- routes/notifications.js

Add JSDoc comments with:
- Description
- Parameters
- Request body schema
- Response schema
- Status codes
- Example requests/responses
```

**📝 Key Learning:** Auto-generate API docs to save hours of manual documentation.

<br><br>

**Verification**

After completing this lab, verify the Production Checklist:

**Security:**
- No hardcoded secrets
- All inputs validated
- SQL injection prevented
- XSS protection enabled
- CSRF tokens implemented
- Rate limiting active
- Security headers set (Helmet)
- Dependencies scanned
- HTTPS enforced

**Code Quality:**
- 80%+ test coverage
- All tests passing
- Linter passing
- No console.logs
- Error handling comprehensive
- Code reviewed
- Documentation complete

**Performance:**
- Database queries optimized
- Indexes created
- Caching implemented
- Connection pooling
- Compression enabled
- Static assets CDN
- Load tested

**Observability:**
- Structured logging
- Error tracking
- Performance monitoring
- Custom metrics
- Health checks
- Alerts configured
- Dashboard created

**Deployment:**
- CI/CD pipeline
- Automated tests
- Container built
- Staging environment
- Production deployment
- Rollback plan
- Documentation

**Key Takeaways:**

1. **Production Requires More Than Code** - Testing, monitoring, deployment, security, documentation, observability, CI/CD, infrastructure, scaling
2. **AI Accelerates Production Prep** - Background Agents generate tests, Composer sets up CI/CD, Hooks enforce quality, AGENTS.md guides workflows
3. **Automation is Key** - Automated testing catches bugs, deployment reduces errors, monitoring catches issues, rollback saves the day
4. **Standards Matter** - .cursorrules ensure consistency, Hooks enforce quality gates, CI/CD validates changes, Monitoring catches deviations
5. **Cursor Covers Full SDLC** - Planning (Chat + AGENTS.md), Development (Cmd+K + Composer), Testing (Background Agents), Deployment (Composer + Plan Mode), Monitoring (AGENTS.md workflows)

<p align="center">
**[END OF LAB]**
</p>
</br></br>

<p align="center">
**WORKSHOP COMPLETE! 🎉**
</p>

You've now learned:
- ✅ Chat, Edit, Composer modes
- ✅ .cursorrules for team standards
- ✅ AGENTS.md for workflows
- ✅ Plan Mode for transparency
- ✅ Background Agents for parallelism
- ✅ Hooks for quality gates
- ✅ Production-ready development
- ✅ Full CI/CD pipeline
- ✅ Real-world refactoring
- ✅ Multi-file features

**Next Steps:**
1. Apply to Real Projects - Use these patterns in your work, build your own .cursorrules, create team AGENTS.md, set up custom hooks
2. Share with Team - Teach Cursor features, establish standards, automate workflows, improve productivity
3. Continue Learning - Explore advanced features, join Cursor community, share discoveries, build amazing things

**Congratulations on completing the Cursor AI Workshop!**

You're now equipped to build production-quality applications faster than ever with AI assistance. 🚀
