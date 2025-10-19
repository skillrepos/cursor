# Lab 1: Mastering Cursor's Three Modes - Build a REST API

**Duration:** 10 minutes
**Difficulty:** Intermediate
**Goal:** Learn when to use Chat, Edit (Cmd+K), and Composer modes by building a real Express API

## What You'll Build

A production-ready REST API with:
- Express server with routes
- Input validation middleware
- Error handling
- Database queries (simulated)
- Authentication middleware
- API documentation

## Learning Objectives

By the end of this lab, you will:
- ✅ Use **Chat mode** (Cmd+L) for planning and questions
- ✅ Use **Edit mode** (Cmd+K) for focused, single-file changes
- ✅ Use **Composer mode** (Cmd+I) for multi-file coordination
- ✅ Understand when to use each mode

---

## Setup (1 min)

### Option A: Quick Setup (Recommended)
```bash
# From the workshop root directory
npm run lab1:setup
cd my-api
```

Then open in Cursor:
- **Option 1:** Drag the `my-api` folder onto the Cursor icon
- **Option 2:** In Cursor: File → Open Folder → Select `my-api`
- **Option 3:** If you have the CLI installed: `cursor .`

### Option B: Manual Setup
```bash
# From the workshop root directory
cp -r labs/lab1-cursor-modes/starter my-api
cd my-api
```

Then open the folder in Cursor (use one of the methods above)

### Step 3: Verify Files
You should see:
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

**Quick Guide:**
- **Ask** = AI advises, YOU do the work
- **Plan** = AI plans → You approve → AI executes (transparent)
- **Agent** = AI just does it (fast but less visibility)

---

## Part 1: Planning with Chat Mode (2 min)

Chat is best for: Planning, asking questions, understanding architecture

### Step 1: Open Chat
```
Press Cmd+L (Mac) or Ctrl+L (Windows)
```

### Step 2: Select "Ask" Mode
In the Chat panel, look for the mode dropdown at the top. Make sure it's set to **"Ask"**.

**Why Ask mode?**
- You're just asking for advice
- No code execution needed yet
- AI explains, YOU implement
- Perfect for learning and planning

### Step 3: Ask for Architecture Advice
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

### Step 3: Review the Response
Chat will provide:
- Recommended project structure
- Middleware suggestions
- Best practices

**📝 Key Learning:** Use Chat when you need to understand the big picture or plan your approach.

---

## Part 2: Single-File Editing with Edit Mode (4 min)

Edit mode (Cmd+K) is best for: Focused changes within one file

### Step 1: Open server.js
1. Open `server.js` in Cursor
2. You should see the basic Express server with a TODO comment

### Step 2: Use Cmd+K to Add Routes
1. Place cursor after `app.use(express.json());`
2. Press `Cmd+K` (or `Ctrl+K`)
3. Type this specific instruction:

```
Add all 5 CRUD routes for tasks with:
- Proper HTTP methods
- Route parameters where needed
- Placeholder handlers that return status and JSON
- Comments explaining each route
```

