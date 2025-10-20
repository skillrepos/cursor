# Cursor AI for Developers
## Hands-on AI-Assisted Coding
## Session Labs
## Revision 1.2 - 10/20/25

**Follow the startup instructions in the README.md file IF NOT ALREADY DONE!**

---

**Lab 1 - Understanding Cursor's Modes - Build a REST API**

**Purpose: In this lab, we'll learn when to use Chat and Edit (Cmd+K) modes by building a real Express API. You will use Chat mode for planning and questions and Edit mode for focused single-file changes, and Composer mode for multi-file coordination.**

**Setup**

1. From the workshop root directory, execute the commands below and navigate to the API directory. 
```
cd cursor
cp -r labs/cursor-modes/starter my-api
cd my-api
```

<br><br>

2. Open the *my-api* folder in Cursor using one of the available methods (drag folder onto Cursor icon, use File → Open Folder in Cursor, or use the CLI command). Verify that you see the following files:
   - `server.js` - Basic Express server with TODO
   - `package.json` - Dependencies (express, jsonwebtoken, bcrypt)

![open in Cursor](./images/cursor3.png?raw=true "Open in Cursor")

<br><br>

3. Let's see how we can use Chat Mode to plan and understand changes. Open Chat by pressing Cmd+L (Mac) or Ctrl+L (Windows). Make sure the mode dropdown is set to **"Ask"**.

![Ask mode](./images/cursor4.png?raw=true "Ask mode")

<br><br>

4. Ask for architecture advice with the prompt below. Hit Enter when done. (You can copy and paste the prompt into Cursor.)

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

![Ask for advice](./images/cursor5.png?raw=true "Ask for advice")

<br><br>

5. Review the response from Chat. It should provide recommended project structure, middleware suggestions, and best practices.

![Cursor response](./images/cursor6.png?raw=true "Cursor response")

<br><br>

6. Now, let's look at some single file editing via inline Chat.  Open `server.js` in Cursor. You should see the basic Express server with a TODO comment. Place cursor after `app.use(express.json());` and press `Cmd+K` (or `Ctrl+K`). Type or copy/paste this specific instruction:

```
Add all 5 CRUD routes for tasks with:
- Proper HTTP methods
- Route parameters where needed
- Placeholder handlers that return status and JSON
- Comments explaining each route
```

![Cursor prompt](./images/cursor7.png?raw=true "Cursor prompt")

<br><br>

7. Press Enter and wait for the inline suggestion. Review the code, then accept with the *Accept* button at the start of the changes or the *Keep* button at the bottom.

![Accept](./images/cursor8.png?raw=true "Accept")

![Keep](./images/cursor9.png?raw=true "Keep")

<br><br>

8. Select the entire file (Cmd+A), press Cmd+K, and provide this instruction to add error handling:

```
Wrap all route handlers with try-catch
Add a global error handling middleware at the end
Include 404 handler
Return proper JSON error responses with status codes
```

![Add error handling](./images/cursor10.png?raw=true "Add error handling")

9. Review and accept the changes as before with either *Accept* at the top or *Keep* for each independent change.

<br><br>

10. Let's do one more. Select just the POST route, press Cmd+K, and add input validation:

```
Add validation middleware before the handler that checks:
- title is present and is a string
- description is optional but must be string if present
- priority is one of: low, medium, high
Return 400 with validation errors if invalid
```

Accept the changes as before.

![Keep](./images/cursor11.png?raw=true "Keep")


<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 2 - Multi-File Coordination with Composer**

**Purpose: In this lab, we'll utilize Composer mode for multi-file coordination. We'll continue working with the same Express app that we used in Lab 1.AI workflows.**

1. Working in the same project as in Lab 1, open Composer by pressing Cmd+I (Mac) or Ctrl+I (Windows), or click the Composer icon in the sidebar.

<br><br>

2. Choose **Plan** mode so we can see the planning + execution by setting the mode dropdown to **"Plan"**.


![Plan mode](./images/cursor12.png?raw=true "Plan mode")


<br><br>

3. Type this in Composer to request a multi-file authentication feature:

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

![Plan mode prompt](./images/cursor13.png?raw=true "Plan mode prompt")

