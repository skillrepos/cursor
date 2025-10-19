# Labs Redesign Progress

## Status: In Progress (2/5 Complete)

## Completed Labs

### ✅ Lab 1: Mastering Cursor's Three Modes
**Focus:** Chat, Edit (Cmd+K), and Composer modes
**Project:** Build a production-ready REST API

**What Students Build:**
- Express server with 5 CRUD endpoints
- JWT authentication system
- Input validation middleware
- Error handling
- Multi-file feature coordination

**Key Features Demonstrated:**
- Chat mode (Cmd+L) for planning and architecture decisions
- Edit mode (Cmd+K) for focused single-file changes
- Composer mode (Cmd+I) for multi-file coordination
- When to use each mode
- Real code with proper error handling, validation, and security

**Files Structure:**
```
/starter
  - server.js (minimal starter)
  - package.json

/complete
  - server.js (full REST API)
  - middleware/auth.js (JWT auth)
  - models/User.js (user model with bcrypt)
  - .env.example
```

**No Hello World:** This is a real API students can deploy and use.

---

### ✅ Lab 2: Project Rules & AI Agents
**Focus:** .cursorrules, AGENTS.md, Plan Mode, Background Agents, Hooks
**Project:** Configure AI for team consistency and automation

**What Students Learn:**
- Create comprehensive .cursorrules for project standards
- Write AGENTS.md to guide autonomous agents
- Use Plan Mode for transparent, editable plans
- Run Background Agents for parallel work
- Set up Hooks for custom behavior control

**Key Features Demonstrated:**
- `.cursorrules` - Automatic adherence to team standards
- `AGENTS.md` - Guide AI through complex workflows
- Plan Mode - Review and edit AI plans before execution
- Background Agents - Multitasking while AI works
- Hooks - Custom validation (security check example)

**Real Examples:**
- 100+ line .cursorrules with actual project standards
- AGENTS.md with real workflows (security audit, database migration)
- Security hook that blocks hardcoded secrets
- Multi-step agent tasks with Plan Mode

---

## Remaining Labs (Design Outline)

### 🔄 Lab 3: Production Refactoring with Before/After Merge
**Focus:** Real refactoring using code diff and merge
**Project:** Modernize legacy e-commerce codebase

**Approach:**
- Provide `/before` folder with messy legacy code
- Provide `/complete` folder with refactored code
- Students use `code -d before/ complete/` to see diffs
- Step-by-step refactoring with Cmd+K and Composer
- Use .cursorrules from Lab 2

**What to Refactor:**
- Legacy callback-based code → async/await
- No error handling → comprehensive try-catch
- Security vulnerabilities → fixed (SQL injection, XSS)
- No tests → full test coverage
- Poor naming → descriptive names
- Monolithic files → modular structure

**Real Code:**
- Shopping cart system (add/remove/checkout)
- User authentication with vulnerabilities
- Payment processing
- Database queries with SQL injection risks

**Key Features:**
- Multi-file refactoring with Composer
- Security fixes
- Code quality improvements
- Test generation
- Documentation updates

---

### 🔄 Lab 4: Multi-File Feature with Composer & Agents
**Focus:** Composer for coordinated changes + Background Agents
**Project:** Add real-time notifications system

**What Students Build:**
- WebSocket server integration
- Notification service
- Database schema updates
- Frontend components
- Event emitters
- Queue system

**Before/After Structure:**
```
/before (partial implementation)
  - Basic server without WebSocket
  - No notification logic

/complete (full implementation)
  - WebSocket integrated
  - Complete notification service
  - Queue system
  - Event handlers
  - Frontend real-time updates
```

**Key Features:**
- Composer coordinating 8+ file changes
- Background Agent installing deps and running migrations
- AGENTS.md guiding the implementation
- Plan Mode showing step-by-step approach
- Testing the real-time system

**Real Implementation:**
- Socket.io integration
- Redis for pub/sub (or memory if simpler)
- Notification preferences
- Read/unread status
- Real-time UI updates

---

### 🔄 Lab 5: Advanced Workflow - CI/CD & Production Ready
**Focus:** Complete production workflow with all Cursor features
**Project:** Take app from dev to production-ready

**What Students Do:**
1. **Code Quality** (Cmd+K + Agent)
   - Add comprehensive error handling
   - Implement input validation everywhere
   - Add rate limiting
   - Set up logging with Winston

2. **Testing** (Background Agent)
   - Generate unit tests
   - Integration tests
   - E2E tests with Playwright
   - Coverage reports

3. **Security** (Hooks + Agent)
   - Security audit with custom hook
   - Dependency vulnerability scan
   - Implement CSRF protection
   - Add security headers

