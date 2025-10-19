# Cursor Quick Reference Card

## Keyboard Shortcuts

| Action | Mac | Windows/Linux |
|--------|-----|---------------|
| **Inline Edit** | `Cmd+K` | `Ctrl+K` |
| **Chat** | `Cmd+L` | `Ctrl+L` |
| **Composer** | `Cmd+I` | `Ctrl+I` |
| **Accept Suggestion** | `Tab` | `Tab` |
| **Reject Suggestion** | `Esc` | `Esc` |
| **Next Suggestion** | `Opt+]` | `Alt+]` |
| **Previous Suggestion** | `Opt+[` | `Alt+[` |
| **Accept Line** | `Cmd+→` | `Ctrl+→` |

---

## Core Features

### Tab Autocomplete
**What:** AI suggests code as you type
**When:** Writing new code, completing patterns
**How:** Just start typing, press Tab to accept
**Tip:** Works across multiple lines

### Cmd+K (Inline Edit)
**What:** Modify code with natural language
**When:** Editing existing code, adding features
**How:** Select code → Cmd+K → describe change
**Tip:** Be specific in your description

### Chat (Cmd+L)
**What:** Conversational AI assistant
**When:** Planning, questions, explanations
**How:** Cmd+L → type question → get answer
**Tip:** Use @ symbols for context

### Composer (Cmd+I)
**What:** Multi-file editing
**When:** Coordinated changes across files
**How:** Cmd+I → describe change → review → accept
**Tip:** Great for refactoring

---

## @ Symbols

| Symbol | Purpose | Example |
|--------|---------|---------|
| `@Files` | Reference files | `@Files utils.js - explain this` |
| `@Folder` | Reference folders | `@Folder /src - summarize` |
| `@Code` | Reference symbols | `@Code myFunction - optimize` |
| `@Docs` | Search docs | `@Docs React hooks` |
| `@Web` | Search web | `@Web latest features` |
| `@Codebase` | Search project | `@Codebase authentication` |
| `@Chat` | Reference chat | `@Chat previous answer` |

**Tip:** Combine multiple @ symbols for better context!

---

## Prompt Templates

### Generate Function
```
Create a function that [purpose]
- Input: [parameters]
- Output: [return value]
- Handle: [edge cases]
- Include: [tests/docs/types]
```

### Generate Component
```
Create a [framework] component for [purpose]
- Props: [list props]
- State: [list state]
- Features: [list features]
- Style: [styling approach]
```

### Refactor Code
```
Refactor this code to:
- [improvement 1]
- [improvement 2]
- Maintain existing functionality
- Add error handling
```

### Debug
```
I'm getting [error message]
@Files [file] - What's causing this and how do I fix it?
```

### Explain
```
@Code [function] - Explain what this does step by step
```

### Optimize
```
@Code [function] - How can this be optimized for performance?
```

---

## Best Practices

### ✅ Do
- Review all AI suggestions
- Provide specific prompts
- Use @ symbols for context
- Test generated code
- Iterate incrementally
- Ask "why" to learn
- Add error handling
- Document your code

### ❌ Don't
- Blindly accept suggestions
- Use vague prompts
- Skip testing
- Ignore security
- Share sensitive data
- Forget AI can be wrong
- Rush through reviews

---

## Common Workflows

### Writing New Code
```
1. Start typing → Tab autocomplete
2. For complex logic → Cmd+K with description
3. Questions? → Chat (Cmd+L)
4. Review and test
```

### Understanding Code
```
1. Open Chat (Cmd+L)
2. Ask: @Files [file] - What does this do?
3. Deep dive: @Code [function] - Explain
4. Learn and document
```

### Refactoring
```
1. Select code
2. Cmd+K: "Refactor to [goal]"
3. Review changes
4. Test functionality
5. Commit
```

### Debugging
```
1. Copy error
2. Chat: "@Files [file] - [error]"
3. Get explanation
4. Cmd+K to apply fix
5. Test fix
```

### Building Feature
```
1. Chat: Plan architecture
2. Generate components with Cmd+K
3. Wire together
4. Add error handling
5. Test and refine
```

---

## .cursorrules Template

Create `.cursorrules` in project root:

```
# Code Style
- Use TypeScript strict mode
- Follow [style guide]
- Prefer functional programming
- Max line length: 100

# Documentation
- Add JSDoc to all functions
- Include examples
- Document edge cases

# Error Handling
- Validate all inputs
- Try-catch async operations
- Meaningful error messages

# Testing
- Write tests for new code
- Cover edge cases
- Aim for 80% coverage

# Best Practices
- DRY principle
- Single responsibility
- Avoid magic numbers
- Use meaningful names
```

