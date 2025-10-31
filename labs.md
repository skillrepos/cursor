# Cursor AI for Developers
## Hands-on AI-Assisted Coding
## Session Labs
## Revision 2.0 - 10/31/25

**Follow the startup instructions in the README.md file IF NOT ALREADY DONE!**

**Make sure you have the following ready to go.**
- A local instance of Cursor 2.0 installed
- A GitHub userid on the public GitHub.com
- A local installation of Git

---

**Lab 1 - Smart Autocomplete & Inline Editing**

**Purpose: Explore Cursor 2.0's real-time autocomplete and inline editing.**


1. Start the Cursor app and select *Clone repo* on the main screen.

![clone in Cursor](./images/cursor81.png?raw=true "Clone in Cursor")

<br><br>

2. In the dialog that comes up, enter the repository path and hit *Enter*. Then select the destination folder and click "Open" to open the cloned repository.

```
https://github.com/skillrepos/cursor
```

<br><br>

3. Note that you should be on the *Editor* tab in the top left, not *Agents*. Expand the *my-api* folder in Cursor. Verify that you see the following files:
   - `server.js` - Basic Express server with TODO
   - `package.json` - Dependencies (express, jsonwebtoken, bcrypt)

![open in Cursor](./images/cursor84.png?raw=true "Open in Cursor")

<br><br>

4. First, let's enable Tab autocomplete if it's not already on. Go to Cursor Settings (via menu or gear icon in upper right), search for "Cursor Tab", and make sure it's enabled under Features > Cursor Tab. Also make sure that "Partial Accepts" is enabled. You can click on the "X" at the top afterwards to close that tab.

![Enable Tab](./images/cursor85.png?raw=true "Enable Tab")

<br><br>

5. Open `server.js`. Start typing a new function below the existing code:

```javascript
// Start typing this:
function validateTask
```

As you type, you should see **gray ghost text** appear - this is Cursor suggesting the rest of the code. Press *Tab* to accept the suggestion. If you don't see the complete suggestion, hit *Tab* or *Enter* and then wait for Cursor to suggest more code. As Cursor suggests the remainder of the code, you can just use *Tab* to accept it until the function is complete.

![Auto1](./images/cursor58.png?raw=true "Auto1")

<br><br>

6. Try another example. Start typing a comment:

```javascript
// Function to get all tasks from
```

Notice how Cursor predicts you might write "database" or "storage" and suggests completing your comment. Instead of using **Tab** to accept the full change, use the **Cmd/Ctrl + right arrow** to accept one word at a time. When you get enough, hit *Esc* to reject the changes. 


![Auto2](./images/cursor53.png?raw=true "Auto2")

<br><br>

7. Now try writing a function signature:

```javascript
async function createTask(req
```

Cursor should suggest the remaining parameters like `req, res` or similar. Press Tab to accept.

![Auto3](./images/cursor54.png?raw=true "Auto3")


<br><br>

8. To avoid any issues down the line, let's revert the file back to its original version. To do this, with the file active in the editor, click on the the *File* menu and then select *Revert File*. (If you don't see that entry, you can always just highlight and delete the text instead.)

![Revert file](./images/cursor86.png?raw=true "Revert file")


<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 2 - Understanding Cursor's Modes - Build a REST API**

**Purpose: In this lab, we'll learn when to use Chat and Edit (Cmd+K) modes by building a real Express API. You will use Chat mode for planning and questions and Edit mode for focused single-file changes, and Composer mode for multi-file coordination.**

1. Let's see how we can use Chat Mode to plan and understand changes. If not open, open Chat by pressing Cmd+L (Mac) or Ctrl+L (Windows). Make sure the mode dropdown is set to **"Ask"**.

![Ask mode](./images/cursor4.png?raw=true "Ask mode")

<br><br>

2. Ask for architecture advice with the prompt below. Hit Enter when done. (You can copy and paste the prompt into Cursor.)

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

3. Review the response from Chat. It should provide recommended project structure, middleware suggestions, and best practices.

![Cursor response](./images/cursor6.png?raw=true "Cursor response")

<br><br>

4. Now, let's look at some single file editing via inline Chat.  If not already open, open `server.js` in Cursor. You should see the basic Express server with a TODO comment. Place cursor after `app.use(express.json());` and press `Cmd+K` (or `Ctrl+K`). Type or copy/paste this specific instruction:

```
Add all 5 CRUD routes for tasks with:
- Proper HTTP methods
- Route parameters where needed
- Placeholder handlers that return status and JSON
- Comments explaining each route
```

![Cursor prompt](./images/cursor7.png?raw=true "Cursor prompt")

<br><br>

5. Press Enter and wait for the inline suggestion. Review the code, then accept with the *Accept* button at the start of the changes or the *Keep* button at the bottom.

![Accept](./images/cursor8.png?raw=true "Accept")

![Keep](./images/cursor9.png?raw=true "Keep")

<br><br>

6. Select the entire file (Cmd+A), press Cmd+K, and provide this instruction to add error handling:

```
Wrap all route handlers with try-catch
Add a global error handling middleware at the end
Include 404 handler
Return proper JSON error responses with status codes
```

![Add error handling](./images/cursor10.png?raw=true "Add error handling")

<br><br>

7. Review and accept the changes as before with either *Accept* at the top or *Keep* for each independent change.