4. **CI/CD** (Composer + AGENTS.md)
   - GitHub Actions workflow
   - Automated testing
   - Docker containerization
   - Deployment scripts

5. **Documentation** (Chat + Composer)
   - API documentation with Swagger
   - README with examples
   - Contributing guidelines
   - Architecture diagrams

**Before/After:**
```
/before
  - Working but not production-ready
  - No tests
  - No CI/CD
  - Minimal docs
  - Security issues

/complete
  - Production-ready
  - Full test coverage
  - CI/CD pipeline
  - Comprehensive docs
  - Security hardened
  - Monitoring/logging
```

**Key Features:**
- All Cursor modes used in realistic workflow
- Background Agents for testing
- Hooks for security validation
- Composer for multi-file CI/CD setup
- AGENTS.md guiding production preparation
- Plan Mode for complex deployments

**Real Tools:**
- Docker for containerization
- GitHub Actions for CI/CD
- Jest for testing
- Playwright for E2E
- Winston for logging
- Helmet for security
- Swagger for API docs

---

## Key Improvements Over Original Labs

### ❌ Old Labs (What We're Replacing)
- Hello World level examples
- "Type this code" exercises
- No real-world application
- Single-file focus
- Basic feature demos
- No team workflows
- No production concerns

### ✅ New Labs (What We're Building)
- Production-quality code
- Real projects students can deploy
- Before/After code for context
- Multi-file coordination
- Complete features
- Team collaboration focus
- Production-ready workflows

---

## Lab Design Principles

### 1. Real Code, Real Projects
- No trivial examples
- Deployable applications
- Production patterns
- Industry best practices

### 2. Before/After Approach
- Show messy → clean transformation
- Use `code -d` for visual comparison
- Students see the journey
- Learn refactoring skills

### 3. Feature Completeness
- Don't just start features
- Build them to completion
- Include tests
- Add documentation
- Handle errors

### 4. Progressive Complexity
- Lab 1: Learn the modes
- Lab 2: Configure the tools
- Lab 3: Apply to legacy code
- Lab 4: Build complex features
- Lab 5: Production deployment

### 5. Doable in 10 Minutes
- Step-by-step instructions
- Clear objectives
- Pre-built before/after code
- Copy-paste where appropriate
- Focus on Cursor features, not coding from scratch

---

## File Organization

```
labs/
├── lab1-cursor-modes/
│   ├── README.md (detailed instructions)
│   ├── starter/ (minimal starting point)
│   │   ├── server.js
│   │   └── package.json
│   └── complete/ (reference implementation)
│       ├── server.js
│       ├── middleware/auth.js
│       ├── models/User.js
│       └── .env.example
│
├── lab2-rules-and-agents/
│   ├── README.md
│   ├── .cursorrules (example)
│   ├── AGENTS.md (example)
│   └── .cursor/hooks/ (example hooks)
│
├── lab3-production-refactoring/
│   ├── README.md
│   ├── before/ (legacy code)
│   │   ├── app.js (messy, callbacks, vulnerabilities)
│   │   ├── cart.js
│   │   ├── auth.js
│   │   └── db.js
│   └── complete/ (refactored)
│       ├── app.js (clean, async/await, secure)
│       ├── services/cart.js
│       ├── middleware/auth.js
│       ├── config/database.js
│       └── tests/
│
├── lab4-multifile-composer/
│   ├── README.md
│   ├── before/ (app without notifications)
│   └── complete/ (full notification system)
│       ├── server.js
│       ├── services/notification.js
│       ├── sockets/index.js
│       ├── models/Notification.js
│       ├── queues/email.js
│       └── client/NotificationWidget.jsx
│
└── lab5-production-workflow/
    ├── README.md
    ├── before/ (dev-quality code)
    └── complete/ (production-ready)
        ├── Dockerfile
        ├── .github/workflows/
        ├── tests/
        ├── docs/
        ├── docker-compose.yml
        └── deploy.sh
```

---

## Next Steps

1. ✅ Complete Lab 3 design and code
2. ✅ Complete Lab 4 design and code
3. ✅ Complete Lab 5 design and code
4. ✅ Update slides to match new labs
5. ✅ Test timing (ensure 10 minutes each)
6. ✅ Create instructor notes
7. ✅ Regenerate presentations

---

## Timeline

- Lab 1 & 2: ✅ Complete
- Lab 3: ⏳ Next (30 minutes to build)
- Lab 4: ⏳ Pending (30 minutes to build)
- Lab 5: ⏳ Pending (30 minutes to build)
- Slides update: ⏳ Pending (15 minutes)
- Total remaining: ~2 hours

---

**Status:** Making excellent progress. Labs 1 & 2 are production-quality and demonstrate all key Cursor features with real, meaningful code.
