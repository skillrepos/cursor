# Cursor AI for Developers
## Hands-on AI-Assisted Coding
## Session Labs
## Revision 3.2 - 11/02/25

**Follow the startup instructions in the README.md file IF NOT ALREADY DONE!**

**Some screenshots/interfaces may look different depending on your platform and differences in Cursor 2.0**

**Make sure you have the following ready to go.**
- A local instance of Cursor 2.0 installed
- A GitHub userid on the public GitHub.com
- A local installation of Git

---

**Lab 1 - Understanding Cursor's Autocomplete Functionality**

**Purpose: In this lab, we'll see how to use Cursor's autocomplete for code suggestions.**


1. Start the Cursor app. Sign in if needed. Then select *Clone repo* on the main screen.

![clone in Cursor](./images/cursor81.png?raw=true "Clone in Cursor")

<br><br>

2. In the dialog that comes up, enter the repository path and hit *Enter*. Then select the destination folder and click "Open" to open the cloned repository.

```
https://github.com/skillrepos/cursor
```

![Enter path](./images/cursor82.png?raw=true "Enter path")

![Open clone](./images/cursor83.png?raw=true "Open clone")

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

**Lab 2 - Ask vs. Edit Modes - Build a REST API**

**Purpose: Learn when to use Ask mode for planning and advice versus Edit mode (Cmd+K) for making code changes. Get architecture guidance using Ask mode, then implement routes, error handling, and validation using inline editing.**

1. Let's see how we can use Chat's modes to plan and understand changes. If not open, open Chat by pressing Cmd+L (Mac) or Ctrl+L (Windows). Make sure you're in **Ask mode** for asking questions and getting advice (not making changes yet).

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

**Lab 3 - Multi-File Coordination with Plan Mode**

**Purpose: Learn how to use Plan mode for multi-file features and explore the new Agents panel. Create a complete authentication system spanning multiple files with AI-guided planning and execution.**

1. Open a new chat via Cmd+Shift+L / Ctrl+Shift+L or via using the "+" sign in upper right of Chat panel.

<br><br>

2. Choose **Plan** mode so we can see the planning + execution by setting the mode dropdown to **"Plan"**. 


![Plan mode](./images/cursor12.png?raw=true "Plan mode")

<br><br>

3. Before we start, let's explore Cursor 2.0's new **Agents panel**. Look for the **"Agents"** button in your sidebar (typically on the left side of the window). Click it to open the Agents panel.

This panel shows:
- Running agents and their real-time progress
- Agent plans and task breakdowns
- The ability to run multiple agents in parallel (advanced feature)

You can toggle between the traditional file-based view and the new agent-first view here. For this lab, either view works - use what feels comfortable. 

![Agent panel](./images/cursor98.png?raw=true "Agent panel")

<br><br>

4. Type this in the Chat panel to request a multi-file authentication feature:

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

7. After it gets the answers to the questions, Cursor will provide a detailed plan with a set of "todos". It will probably open up a file with the detailed plan automatically, but if not, you can click on the "Read detailed plan" link to open it up. You can also watch the plan progress in the **Agents panel** you opened earlier.


![Detailed plan](./images/cursor16.png?raw=true "Detailed plan")

<br><br>

8. Review the plan carefully, read each step, then click **"Build"** when ready to have Cursor execute the plan.

<br><br>

9. After clicking **"Build"**, watch as Cursor creates each file automatically, shows progress as it works, and displays the final results. The **Agents panel** will show real-time progress as each task completes.

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


1. `.cursorrules` teaches Cursor your project's standards. Every AI suggestion follows these rules automatically. In *Editor* panel (not the *Agents* one), in the file explorer on the left, select one of the files in the root of the **"my-api"** directory, such as **"package.json"** or **"server.js"**. Then click on the **"New File..."** icon (see screenshot) or you can use the menu at **"File->New Text File"** entry.

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

4. Test your rules by opening a new Chat ("+" in upper right of Chat panel), make sure you're in Ask mode for asking questions, and ask: "Create a function to delete a user". Notice how Cursor automatically follows your rules by using async/await, including try-catch, adding JSDoc comments, having proper error handling, and using your naming conventions.