---

## Troubleshooting

### Tab Not Working
- Check Cursor is enabled
- Wait for suggestion
- Check internet connection
- Restart Cursor

### Cmd+K Not Responding
- Select code first
- Check keyboard shortcut
- Try Ctrl+K (Windows)
- Restart if needed

### Chat Not Opening
- Use Cmd+L or Ctrl+L
- Click chat icon in sidebar
- Check internet connection
- Restart Cursor

### Slow Suggestions
- Check internet speed
- Close other apps
- Reduce project size
- Try smaller context

### Rate Limited
- Wait a few minutes
- Reduce usage frequency
- Consider Pro tier
- Use free tier wisely

---

## Tips & Tricks

### Power User Tips
1. **Chain prompts**: Ask follow-up questions
2. **Provide examples**: Show desired format
3. **Be specific**: More detail = better results
4. **Use context**: @ symbols are powerful
5. **Iterate**: Start simple, refine
6. **Learn**: Ask "why" and "how"

### Productivity Hacks
1. **Custom instructions**: Set global preferences
2. **.cursorrules**: Project-specific rules
3. **Keyboard shortcuts**: Memorize common ones
4. **Parallel work**: Generate while thinking
5. **Templates**: Save common prompts
6. **Review fast**: Develop quick scan technique

### Learning Techniques
1. **Ask for explanations**: Don't just copy
2. **Request alternatives**: Learn options
3. **Understand trade-offs**: Ask about pros/cons
4. **Study generated code**: Learn patterns
5. **Build incrementally**: Step by step
6. **Teach others**: Best way to learn

---

## Resources

### Official
- [Cursor Docs](https://docs.cursor.com/)
- [Cursor Forum](https://forum.cursor.sh/)
- [Cursor Blog](https://cursor.sh/blog)
- [Changelog](https://cursor.sh/changelog)

### Community
- Discord/Slack channels
- YouTube tutorials
- GitHub examples
- Twitter/X updates

### Learning
- Workshop materials
- Practice projects
- Code challenges
- Pair programming

---

## When to Use What

### Use Tab Autocomplete For:
- Simple completions
- Boilerplate code
- Following patterns
- Quick edits

### Use Cmd+K For:
- Modifying existing code
- Adding features
- Refactoring
- Single-file changes

### Use Chat For:
- Planning
- Questions
- Explanations
- Learning
- Brainstorming

### Use Composer For:
- Multi-file refactoring
- Large features
- Coordinated changes
- Architecture updates

---

## Effective Prompting

### Components of Good Prompts

1. **Context**: What are you working on?
2. **Goal**: What do you want to achieve?
3. **Constraints**: Any limitations?
4. **Format**: Desired structure?
5. **Examples**: Show preferred style

### Examples

**Bad:**
```
make a button
```

**Good:**
```
Create a reusable Button component with primary/secondary variants
```

**Better:**
```
Create a Button component:
- Props: label, onClick, variant, disabled
- Variants: primary (blue), secondary (gray)
- Add hover/active states
- Include TypeScript types
- Use inline styles
```

**Best:**
```
Create a Button component following our design system:
- Props: label (string), onClick (function), variant ('primary' | 'secondary'), disabled (boolean)
- Primary: blue background (#007bff), white text
- Secondary: gray background (#6c757d), white text
- Hover: darken by 10%
- Active: darken by 15%
- Disabled: 50% opacity, no pointer events
- Add focus ring for accessibility
- TypeScript types required
- Inline styles (no CSS files)
- Example usage in JSDoc
```

---

## Quick Wins

### Instant Productivity Boosts

1. **Generate boilerplate** - Let AI write repetitive code
2. **Add error handling** - Select code → "add error handling"
3. **Write tests** - "@Code [function] - generate tests"
4. **Add types** - "add TypeScript types"
5. **Document code** - "add JSDoc comments"
6. **Refactor** - "modernize to ES6"
7. **Optimize** - "optimize for performance"
8. **Debug** - Paste error → get explanation

### Time Savers

- Generate regex patterns
- Create sample data
- Write API clients
- Build form validation
- Create utility functions
- Write database queries
- Generate configurations

---

**Print this for quick reference during coding!**

For more details, see the full workshop materials.