<br><br>

5. In Plan mode, Cursor will prompt you for any needed information/responses to questions and then show you a detailed plan with steps it will take and list files it will create/modify. You will probably encounter some multiple-choice questions first from Cursor like the ones shown here:

![Plan mode questions](./images/cursor14.png?raw=true "Plan mode questions")

6. To answer these, you can just indicate in the chat the question number and the response. There are multiple ways to do this, but one way is with this kind of response. Go ahead and enter this text and hit Enter.

```
1-a, 2-a, 3-a
```

![Plan mode responses](./images/cursor15.png?raw=true "Plan mode responses")

7. After it gets the answers to the questions, Cursor will provide a detailed plan with a set of "todos". It will probably open up a file with the detailed plan automatically, but if not, you can click on the "Read detailed plan" link to open it up.


![Detailed plan](./images/cursor16.png?raw=true "Detailed plan")

<br><br>

8. Review the plan carefully, read each step, then click **"Build"** when ready to have Cursor execute the plan.

<br><br>

9. After clicking **"Build"**, watch as Cursor creates each file automatically, shows progress as it works, and displays the final results.

![Implemented plan](./images/cursor17.png?raw=true "Implemented plan")

<br><br>

10. Above the chat area, you should see text like **"3 Files"** indicating how many files were changed. You can expand that and see the proposed changes by clicking on the files. You can review each proposed change and select **"Undo"** or **"Keep"** on each, or you can just select **"Keep All"** in the area above chat to keep all proposed changes.

![Reviewing changes](./images/cursor18.png?raw=true "Reviewing changes")

<br><br>

**📝 Key Learning:** Use Composer when changes span multiple files and need coordination. It understands the relationships between files.

<br><br>

<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 3 - Project Rules & AI Agents - Build Consistent, Automated Workflows**

**Purpose: In this lab, we'll master .cursorrules for project standards and AGENTS.md for autonomous AI workflows. You will create .cursorrules to enforce team coding standards, write AGENTS.md to guide AI Agent behavior, and use Agent Mode with Plan Mode for complex tasks.**


1. `.cursorrules` teaches Cursor your project's standards. Every AI suggestion follows these rules automatically. In the file explorer on the left, select one of the files in the root of the **"my-api"** directory, such as **"package.json"** or **"server.js"**. Then click on the **"New File..."** icon (see screenshot) or you can use the menu at **"File->New Text File"** entry.

![Creating cursorrules file](./images/cursor21.png?raw=true "Creating cursorrules file")

<br><br>

2. Type in the name in the explorer for the new file **".cursorrules"** and hit Enter. This should then open it up as a new empty file in the editor.


![Starting cursorrules file](./images/cursor23.png?raw=true "Starting cursorrules file")

3. Copy and paste the text below into the file. Then save it.

```markdown
# Project: Task Management API

## Code Style
- Use ES6+ syntax (const/let, arrow functions, async/await)
- Use strict equality (===)
- Always use try-catch for async operations
- Add JSDoc comments to exported functions

## Security
- NEVER hardcode secrets - use environment variables
- Validate ALL user inputs
- Use parameterized queries (prevent SQL injection)

## Naming Conventions
- Functions/Variables: camelCase (getUserById)
- Constants: UPPER_SNAKE_CASE (MAX_RETRIES)
- Files: kebab-case (user-service.js)

## Error Handling
- Return consistent format: { success: false, message: string }
- Never swallow errors silently

## Testing
- Write tests for new features
- Use descriptive names: "should return 404 when task not found"

## This Project Uses
- Express.js for REST API
- JWT for authentication
- Jest for testing
```

![Completing cursorrules file](./images/cursor27.png?raw=true "Completing cursorrules file")

<br><br>

4. Test your rules by opening Chat (Cmd+L), set it to **"Ask"** mode and ask: "Create a function to delete a user". Notice how Cursor automatically follows your rules by using async/await, including try-catch, adding JSDoc comments, having proper error handling, and using your naming conventions.

![Testing rules](./images/cursor25.png?raw=true "Testing rules")

**📝 Key Learning:** .cursorrules affects ALL AI interactions - Chat, Cmd+K, and Composer automatically follow these rules.