![Testing rules](./images/cursor25.png?raw=true "Testing rules")





<br><br>


5. Now let's create an `AGENTS.md` file. `AGENTS.md` guides autonomous AI Agents through complex, multi-step tasks. Create the file in the same way as you did for the .cursorrules one.


![Creating AGENTS.md file](./images/cursor26.png?raw=true "Creating AGENTS.md file")

<br><br>

6. Add the following content to define agent workflows:

```markdown
# AI Agent Guidelines

This file guides AI agents working on the Task Management API project.
All code must follow the conventions defined in .cursorrules.

## File Organization

When creating new files, use these locations:

- **Routes**: `/routes` directory (e.g., `routes/tasks.js`, `routes/comments.js`)
- **Middleware**: `/middleware` directory (e.g., `middleware/auth.js`, `middleware/validation.js`)
- **Models**: `/models` directory (e.g., `models/User.js`, `models/Task.js`)
- **Configuration**: `/config` directory
- **Tests**: `/tests` directory, mirroring the structure being tested
- **Main server**: `server.js` is the entry point - import and mount new routes here

## Workflow for Adding Features

When implementing a new feature (API endpoint, authentication, etc.):

1. **Plan**: Identify all files needed and their dependencies
2. **Create**: Build files in appropriate directories following the structure above
3. **Integrate**: Update `server.js` to import and use new routes/middleware
4. **Test**: Create corresponding test files with success and error cases
5. **Verify**: Run tests and manually test endpoints

## Important Rules

- **Ask first** if requirements are unclear or ambiguous
- **Test your work** - don't just create code, verify it works
- **Break down complexity** - tackle multi-file features one step at a time
- **Coordinate imports** - ensure all files properly import dependencies
- **Don't break existing code** - preserve working functionality unless explicitly asked to change it
```

![Completing AGENTS.md file](./images/cursor99.png?raw=true "Completing AGENTS.md file")

<br><br>

7. Open a new chat via the "+" sign in the upper right of the chat panel. Now, let's test the new AGENTS.md file with Plan Mode by switching to **"Plan"** (via the dropdown), and requesting a complex task. After entering the prompt, go ahead and hit Enter/Submit:

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

8. You may be asked questions to proceed. You can supply answers as we did in lab 3, step 6, or just tell the AI to take the defaults (first options) and proceed by typing "proceed" in the chat.


![Proceed for complex task](./images/cursor31.png?raw=true "Proceed for complex task")

<br><br>

9. Review the generated plan. (You can see the "todos" in the chat and also click on those to see the "add-comments.plan.md" file with similar contents.) Notice how the AI follows the "How to Add a New Feature" workflow from AGENTS.md:
   - Plans the files needed and dependencies
   - Creates route file in /routes directory
   - Integrates by updating server.js
   - Creates test file with test cases
   - Follows file organization conventions from AGENTS.md
  
![Plan file](./images/cursor100.png?raw=true "Plan file")

<br><br>

10. If the plan looks good, execute it with the **"Build"** command.

![Building for complex task](./images/cursor32.png?raw=true "Building for complex task")


<br><br>

11. You may be prompted to allow execution of some commands along the way. You can add commands to the Allow list or just select **"Run"**.

![Proceed for complex task](./images/cursor33.png?raw=true "Proceed for complex task")

<br><br>

12. After the build runs, you should see information about changed files, tests passed, etc.

![Completed build](./images/cursor101.png?raw=true "Completed build")

<br><br>

<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 5 - Code Review and Debugging**

**Purpose: Learn how to use Cursor to review code and debug errors.**

1. Open your `server.js` file. Let's ask Cursor to review the code. Open a new Chat with the "+" sign, make sure you're in Ask mode, and type:

```
@File server.js - Review this code and suggest improvements for security, code quality, and best practices.
```

Review Cursor's suggestions. 

![Request to review](./images/cursor50.png?raw=true "Request to review")



<br><br>

2. For focused feedback, select any function in your code (click and drag to highlight it), switch to the chat interface and type:

