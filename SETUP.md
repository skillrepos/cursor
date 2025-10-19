# Workshop Setup Instructions

## For Attendees

Choose one of the following setup options before the workshop starts.

## Option 1: GitHub Codespaces (Recommended)

**Pros:** No installation needed, works anywhere with internet
**Cons:** Requires GitHub account, uses internet

### Steps:

1. **Create/Login to GitHub account**
   - Go to [github.com](https://github.com)
   - Sign up or log in

2. **Access Workshop Repository**
   - Navigate to the workshop repository
   - Click the green "Code" button
   - Select "Codespaces" tab
   - Click "Create codespace on main"

3. **Wait for Setup**
   - Codespace will initialize (1-2 minutes)
   - Extensions will install automatically
   - You'll see a VS Code interface in your browser

4. **Verify Setup**
   - Open terminal (`` Ctrl+` ``)
   - Run: `node --version` (should show v18.x)
   - File explorer should show workshop files

5. **Note about Cursor**
   - Codespaces uses VS Code interface
   - AI features work similarly to Cursor
   - Main concepts transfer directly
   - Optional: Install Cursor locally for full experience

---

## Option 2: Local Installation

**Pros:** Full Cursor experience, works offline, faster
**Cons:** Requires installation, 1GB+ download

### Prerequisites

- macOS, Windows, or Linux
- At least 4GB RAM
- 2GB free disk space
- Internet connection for AI features

### Steps:

1. **Install Cursor**
   - Go to [cursor.sh](https://cursor.sh)
   - Click "Download"
   - Choose your operating system
   - Install the downloaded file

2. **Install Node.js** (if not already installed)
   - Go to [nodejs.org](https://nodejs.org)
   - Download LTS version (18.x or later)
   - Install with default options
   - Verify: Open terminal and run `node --version`

3. **Clone Workshop Repository**
   ```bash
   git clone [workshop-repo-url]
   cd cursor-workshop
   ```

   Or download ZIP:
   - Click "Code" → "Download ZIP"
   - Extract to desired location

4. **Install Dependencies**
   ```bash
   npm install
   ```

5. **Open in Cursor**
   - Launch Cursor
   - File → Open Folder
   - Select `cursor-workshop` folder

6. **Verify Setup**
   - Extensions should prompt to install (click Yes)
   - Terminal should work
   - Files visible in sidebar

---

## First-Time Cursor Setup

### 1. Sign In / Create Account

- Cursor will prompt for sign-in
- Create free account or sign in with GitHub
- Free tier includes daily usage limits
- Pro tier ($20/month) for unlimited usage

### 2. Enable AI Features

Settings → Cursor Settings:
- ✅ Enable completions
- ✅ Enable chat
- ✅ Enable command K

### 3. Configure Privacy (Optional)

If working with sensitive code:
- Settings → Privacy
- Disable telemetry if needed
- Review data sharing settings
- Consider using .cursorignore

### 4. Keyboard Shortcuts

Learn these shortcuts:

**Mac:**
- `Cmd+K` - Inline edit
- `Cmd+L` - Chat
- `Cmd+I` - Composer
- `Tab` - Accept suggestion
- `Esc` - Reject suggestion

**Windows/Linux:**
- `Ctrl+K` - Inline edit
- `Ctrl+L` - Chat
- `Ctrl+I` - Composer
- `Tab` - Accept suggestion
- `Esc` - Reject suggestion

### 5. Install Cursor CLI (Optional but Recommended)

The `cursor` command lets you open folders from the terminal:

**To Install:**
1. Open Cursor
2. Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux)
3. Type: `Shell Command: Install 'cursor' command in PATH`
4. Press Enter
5. Restart your terminal
6. Test: `cursor --version`

**If you don't install the CLI:**
- You can still open folders via File → Open Folder
- Or drag and drop folders onto the Cursor icon
- Workshop instructions provide alternatives

---

## Verify Your Setup

Before the workshop, test that everything works:

### Test 1: Tab Autocomplete

1. Create a new file: `test.js`
2. Type: `function hello`
3. Wait for suggestion
4. Press Tab to accept
5. **Expected:** Function completes automatically

### Test 2: Cmd/Ctrl+K

1. Write: `const x = 5;`
2. Select the line
3. Press `Cmd+K` (Mac) or `Ctrl+K` (Windows)
4. Type: "add a comment"
5. **Expected:** Comment suggestion appears

### Test 3: Chat

1. Press `Cmd+L` (Mac) or `Ctrl+L` (Windows)
2. Type: "What is Cursor?"
3. **Expected:** Chat responds with explanation

### All Working?

✅ You're ready for the workshop!

### Something Not Working?

1. Restart Cursor/Codespace
2. Check internet connection
3. Review settings
4. See troubleshooting below

---

## Troubleshooting

### Cursor Won't Install

**Mac:**
- Right-click → Open (if security warning)
- System Preferences → Security → Allow

**Windows:**
- Run as Administrator
- Disable antivirus temporarily
- Check Windows Defender SmartScreen

**Linux:**
- Make executable: `chmod +x Cursor-*.AppImage`
- May need: `libfuse2` package

### AI Features Not Working

**No suggestions appearing:**
- Check internet connection
- Verify signed in
- Check API key status
- Settings → Enable AI features

**"Rate limited" error:**
- Free tier has limits
- Wait a few minutes
- Consider upgrading to Pro

**Suggestions are slow:**
- Check internet speed
- Try different network
- Close other apps

### Codespace Issues

**Won't load:**
- Clear browser cache
- Try different browser
- Check GitHub status
- Use local install as backup

**Performance slow:**
- Close other tabs
- Check internet speed
- Use smaller repository
- Try local install

### General Issues

**Extensions not installing:**
- Click "Install" when prompted
- Manual install from Extensions panel
- Check internet connection

**Terminal not working:**
- Restart Cursor
- Check shell path
- Try different terminal

**Files not appearing:**
- Refresh file explorer
- Check correct folder opened
- Look for .hidden files

---

## System Requirements

### Minimum

- **OS:** macOS 10.15+, Windows 10+, Linux
- **RAM:** 4GB
- **Disk:** 2GB free
- **Internet:** Broadband for AI features

### Recommended

- **OS:** Latest version
- **RAM:** 8GB+
- **Disk:** 5GB+ free
- **Internet:** Fast/stable connection

---

## Getting Help

### Before Workshop

**Technical issues:**
- Check this guide
- Search [Cursor docs](https://docs.cursor.com)
- Ask in workshop Slack/Discord
- Email instructor

**Questions about content:**
- Review README.md
- Check lab descriptions
- Ask instructor

### During Workshop

- Raise hand or ask in chat
- Pair with neighbor
- Use backup materials
- Instructor will help

---

## Optional: Advanced Setup

### Install Useful Extensions

Cursor supports VS Code extensions:

- ESLint (code linting)
- Prettier (code formatting)
- GitLens (Git features)
- Error Lens (inline errors)

### Configure Settings

`File → Preferences → Settings`

Recommended:
```json
{
  "editor.formatOnSave": true,
  "editor.tabSize": 2,
  "editor.inlineSuggest.enabled": true,
  "files.autoSave": "afterDelay"
}
```

### Setup Git

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

---

## Workshop Materials Checklist

Before attending, ensure you have:

- [ ] Cursor installed OR Codespace working
- [ ] Workshop repository cloned/accessed
- [ ] AI features working (tested)
- [ ] Keyboard shortcuts memorized
- [ ] Internet connection stable
- [ ] Notepad for notes
- [ ] Questions prepared

---

## Day-Of Checklist

- [ ] Arrive 5-10 min early
- [ ] Open Cursor/Codespace
- [ ] Join workshop Slack/chat
- [ ] Test internet connection
- [ ] Have charger ready
- [ ] Silence notifications
- [ ] Ready to learn!

---

## Alternative: Use Your Existing Editor

While we recommend Cursor for the full experience, you can follow along with:

- **VS Code** with Copilot
- **VS Code** with other AI extensions
- **Other AI-enabled editors**

Note: Some features may differ, but core concepts apply.

---

## Need More Help?

**Resources:**
- [Cursor Documentation](https://docs.cursor.com)
- [Cursor Forum](https://forum.cursor.sh)
- [Discord/Slack](#) - Workshop channel
- [Email Instructor](#)

**Emergency Backup:**
- USB drives with materials (at workshop)
- Pair programming option
- Shared screen viewing

---

## Privacy & Security

### What Gets Sent to AI?

- Code you select/reference
- Chat messages you write
- Context from open files

### What Doesn't?

- Entire codebase (unless requested)
- Files outside workspace
- Credentials/secrets (in theory)

### Best Practices

- Don't include API keys in code
- Use `.cursorignore` for sensitive files
- Review before accepting suggestions
- Be aware of data sharing

### For Corporate Users

- Review company AI policies
- Use privacy mode if needed
- Consider on-premise options
- Discuss with IT/security

---

## Costs

### Free Tier

- Limited daily usage
- All core features
- Good for workshop
- May hit limits with heavy use

### Pro Tier

- $20/month
- Unlimited usage
- Faster responses
- Priority support
- Not required for workshop

### Educational Discounts

- Check if available
- Student pricing
- Academic licenses

---

## Questions?

Contact workshop instructor or check the FAQ in the main README.

**See you at the workshop!** 🚀