<br><br>


5. Now let's create an `AGENTS.md` file. `AGENTS.md` guides autonomous AI Agents through complex, multi-step tasks. Create the file in the same way as you did for the .cursorrules one.


![Creating AGENTS.md file](./images/cursor26.png?raw=true "Creating AGENTS.md file")

<br><br>

6. Add the following content to define agent workflows:

```markdown
# AI Agent Guidelines

## What AI Agents Can Do
- Create and modify multiple files
- Run tests and check results
- Install dependencies

## Project Structure

/
├── server.js           # Main entry point
├── middleware/         # Auth, validation
├── models/             # Data models
├── routes/             # API routes
├── config/             # Configuration
├── tests/              # Test files
└── .cursorrules        # Project rules

## How to Add a New Feature

When asked to add a feature (like a new API endpoint):

1. **Plan**
   - Determine what files are needed
   - Identify required middleware
   - Consider edge cases

2. **Implement**
   - Create route file in /routes
   - Add validation middleware
   - Handle errors with try-catch
   - Update server.js

3. **Test**
   - Create test file
   - Test success and error cases

4. **Document**
   - Add JSDoc comments
   - Update README if needed

## Rules for Agents

### DO
Follow .cursorrules automatically
Ask if requirements are unclear
Test code after generating it
Use Plan Mode for multi-file changes

### DON'T
Make breaking changes without warning
Skip error handling
Hardcode secrets
Delete existing functionality

## Using Plan Mode

Plan Mode is great for complex tasks:
1. You describe what you want
2. Agent creates a detailed plan
3. You review and approve it
4. Agent executes the plan

**Example:**
"Add JWT authentication to the API"

The agent will plan to:
- Install dependencies
- Create auth middleware
- Add login/register routes
- Protect existing routes
- Add tests

## Tips for Better Results

**Good Request**: "Add user search endpoint with pagination. Return max 50 results per page."

**Vague Request**: "Add search feature"

Use @ symbols to provide context:
- `@Files` - Reference specific files
- `@Folder` - Include directory context
```

![Completing AGENTS.md file](./images/cursor28.png?raw=true "Completing AGENTS.md file")

<br><br>

6. Open a new chat via the "+" sign in the upper right of the chat panel. Now, test Agent Mode with Plan Mode by opening Composer (Cmd+I), switching to **"Plan"** Mode (via the dropdown), and requesting a complex task:

```
Add a new feature: GET /tasks/:id/comments endpoint

This should follow the workflow in AGENTS.md:
1. Plan what files are needed
2. Create route in routes/comments.js
3. Add validation middleware
4. Handle errors
5. Update server.js
6. Create basic test

Use Plan Mode to show me the steps first.
```

![Prompting for complex task](./images/cursor30.png?raw=true "Prompting for complex task")

<br><br>

7. You may be asked questions to proceed. You can supply answers as we did in lab 2, step 6, or just tell the AI to take the defaults (first options) and proceed by typing "proceed" in the chat. 


![Proceed for complex task](./images/cursor31.png?raw=true "Proceed for complex task")

<br><br>

8. Review the generated plan. (You can see the "todos" in the chat and also click on those to see the "add-comments.plan.md" file with similar contents.) Notice how the AI follows the "How to Add a New Feature" workflow from AGENTS.md:
   - ✅ Plans the files needed
   - ✅ Creates route file in /routes
   - ✅ Adds validation middleware
   - ✅ Includes error handling (try-catch)
   - ✅ Updates server.js
   - ✅ Creates test file

9. If the plan looks good, execute it with the **"Build"** command. 

![Building for complex task](./images/cursor32.png?raw=true "Building for complex task")
    
**📝 Key Learning:** AGENTS.md guides the AI's decision-making process for autonomous, multi-step tasks.

<br><br>

10. You may be prompted to allow execution of some commands along the way. You can add commands to the Allow list or just select **"Run"**.

![Proceed for complex task](./images/cursor33.png?raw=true "Proceed for complex task")

**Part 3: Configure Background Agents**

11. Background Agents work independently while you continue coding. Open a new chat tab, make sure you are set to use "Agent Mode" and then add this in the chat:

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