```
@selection - Review this function. What could be improved?
```

Notice how @selection gives targeted feedback. You can also use @Folder to review directories or @Codebase to search your entire project.

![Review request](./images/cursor65.png?raw=true "Review request")

<br><br>


3. Let's debug a real error. Add this buggy health check route in `server.js` right after the `app.use(express.json());` line:

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

4. Save the file. Open a terminal (menu: *Terminal->New Terminal*), start the server.

```bash
cd my-api
npm start
```

5. Then, in a new terminal (menu: *Terminal->Split Terminal*), test it with:

```bash
curl http://localhost:3000/health
```

You'll see an error: `TypeError: (intermediate value).toIsoString is not a function`

![Error](./images/cursor102.png?raw=true "Error")

<br><br>

6. Switch to the chat panel in Ask mode and ask Cursor to debug using @File for context:

```
I'm getting this error when I call GET /health:
"TypeError: (intermediate value).toIsoString is not a function"

@File server.js - Look at the health check route. What's wrong and how do I fix it?
```

Cursor will read your code, identify the typo (toIsoString vs toISOString), and explain the fix.

![Error](./images/cursor103.png?raw=true "Error")

<br><br>

7. Now let's have Cursor fix it automatically. Click back in the original chat question, switch to **Agent mode**, and submit again. Cursor will correct the error and verify the fix works.

![Switch to agent](./images/cursor104.png?raw=true "Switch to agent")

![Keep change](./images/cursor105.png?raw=true "Keep change")

<br><br>

8. After this, you can click on the *Keep* button for the proposed change, stop the server in the terminal and start it again. Then try the curl command again and it should work.

![Keep change](./images/cursor106.png?raw=true "Keep change")

<br><br>

<p align="center">
**[END OF LAB]**
</p>
</br></br>

**Lab 6 - Browser Tool Testing and Driving Command Line Operations**

**Purpose: Learn how to test with the browser tool (new in 2.0!), and handle git operations.**


1. One of Cursor 2.0's most powerful features is the Browser tool - AI agents can now test their own code automatically. First, create a `public` folder in the *my-api* directory. You can do this in a terminal.

```
cd my-api  (if not already there)
mkdir public
```

<br><br>

2. Then open Chat in **Agent mode** and type in the text below:

```
Create a file public/counter.html with:
- A heading "Task Counter"
- A button that says "Add Task"
- A counter display starting at 0
- JavaScript to increment counter on click
Then open it in the browser and verify it works correctly
```

![Add counter instructions](./images/cursor107.png?raw=true "Add counter instructions")

<br><br>

3. Watch as Cursor creates the file, opens it in a browser, tests the button, and verifies functionality - all autonomously! 

![Automated browser](./images/cursor108.png?raw=true "Automated browser")

<br><br>

4. Now let's see Cursor catch and fix bugs automatically. In chat in Agent mode:

```
Modify counter.html: add a "Reset" button that should reset counter to 0, but introduce a bug where it resets to 1 instead. Then test it in the browser and fix the bug you find.
```

Cursor will add the buggy reset button, test it, notice the counter resets to 1 instead of 0, fix the bug, and test again. This test-and-iterate capability is a game-changer for development!

![Add bug](./images/cursor109.png?raw=true "Add bug")

![Fixed](./images/cursor110.png?raw=true "Fixed")

<br><br>

5. Let's commit your work. In Chat (Agent mode), type:

```
Check git status and create a commit with all my changes. Write a good commit message that describes what was built in these labs.
```

Cursor will run `git status`, stage files, generate a descriptive commit message, and may ask for your approval before committing.

![Review results](./images/cursor111.png?raw=true "Review results")

<br><br>

6. (Optional) Try other git operations like creating branches or viewing history:

```
Show me the git log for the last 3 commits in a readable format
```

You can also ask Cursor to create branches, merge changes, or handle any git workflow.

![Last 3 commits](./images/cursor69.png?raw=true "Last 3 commits")

<br><br>

<p align="center">
**[END OF LAB]**
</p>
</br></br>




