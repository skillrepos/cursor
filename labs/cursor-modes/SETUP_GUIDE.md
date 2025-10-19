# Lab 1 Setup Guide

## Quick Start

From the workshop root directory, run:

```bash
npm run lab1:setup
cd my-api
```

Then open the `my-api` folder in Cursor:
- **Drag & Drop:** Drag the `my-api` folder onto the Cursor icon
- **File Menu:** In Cursor: File → Open Folder → Select `my-api`
- **CLI (if installed):** `cursor .`

This will:
1. Create a new `my-api` folder
2. Copy starter files (`server.js` and `package.json`)
3. Be ready for you to open in Cursor

## Optional: Install Cursor CLI

If you want to use `cursor .` command:

### Mac/Linux:
1. Open Cursor
2. Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Linux)
3. Type: `Shell Command: Install 'cursor' command in PATH`
4. Press Enter
5. Restart your terminal
6. Test: `cursor --version`

### Windows:
The Cursor CLI is usually installed automatically. If not:
1. Open Cursor
2. Press `Ctrl+Shift+P`
3. Type: `Shell Command: Install 'cursor' command in PATH`
4. Press Enter
5. Restart your terminal

**Note:** The CLI is optional - you can always open folders via drag-and-drop or File menu!

## What You Get

```
my-api/
├── server.js      # Basic Express server with TODO
└── package.json   # Dependencies (express, jsonwebtoken, bcrypt)
```

## Important Clarifications

### Understanding Ask, Plan, and Agent Modes

Cursor has three modes in Chat and Composer:

| Mode | What It Does | When to Use |
|------|--------------|-------------|
| **Ask** | AI gives code/advice, YOU execute manually | Questions, planning, learning |
| **Plan** | AI creates plan → YOU review/approve → AI executes | Transparent execution, learning workflows |
| **Agent** | AI executes autonomously with minimal approval | Speed, trusted tasks |

### This Lab's Approach

| Part | Feature | Keyboard | Mode | What You'll Do |
|------|---------|----------|------|----------------|
| **Part 1** | Chat | Cmd+L | **Ask** | Ask for architecture advice (no execution) |
| **Part 2** | Edit | Cmd+K | N/A | Direct inline editing |
| **Part 3** | Composer | Cmd+I | **Plan** (recommended) | See transparent plan + execution |

**Lab 2** covers more advanced Plan/Agent workflows with AGENTS.md.

### How Composer Works (Part 3)

**If using Plan mode (recommended for learning):**
1. You type the request in Composer
2. Cursor shows you a **detailed plan** of what it will do
3. You can **edit the plan** if needed
4. You review and click **"Approve Plan"**
5. Cursor **automatically creates/modifies files**
6. You see progress as it works
7. You review the final results

**If using Agent mode (fastest):**
1. You type the request in Composer
2. Cursor executes immediately with minimal planning shown
3. Files are created automatically
4. Less transparency but faster

**If using Ask mode (most manual):**
1. You type the request in Composer
2. Cursor gives you code snippets
3. **You manually create files** and paste code
4. Most work but most control

**Common Issue:** In Plan/Agent mode, if you don't approve the plan (Plan mode) or allow execution, files won't be created!

### server.js Already Exists

- **Part 1 (Chat):** Plan the API architecture
- **Part 2 (Cmd+K):** Edit the *existing* `server.js` file
- **Part 3 (Composer):** Create *new* auth files and modify server.js

You do NOT need to create `server.js` - it's in the starter files!

## Expected File Structure After Completion

```
my-api/
├── server.js           # Modified with routes, validation, error handling
├── package.json        # Existing
├── middleware/
│   └── auth.js        # NEW - Created by Composer
├── models/
│   └── User.js        # NEW - Created by Composer
└── .env.example       # NEW - Created by Composer
```

## Troubleshooting

### "No files in my-api folder"
Run: `ls -la my-api/`

Should show:
- `server.js`
- `package.json`

If empty, re-run: `npm run lab1:setup`

### "Composer didn't create files"
Check:
1. Did you click **"Accept All"** in Composer?
2. Look at the Composer panel (usually right side)
3. Check for file tabs at top of Composer
4. Review each file, then Accept

### "Where is server.js?"
It's already in the starter files! Open `server.js` and start with Part 2, Step 2 (Cmd+K).

### "Is Cursor running autonomously?"
No! You're manually using these features:
- Type in Chat → Get response
- Press Cmd+K → Give instruction → Accept/Reject
- Open Composer → Request feature → Review → Accept

This is NOT autonomous agent execution (that's Lab 2).

## Manual Alternative

If the npm script doesn't work, manually copy files:

```bash
cp -r labs/lab1-cursor-modes/starter my-api
cd my-api
cursor .
```

Or just open `labs/lab1-cursor-modes/starter/` directly in Cursor (but then you can't see the complete/ reference).

## Next Steps

Once setup is complete and `my-api` is open in Cursor:

1. Follow the README instructions
2. Start with **Part 1: Planning with Chat**
3. Use the exact prompts provided
4. Review all AI output before accepting
5. Ask questions if anything is unclear!

## Need Help?

Common questions are answered in the main README's Troubleshooting section.