![Setting up background agent task](./images/cursor34.png?raw=true "Setting up background agent task")

<br><br>

12. The agent runs in background while you can code in other files. Check progress in Agent panel and review when complete.

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

**Lab 4 - Code Review & Git with AI**

**Purpose: Learn how to use Cursor to review code for improvements and handle git operations like commits and branches.**


**When You'll Use This:**
- Before committing code (review your own changes)
- When reviewing pull requests
- When you need help with git commands
- When creating commit messages


1. Open your `server.js` file. Let's ask Cursor to review the code. Open a new Chat with the "+" sign, set mode to **"Ask"**, and type:

```
@File server.js - Review this code and suggest improvements for:
- Security issues
- Code quality
- Best practices
- Performance optimizations
```

![Request to review](./images/cursor50.png?raw=true "Request to review")

<br><br>

2. Review Cursor's suggestions. You'll likely see recommendations like:
   - Adding rate limiting
   - Improving error messages
   - Adding input sanitization
   - Using helmet for security headers
   - Better logging practices

<br><br>

3. Now ask for specific review on a function. Select the `validateTask` function (click and drag to highlight it), then press Cmd+L and type:

```
@Selection - Review this validation function. What could be improved?
```

Notice how Cursor gives more focused feedback when you use @Selection on specific code.

<br><br>

**Part 2: Git Operations (4 min)**

4. Let's commit your changes. Open Chat (Cmd+L), set mode to **"Agent"** (we want Cursor to execute git commands), and type:

```
Check git status and create a commit with all my changes. Write a good commit message that describes what was built in these labs.
```

<br><br>

5. Cursor will:
   - Run `git status` to see changes
   - Stage files with `git add`
   - Generate a descriptive commit message
   - Show you the commit message before committing
   - Ask for your approval

Review the commit message and approve if it looks good.

<br><br>

6. Create a new branch for experimentation. In Chat (Agent mode), type:

```
Create a new git branch called "experiment/refactoring" and switch to it
```

Cursor will run `git checkout -b experiment/refactoring` for you.

<br><br>

7. Try asking Cursor to help with other git operations:

```
Show me the git log for the last 3 commits in a readable format
```

or

```
What files have I changed since the last commit?
```

**📝 Key Learning:** Cursor can execute git commands for you in Agent mode, write commit messages, create branches, and explain git concepts.

<br><br>

**Verification**

You've successfully learned:
- How to ask Cursor to review entire files with @File
- How to review specific functions with @Selection
- How to use Agent mode for git operations
- How to let Cursor write commit messages
- How to create branches with AI help

**Key Takeaways:**

1. **Code Review = Find Issues Early** - Use @File or @Selection to get AI feedback before committing
2. **Agent Mode for Git** - Let Cursor execute git commands when in Agent mode
3. **Better Commit Messages** - AI writes descriptive commits based on actual changes
4. **Learn Git** - Ask Cursor to explain any git command you don't understand
5. **Safe Automation** - Cursor always shows you what it will do before executing

**Practice Challenge:**

Try reviewing the middleware/auth.js file and ask Cursor for security improvements. Then commit any changes you make with AI-generated commit messages.

<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 5 - Debug with AI - Using Chat and Context Symbols**

**Purpose: Learn how to use Chat mode with @ symbols to debug errors quickly.**

**When You'll Use This:**
- When you get an error message you don't understand
- When code isn't working and you don't know why
- When you need to understand how existing code works

1. Add a simple health check route with a bug. Open `server.js` and add this code right after the `app.use(express.json());` line:

```javascript
// Health check endpoint
app.get('/health', (req, res) => {
  const status = {
    service: 'Task API',
    status: 'healthy',
    timestamp: new Date().toIsoString(),  // BUG: should be toISOString() not toIsoString()
    uptime: process.uptime()
  };
  res.json(status);
});
```

![Add health check](./images/cursor44.png?raw=true "Add health check")

<br><br>

2. Save the file and start your server:

```bash
npm start
```

![Start server](./images/cursor43.png?raw=true "Start server")

<br><br>

3. Now, you'll need another terminal to run commands in. You can open a new one by clicking on the "+" sign in the upper right of the *TERMINAL* area or clicking on the "Split Terminal" icon as shown in the screenshot.