4. Press `Enter` and wait for the inline suggestion
5. Review the code (don't just accept!)
6. Accept with `Cmd+Enter`

### Step 3: Add Error Handling with Cmd+K
1. Select the entire file (`Cmd+A`)
2. Press `Cmd+K`
3. Instruction:

```
Wrap all route handlers with try-catch
Add a global error handling middleware at the end
Include 404 handler
Return proper JSON error responses with status codes
```

4. Review and accept

### Step 4: Add Input Validation
1. Select just the POST route
2. Press `Cmd+K`
3. Instruction:

```
Add validation middleware before the handler that checks:
- title is present and is a string
- description is optional but must be string if present
- priority is one of: low, medium, high
Return 400 with validation errors if invalid
```

4. Accept the changes

**📝 Key Learning:** Use Cmd+K (Edit mode) when making focused changes to one file. You see the diff inline and can accept/reject easily.

---

## Part 3: Multi-File Coordination with Composer (4 min)

Composer is best for: Changes across multiple files that need to work together

### Step 1: Open Composer
```
Press Cmd+I (Mac) or Ctrl+I (Windows)
Or: Click the Composer icon in the sidebar
```

### Step 2: Choose Your Mode

Composer can work in three ways:

**Option A: Plan Mode (Recommended for this lab) ⭐**
1. Set the mode dropdown to **"Plan"**
2. Cursor creates a detailed plan and shows it to you
3. You can edit the plan if needed
4. You click "Approve Plan"
5. Cursor executes and creates all files automatically
6. You see each step as it happens

**Option B: Agent Mode (Fastest)**
1. Set the mode dropdown to **"Agent"**
2. Cursor executes immediately without showing detailed plan
3. Files are created automatically
4. Faster but less transparency

**Option C: Ask Mode (Most Manual)**
1. Set the mode dropdown to **"Ask"**
2. Cursor gives you code snippets
3. YOU manually create files and paste code
4. Most control, most work

**For this lab, try "Plan" mode to see the planning + execution workflow!**

### Step 3: Request Multi-File Feature
Type this in Composer:

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

### Step 4: Review the Plan (Plan Mode)

If using **Plan mode**, Cursor will:
1. **Show you a detailed plan** with steps it will take
2. **List files** it will create/modify
3. **Wait for your approval**

Review the plan carefully:
- Read each step
- Edit the plan if needed (click to modify)
- Click **"Approve Plan"** when ready

### Step 5: Watch Execution

After approving, Cursor will:
- Create each file automatically
- Show progress as it works
- Display the final results
- Indicate when complete

**If using Agent mode:** Execution happens immediately, less detailed progress shown.

### Step 6: Review the Results

After execution:
- Check the file explorer - new files should appear
- Open each file to review the code
- Verify:
  - `middleware/auth.js` exists
  - `models/User.js` exists
  - `server.js` has auth routes added
  - `.env.example` exists

**If using Ask mode instead:** You'll get code snippets to manually create files with (more manual work).

**📝 Key Learning:** Use Composer when changes span multiple files and need coordination. It understands the relationships between files.

---

## Part 4: When to Use Each Feature (Quick Reference)

### Mode Settings Quick Guide

**Ask Mode** (🤔 Advisory)
- AI suggests/explains, YOU execute manually
- Best for: Learning, questions, planning

**Plan Mode** (📋 Transparent Execution)
- AI creates plan → You review/approve → AI executes
- Best for: Multi-file work, learning workflows, transparency

**Agent Mode** (🚀 Autonomous)
- AI executes immediately, minimal approval
- Best for: Speed, trusted tasks, less oversight needed

---

### 🗣️ Use CHAT (Cmd+L) when you need to:
- ✅ Plan architecture or approach
- ✅ Ask "how do I..." questions
- ✅ Understand existing code
- ✅ Debug complex issues
- ✅ Get explanations
- ✅ Brainstorm solutions

**Example prompts:**
- "What's the best way to structure this API?"
- "How should I handle rate limiting?"
- "Explain how JWT authentication works"

### ✏️ Use EDIT MODE (Cmd+K) when you need to:
- ✅ Modify code in current file
- ✅ Add a single feature
- ✅ Refactor a function
- ✅ Add comments/docs
- ✅ Fix a bug in one place
- ✅ Quick, focused changes

**Example prompts:**
- "Add error handling to this function"
- "Refactor to use async/await"
- "Add JSDoc comments"

### 🎼 Use COMPOSER (Cmd+I) when you need to:
- ✅ Create multiple related files
- ✅ Refactor across files
- ✅ Build a complete feature
- ✅ Update imports and dependencies
- ✅ Ensure files work together
- ✅ Coordinate complex changes

**Example prompts:**
- "Add authentication across the app"
- "Create a complete CRUD feature"
- "Refactor to use TypeScript"

---

## Verification Checklist

After completing this lab, you should have:

- [ ] Used Chat to plan the API architecture
- [ ] Used Cmd+K to add routes to server.js
- [ ] Used Cmd+K to add error handling
- [ ] Used Cmd+K to add validation
- [ ] Used Composer to create multi-file auth system
- [ ] Understanding of when to use each mode

---

## Bonus Challenge (If Time Permits)

### Challenge 1: Add Database Integration with Composer
Use Composer to:
```
Add MongoDB integration:
1. Create config/database.js
2. Create models/Task.js with Mongoose schema
3. Update server.js to connect to DB
4. Update all task routes to use real database operations
5. Add proper error handling for DB operations
```

### Challenge 2: Add Testing with Composer
```
Add comprehensive testing:
1. Create tests/tasks.test.js with Jest
2. Test all CRUD operations
3. Test authentication
4. Test validation
5. Add test scripts to package.json
```

### Challenge 3: Use Chat for Optimization
Ask Chat:
```
@Files server.js - Review this API for:
- Performance bottlenecks
- Security vulnerabilities
- Missing best practices
Suggest improvements
```

Then use Cmd+K or Composer to apply the suggestions.

---

## Real-World Application

This workflow mirrors professional development:

**Planning Phase:** Use Chat
- "How should I architect this?"
- "What are the trade-offs?"

**Implementation Phase:** Use Edit
- Quick fixes
- Single-file features
- Focused refactoring

**Integration Phase:** Use Composer
- Multi-file features
- Cross-cutting concerns
- System-wide refactors

---

## Common Mistakes to Avoid

❌ **Using Cmd+K for multi-file changes**
- Cmd+K only edits the current file
- Use Composer instead

❌ **Using Composer for tiny changes**
- Overkill for changing one line
- Use Cmd+K instead

❌ **Not using Chat first**
- Plan before coding
- Understand before implementing

❌ **Accepting without reviewing**
- Always read generated code
- Understand what it does
- Test it works

---

## Key Takeaways

1. **Chat = Brain** 🧠
   - Planning, understanding, learning

2. **Edit = Scalpel** 🔪
   - Precise, focused changes

3. **Composer = Conductor** 🎼
   - Orchestrates multiple files

4. **Use the right tool for the job**
   - Don't use a hammer for everything
   - Switch modes based on task

5. **Always review AI output**
   - AI is powerful but not perfect
   - You're still the developer

---

## Next Steps

Move on to **Lab 2: .cursorrules and AGENTS.md** to learn how to customize Cursor's behavior and create autonomous agents.

## Files Created

```
server.js                  # Main Express server
middleware/auth.js         # Authentication middleware
models/User.js            # User model
models/Task.js            # Task model (if bonus)
config/database.js        # DB config (if bonus)
.env.example              # Environment template
tests/                    # Tests (if bonus)
```

---

## Troubleshooting

### Q: Composer created the structure but no files appeared?
**A:** This depends on which mode you're using:

**If using Plan mode:**
- Did you click **"Approve Plan"** when shown the plan?
- After approval, Cursor should create files automatically
- Check the file explorer on the left
- Look for progress indicators

**If using Agent mode:**
- Files should be created immediately
- Check the file explorer
- May happen very fast

**If using Ask mode:**
- Cursor gives you code, but YOU create the files manually
- You need to create each file and paste the code
- This is intentional - Ask mode doesn't execute for you

### Q: Should Composer automatically create server.js in Part 2?
**A:** No! Part 2 uses **Cmd+K (Edit mode)** on the *existing* `server.js` file from the starter folder. Composer is only used in Part 3 for the multi-file auth system.

### Q: What's the difference between Ask, Plan, and Agent modes?
**A:** Cursor has three modes in Chat and Composer:

**Ask Mode** (🤔 Advisory)
- AI gives you code and advice
- YOU execute the changes manually
- Copy-paste code, create files yourself
- Most control, most manual work
- Best for: Learning, understanding, questions

**Plan Mode** (📋 Transparent)
- AI creates a detailed plan for you to review
- You can edit the plan
- You approve the plan
- AI executes automatically
- You see each step
- Best for: Learning workflows, transparency, multi-file work

**Agent Mode** (🚀 Autonomous)
- AI executes immediately with minimal approval
- Less detailed planning visible
- Faster execution
- Creates/modifies files automatically
- Best for: Speed, trusted tasks

**For this lab:**
- Part 1 (Chat): Use **Ask** mode (just asking for advice)
- Part 2 (Cmd+K): No mode selection (direct editing)
- Part 3 (Composer): Use **Plan** mode to see transparent execution!

More advanced Agent workflows are covered in Lab 2.

### Q: Composer generated the code but I don't see the files?
**Steps to fix:**
1. Check the Composer panel on the right side
2. Look for file tabs at the top (middleware/auth.js, models/User.js, etc.)
3. Click each tab to review the code
4. Click **"Accept All"** to create all files
5. Check your file explorer - files should appear

### Q: Where should the new files be created?
**A:** In your working directory (`my-api/`):
```
my-api/
├── server.js (modified)
├── middleware/
│   └── auth.js (new)
├── models/
│   └── User.js (new)
├── .env.example (new)
└── package.json (existing)
```

### Q: Can I use Plan Mode instead?
**A:** Plan Mode is great for transparency! If Cursor offers to create a plan, you can:
1. Review the plan
2. Edit it if needed
3. Approve it
4. Watch Cursor execute each step

This is covered more in Lab 2 and Lab 4.

---

**Pro Tip:** Save this workflow pattern. You'll use Chat → Edit → Composer hundreds of times in real projects!
