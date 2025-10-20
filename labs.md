# Cursor AI for Developers
## Hands-on AI-Assisted Coding
## Session Labs
## Revision 1.2 - 10/20/25

**Follow the startup instructions in the README.md file IF NOT ALREADY DONE!**

---

**Lab 1 - Understanding Cursor's Three Modes - Build a REST API**

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

**Lab 3 - Refactor One Function - Modernize Callback Code**

**Purpose: In this lab, we'll use Cmd+K to refactor a single callback-based function to modern async/await. This is a focused, practical introduction to code modernization.**

**Duration:** 5 minutes

1. Open your `server.js` from Lab 1 (in the my-api folder). Add the code below, which is a simple function with a callback:

```javascript
// Add this function to server.js
function getUserData(userId, callback) {
  setTimeout(() => {
    if (!userId) {
      callback(new Error('User ID required'), null);
    } else {
      callback(null, { id: userId, name: 'Test User', email: 'test@example.com' });
    }
  }, 100);
}

// Usage example
getUserData(123, (err, user) => {
  if (err) {
    console.error('Error:', err);
  } else {
    console.log('User:', user);
  }
});
```

![Adding code](./images/cursor35.png?raw=true "Adding code")

<br><br>

2. Save your changes. Select **ONLY** the `getUserData` function (not the usage example below it), press Cmd+K, and give this prompt:

```
Convert this callback function to async/await:
- Make it return a Promise
- Add try-catch error handling inside the Promise
- Add JSDoc comments
- Keep the function standalone, don't change the usage example below
```

![Convert prompt](./images/cursor36.png?raw=true "Convert prompt")


<br><br>

3. Review the generated code. Check that it has:
   - ✅ JSDoc comments with @param and @returns
   - ✅ `async` keyword (either `async function` or `const x = async ()`)
   - ✅ Returns a Promise or uses await
   - ✅ No callback parameter anymore
   - ✅ Error handling (try-catch or reject in Promise)

An example is shown below. Your code might look different as AI can refactor in different valid ways. As long as it's async/await instead of callbacks, it's correct.

![Convert output](./images/cursor37.png?raw=true "Convert output")

Notice the old callback-style usage example below should still be there unchanged.

<br><br>

4. Accept the changes with Cmd+Enter or the **"Keep"** button. You can ignore the "Review next file" entry if you see that. That's because we had multiple files generated from the interaction with the background agent in the previous lab.

<br><br>

5. Now let's refactor the usage example. Select the callback-style usage code at the bottom, press Cmd+K:

```
Update this to use async/await with try-catch to call the new Promise-based function
```

![Refactor usage](./images/cursor38.png?raw=true "Refactor usage")

<br><br>

6. Review and accept. Check that the new usage code has:
   - ✅ `await getUserData(123)` instead of callback
   - ✅ `try-catch` for error handling
   - ✅ No more callback pyramid - just clean sequential code!

The exact format might vary (wrapped in a function, top-level await, etc.) but the key is: **no more callbacks, just clean async/await**.

![Post refactor](./images/cursor39.png?raw=true "Post refactor")

<br><br>

7. Compare the before and after - note how much more readable async/await is. You can then persist the changes via the **"Keep"** or keyboard shortcuts.

<br><br>


**Verification**

You've successfully:
- Converted a callback function to async/await
- Added proper error handling with try-catch
- Added JSDoc comments
- Modernized the usage example
- Learned how Cmd+K helps with focused refactoring

**Key Takeaways:**

1. **Cmd+K is Perfect for Single-Function Refactoring** - Quick, focused changes to one piece of code
2. **Async/Await is Cleaner Than Callbacks** - Easier to read and understand
3. **AI Understands Context** - It knows how to properly convert callback patterns to Promises
4. **Review Before Accepting** - Always check that the refactored code makes sense

<p align="center">
**[END OF LAB]**
</p>
</br></br>