![Split terminal](./images/cursor42.png?raw=true "Split terminal")

<br><br>

4. Now, let's test the health check endpoint:

```bash
curl http://localhost:3000/health
```

You'll see an error: `TypeError: (intermediate value).toIsoString is not a function`


![Error](./images/cursor45.png?raw=true "Error")

<br><br>

5. Let's have Cursor help us debug this. Open Chat (Cmd+L), set the mode to **"Ask"** (we just want advice, not execution), and use @ symbols to provide context:

```
I'm getting this error when I call GET /health:
"TypeError: (intermediate value).toIsoString is not a function"

@File server.js - Look at the health check route

What's wrong and how do I fix it?
```

![Error](./images/cursor46.png?raw=true "Error")

<br><br>

6. Notice how Chat:
   - Reads your actual code via @File
   - Identifies the typo (toIsoString vs toISOString)
   - Explains the problem clearly
   - Suggests the specific fix
  
![Error](./images/cursor47.png?raw=true "Error")

<br><br>
7. Let's see if Cursor can fix this automatically. Use the up arrow key to select the previous chat conversation. In that window, switch the mode to **"Agent"** and submit it again.

![Error](./images/cursor48.png?raw=true "Error")

8. Cursor should now go through and correct the error and suggest/run tests to verify functionality.

![Error](./images/cursor49.png?raw=true "Error")

9. You can try other @ symbols to explore their uses (just submit these prompts in the chat):

**@Files** - Reference multiple files:
```
How do these files work together?
@File middleware/auth.js
@File models/User.js
@File server.js
```

<br><br>

10. **@Folder** - Give context about a directory:

```
@Folder middleware/ - Explain what each middleware does
```

<br><br>

11. **@Codebase** - Search entire project:
    
```
@Codebase Where is JWT token validation handled?
```

<br><br>


**Why This Matters:**

The @ symbols are the **difference between vague AI help and precise AI help**:

❌ **Without context:** "How do I fix authentication?"
→ Generic answer, might not apply to your code

✅ **With context:** "@File middleware/auth.js @File server.js - Authentication is failing for /tasks endpoint, what's wrong?"
→ Specific answer based on YOUR actual code

**Verification**

You've successfully learned:
- How to use @File to show AI your code
- How to use @Selection to show errors
- How to use @Folder for directory context
- How to use @Codebase to search your project
- Why context makes AI answers 10x better

**Key Takeaways:**

1. **@ Symbols = Better AI Answers** - Always provide context, never ask vague questions
2. **@File for code context** - Let AI see the actual file contents
3. **@Selection for errors** - Copy error messages into Chat with @Selection
4. **@Codebase for searching** - Find things across your entire project
5. **You'll Use This Daily** - Debugging is where AI saves the most time

**Practice Challenge:**

Break something in your code (introduce a bug), then use Chat with @ symbols to fix it. This skill will save you hours of debugging time every week.

<p align="center">
**[END OF LAB]**
</p>
</br></br>


**Lab 5 - Cursor Agent CLI - Automate AI Tasks from Terminal (Optional - Requires Pro)**

**⚠️ Note: This lab is OPTIONAL and requires a paid Cursor Pro subscription ($20/month).**

**Purpose: Learn to use cursor-agent CLI for batch operations and automation. This is powerful for refactoring entire codebases, adding documentation, or running AI tasks in CI/CD pipelines.**

**Duration:** 10 minutes

**Prerequisites:**
- ⚠️ **Cursor Pro subscription required** ($20/month) - CLI shares your IDE usage pool
- Terminal access
- Your my-api project from previous labs

**If you don't have Pro:** You can skip this lab. Labs 1-4 cover all the free features of Cursor you need to be productive!

**Setup**

1. Install cursor-agent CLI (if not already installed):

```bash
curl https://cursor.com/install -fsSL | bash
```

<br><br>

2. Verify installation:

```bash
cursor-agent --version
```

<br><br>

**Part 1: Interactive Chat Mode**

3. Navigate to your my-api project and start an interactive session:

```bash
cd my-api
cursor-agent
```

This opens an interactive terminal chat with the AI that can see and modify your codebase.