![Add error handling](./images/cursor59.png?raw=true "Add error handling")

<br><br>

8. Let's do one more. Select just the POST route, press Cmd+K, and add input validation:

```
Add validation middleware before the handler that checks:
- title is present and is a string
- description is optional but must be string if present
- priority is one of: low, medium, high
Return 400 with validation errors if invalid
```

Accept the changes as before.

![Prompt](./images/cursor62.png?raw=true "Prompt ")

![Keep](./images/cursor60.png?raw=true "Keep")

<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 3 - Multi-File Coordination with Chat**

**Purpose: In this lab, we'll utilize Chat mode for multi-file coordination.**

1. If not already open, open the main Chat panel via Cmd+L.

<br><br>

2. Choose **Plan** mode so we can see the planning + execution by setting the mode dropdown to **"Plan"**.


![Plan mode](./images/cursor12.png?raw=true "Plan mode")


<br><br>

3. Type this in the Chat panel to request a multi-file authentication feature:

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

<br><br>

6. To answer these, you can just indicate in the chat the question number and the response (like the example below). There are multiple ways to do this, but one way is with this kind of response. The default answers are usually the first one (a) for each question. You can just tell it to "Use default answers" (in the Chat dialog) or you can respond with a chosen answer for each using the format below. 

```
1-a, 2-a, 3-a
```

![Plan mode responses](./images/cursor15.png?raw=true "Plan mode responses")

<br><br>

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

<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 4 - Project Rules & AI Agents - Build Consistent, Automated Workflows**

**Purpose: In this lab, we'll focus on .cursorrules for project standards and AGENTS.md for autonomous AI workflows. You will create .cursorrules to enforce team coding standards, write AGENTS.md to guide AI Agent behavior, and use Agent Mode with Plan Mode for complex tasks.**


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

4. Test your rules by opening a new Chat ("+" in upper right of Chat panel), set it to **"Ask"** mode and ask: "Create a function to delete a user". Notice how Cursor automatically follows your rules by using async/await, including try-catch, adding JSDoc comments, having proper error handling, and using your naming conventions.

![Testing rules](./images/cursor25.png?raw=true "Testing rules")



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

6. Open a new chat via the "+" sign in the upper right of the chat panel. Now, test Agent Mode with Plan Mode by opening Composer (Cmd+I), switching to **"Plan"** Mode (via the dropdown), and requesting a complex task. After entering the prompt, go ahead and hit Enter/Submit:

```
Add a new feature: GET /tasks/:id/comments endpoint

Follow the workflow in AGENTS.md:
1. Plan what files are needed
2. Create route in routes/comments.js
3. Add validation middleware
4. Handle errors
5. Update server.js
6. Create basic test
```

![Prompting for complex task](./images/cursor63.png?raw=true "Prompting for complex task")

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
    

<br><br>

10. You may be prompted to allow execution of some commands along the way. You can add commands to the Allow list or just select **"Run"**.

![Proceed for complex task](./images/cursor33.png?raw=true "Proceed for complex task")

<br><br>


<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 5 - Code Review & Git with AI**

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


![Review results](./images/cursor64.png?raw=true "Review results")

<br><br>

3. Now ask for specific review on a function. Select the `validateTask` or `validateTaskInput function (click and drag to highlight it), then press Cmd+L and type:

```
@Selection - Review this validation function. What could be improved?
```

![Review request](./images/cursor65.png?raw=true "Review request")

4. After you submit the prompt, notice how Cursor gives more focused feedback when you use @Selection on specific code.


![Review results](./images/cursor66.png?raw=true "Review results")

<br><br>


5. Let's commit your changes. Open a new Chat, set mode to **"Agent"** (we want Cursor to execute git commands), and type:

```
Check git status and create a commit with all my changes. Write a good commit message that describes what was built in these labs.
```

<br><br>

5. Cursor will:
   - Run `git status` to see changes
   - Stage files with `git add`
   - Generate a descriptive commit message
   - Show you the commit message before committing
   - Ask for your approval (unless you've previously told it to just run everything)

Review the commit message and approve if it looks good.

![Review results](./images/cursor67.png?raw=true "Review results")

<br><br>

6. Create a new branch for experimentation. In Chat (Agent mode), type:

```
Create a new git branch called "experiment/refactoring" and switch to it
```

Cursor will run `git checkout -b experiment/refactoring` for you.


![Create branch](./images/cursor68.png?raw=true "Create branch")

<br><br>

7. Try asking Cursor to help with other git operations:

```
Show me the git log for the last 3 commits in a readable format
```

![Last 3 commits](./images/cursor69.png?raw=true "Last 3 commits")


<br><br>

<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 6 - Debug with AI - Using Chat and Context Symbols**

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

![How files work together](./images/cursor71.png?raw=true "How files work together")

<br><br>

10. **@Folder** - Give context about a directory:

```
@Folder middleware/ - Explain what each middleware does
```


![What middleware does](./images/cursor72.png?raw=true "What middleware does")


<br><br>

11. **@Codebase** - Search entire project:
    
```
@Codebase Where is JWT token validation handled?
```

![Where is JWT token validation handled](./images/cursor73.png?raw=true "Where is JWT token validation handled")

<br><br>



<p align="center">
**[END OF LAB]**
</p>
</br></br>