<br><br>

4. Try a simple task in the interactive session:

```
Add JSDoc comments to all functions in server.js
```

<br><br>

5. Review the proposed changes. The CLI will:
   - Show you what files it wants to modify
   - Show you the diff of changes
   - Ask for your approval before applying

Type `y` to accept or `n` to reject. Type `exit` to leave the session.

<br><br>

**Part 2: Non-Interactive Mode**

6. Run a task directly from the command line (non-interactive):

```bash
cursor-agent chat "Find any console.log statements and replace them with proper logging using a logger"
```

This runs the task and exits. Review the changes it proposes.

<br><br>

**Part 3: Batch Operations**

7. Try a batch operation across multiple files:

```bash
cursor-agent "Convert all var declarations to const or let across the entire project"
```

Notice how cursor-agent:
- Scans all files in the project
- Identifies all `var` declarations
- Proposes changes across multiple files
- Asks for approval before applying

<br><br>

**Part 4: Managing Sessions**

8. List previous conversations:

```bash
cursor-agent ls
```

<br><br>

9. Resume your last session:

```bash
cursor-agent resume
```

This continues where you left off, maintaining context from your previous conversation.

<br><br>

**Part 5: Advanced Usage**

10. Run a task with automatic testing:

```bash
cursor-agent "Add input validation to all POST routes. Run npm test after applying changes."
```

The CLI can:
- Make changes
- Run tests automatically
- Report results
- All from the terminal!

<br><br>

**When to Use CLI vs IDE**

**Use cursor-agent CLI when:**
- ✅ Batch operations across many files
- ✅ Automation in scripts or CI/CD
- ✅ Quick terminal-based fixes
- ✅ Remote server work (SSH)
- ✅ Already in terminal workflow

**Use Cursor IDE when:**
- ✅ Active development and exploration
- ✅ Need visual file explorer
- ✅ Want inline diff view
- ✅ Complex debugging
- ✅ Multi-tab editing

<br><br>

**Verification**

You've successfully:
- Installed and used cursor-agent CLI
- Run interactive and non-interactive sessions
- Made batch changes across multiple files
- Managed conversation history
- Understood CLI vs IDE use cases

**Key Takeaways:**

1. **CLI for Automation** - cursor-agent CLI enables scripting AI tasks and CI/CD integration
2. **Shares Your Subscription** - Uses the same Pro plan as Cursor IDE (same usage pool)
3. **Safety First** - Always requires approval for file changes and shell commands
4. **Batch Power** - Excellent for codebase-wide refactors (add comments, convert patterns, etc.)
5. **Terminal Native** - Works great in SSH sessions, CI pipelines, or terminal-focused workflows
6. **Session Management** - Resume conversations, list history, continue where you left off

**Warning:** CLI is in beta. It can read, modify, and delete files. Only use in trusted environments and always review changes before accepting.

<p align="center">
**[END OF LAB]**
</p>
</br></br>

<p align="center">
**WORKSHOP COMPLETE! 🎉**
</p>

You've now learned:
- ✅ Chat Mode - Planning and questions
- ✅ Cmd+K (Edit Mode) - Focused single-file changes
- ✅ Composer Mode - Multi-file coordination
- ✅ .cursorrules - Project standards
- ✅ AGENTS.md - Workflow templates
- ✅ Background Agents - Parallel work
- ✅ Plan Mode - Transparent execution
- ✅ cursor-agent CLI - Terminal automation and batch operations
- ✅ @ Symbols - Context for better AI answers

**What You Can Do Now:**
- Use Chat, Cmd+K, and Composer effectively for different tasks
- Configure projects with .cursorrules and AGENTS.md
- Automate batch operations with cursor-agent CLI
- Debug errors with AI assistance using @ symbols
- Work faster and smarter with AI assistance

**Next Steps:**
1. **Practice** - Use these techniques in your real projects
2. **Start Small** - Begin with simple .cursorrules, add more as needed
3. **Experiment** - Try different prompts and approaches
4. **Share** - Teach your team what you learned

**Congratulations on completing the Cursor AI Workshop!**

You're now equipped to code faster and smarter with AI assistance. 🚀
