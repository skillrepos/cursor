# Lab 3: Production Refactoring - Transform Legacy Code to Modern Standards

**Duration:** 10 minutes
**Difficulty:** Intermediate to Advanced
**Goal:** Refactor real legacy e-commerce code using Composer and diff comparison

## What You'll Refactor

A legacy e-commerce system with:
- ❌ Callback hell
- ❌ SQL injection vulnerabilities
- ❌ No error handling
- ❌ Hardcoded credentials
- ❌ Poor naming conventions
- ❌ No input validation
- ❌ Memory leaks
- ❌ No tests

Transform it to:
- ✅ Modern async/await
- ✅ Secure parameterized queries
- ✅ Comprehensive error handling
- ✅ Environment variables
- ✅ Clear, descriptive names
- ✅ Input validation
- ✅ Proper resource cleanup
- ✅ Full test coverage

## Before You Start

### View the Diff
```bash
cd labs/lab3-production-refactoring
code -d before/ complete/
```

This opens VS Code's diff view showing:
- Left: Legacy code (before)
- Right: Refactored code (complete)
- Highlights: Exact changes needed

**Study the differences for 2 minutes before starting.**

---

## Part 1: Understand the Legacy Code (2 min)

### Step 1: Open Chat and Analyze
```
Press Cmd+L

Prompt:
@Folder before/ - Analyze this legacy e-commerce code.
List all security vulnerabilities, code smells, and issues.
Prioritize by severity.
```

### Step 2: Review Chat's Analysis

Chat should identify:
1. **Critical Security Issues:**
   - SQL injection in cart.js
   - Hardcoded database credentials
   - No password hashing
   - XSS vulnerabilities

2. **Code Quality Issues:**
   - Callback pyramid of doom
   - No error handling
   - Global variables
   - Poor naming (a, b, c variables)

3. **Architecture Problems:**
   - Monolithic files
   - No separation of concerns
   - Tight coupling
   - No dependency injection

**📝 Key Learning:** Always understand the problems before refactoring.

---

## Part 2: Security Fixes with Cmd+K (3 min)

### Step 1: Fix SQL Injection

1. Open `before/cart.js`
2. Find the `addToCart` function (line ~15)
3. Select the SQL query line
4. Press `Cmd+K`

```
Fix this SQL injection vulnerability.
Use parameterized queries with placeholders.
Show the before/after difference in a comment.
```

5. Review the change
6. Accept with `Cmd+Enter`

### Step 2: Remove Hardcoded Credentials

1. Open `before/db.js`
2. Select the connection config (lines 5-10)
3. Press `Cmd+K`

```
Move all credentials to environment variables.
Create .env.example file.
Add dotenv package.
Use process.env for all config.
Add validation for required env vars.
```

4. Accept changes

### Step 3: Add Password Hashing

1. Open `before/auth.js`
2. Select the `register` function
3. Press `Cmd+K`

```
Replace plain text password storage with bcrypt hashing.
Add password strength validation.
Use salt rounds = 10.
Handle errors properly.
```

4. Accept changes

**📝 Key Learning:** Cmd+K is perfect for focused security fixes in specific functions.

---

## Part 3: Modernize with Composer (3 min)

Now use Composer for coordinated changes across multiple files.

### Step 1: Open Composer
```
Press Cmd+I (or Ctrl+I)
```

### Step 2: Request Complete Modernization

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

### Step 3: Review Composer's Plan

Composer will show:
- Files to create (services/, middleware/, config/)
- Files to modify (app.js, cart.js, auth.js)
- Code changes in each file
- How they connect together

### Step 4: Review Each File

Click through each file tab in Composer:
- ✅ Check error handling added
- ✅ Verify async/await usage
- ✅ Confirm no callbacks remain
- ✅ Check imports updated
- ✅ Validate security fixes

### Step 5: Accept Changes

If everything looks good:
- Click "Accept All"

If needs tweaking:
- Edit the prompt
- Or accept individual files
- Or reject and refine

**📝 Key Learning:** Composer coordinates complex refactors across multiple files while maintaining consistency.

---

## Part 4: Add Tests (2 min)

### Step 1: Generate Tests with Agent

Open Chat (new tab: `Cmd+Shift+L`)

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
```

### Step 2: Run as Background Agent

```
Run this as a background agent so I can continue working.
```

Agent will:
- Create test files
- Generate test cases
- Set up test database
- Configure Jest
- Update package.json scripts

### Step 3: Check Progress

While agent runs:
- Continue with other work
- Check progress in Agent panel
- Review when complete

**📝 Key Learning:** Background Agents handle time-consuming tasks like test generation while you stay productive.

---

## Verification Checklist

Compare your refactored code with `complete/` folder:

### Security
- [ ] No SQL injection vulnerabilities
- [ ] Passwords properly hashed
- [ ] No hardcoded credentials
- [ ] Input validation on all endpoints
- [ ] Proper authentication checks
- [ ] XSS protection

### Code Quality
- [ ] All async/await (no callbacks)
- [ ] Try-catch error handling
- [ ] Descriptive variable names
- [ ] Proper separation of concerns
- [ ] No global variables
- [ ] Clean file structure

### Architecture
- [ ] Service layer created
- [ ] Middleware extracted
- [ ] Config centralized
- [ ] Routes separated
- [ ] Models defined
- [ ] Tests added

---

## Before/After Comparison

### Before (Legacy):
```javascript
// cart.js - VULNERABLE CODE
function addToCart(userId, productId, quantity, callback) {
  db.query("SELECT * FROM users WHERE id = " + userId, function(err, user) {
    if (err) return callback(err);

    db.query("INSERT INTO cart VALUES (" + userId + ", " + productId + ", " + quantity + ")",
      function(err, result) {
        if (err) return callback(err);

        db.query("UPDATE products SET stock = stock - " + quantity + " WHERE id = " + productId,
          function(err, update) {
            if (err) return callback(err);
            callback(null, result);
          }
        );
      }
    );
  });
}
```

### After (Modern):
```javascript
// services/cart.js - SECURE & MODERN
async function addToCart(userId, productId, quantity) {
  try {
    // Validate inputs
    if (!userId || !productId || !quantity || quantity < 1) {
      throw new ValidationError('Invalid cart parameters');
    }

    // Verify user exists
    const user = await db.query(
      'SELECT id FROM users WHERE id = ?',
      [userId]
    );

    if (!user) {
      throw new NotFoundError('User not found');
    }

    // Begin transaction
    await db.beginTransaction();

    try {
      // Add to cart with parameterized query
      const result = await db.query(
        'INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)',
        [userId, productId, quantity]
      );

      // Update stock
      await db.query(
        'UPDATE products SET stock = stock - ? WHERE id = ? AND stock >= ?',
        [quantity, productId, quantity]
      );

      await db.commit();
      return result;

    } catch (error) {
      await db.rollback();
      throw error;
    }

  } catch (error) {
    logger.error('Add to cart failed:', { userId, productId, error });
    throw error;
  }
}
```

**Improvements:**
- ✅ Parameterized queries (no SQL injection)
- ✅ Async/await (no callbacks)
- ✅ Input validation
- ✅ Error handling with transactions
- ✅ Logging
- ✅ Stock validation
- ✅ Descriptive names

---

## Real-World Impact

### Metrics from Refactoring

**Security:**
- 5 Critical vulnerabilities → 0
- 8 High-risk issues → 0
- OWASP Top 10 compliance: 40% → 95%

**Code Quality:**
- Cyclomatic complexity: 25 → 8
- Test coverage: 0% → 85%
- Lines of code: 850 → 650 (better organization)

**Maintainability:**
- Time to understand: 2 hours → 15 minutes
- Time to add feature: 4 hours → 1 hour
- Bug discovery rate: 60% after deploy → 5% after deploy

---

## Common Refactoring Patterns

### Pattern 1: Callback → Async/Await
```javascript
// Before
getData(id, function(err, data) {
  if (err) return handleError(err);
  processData(data, function(err, result) {
    if (err) return handleError(err);
    saveResult(result, function(err, saved) {
      if (err) return handleError(err);
      callback(null, saved);
    });
  });
});

// After
async function processWorkflow(id) {
  try {
    const data = await getData(id);
    const result = await processData(data);
    const saved = await saveResult(result);
    return saved;
  } catch (error) {
    handleError(error);
    throw error;
  }
}
```

### Pattern 2: SQL Injection → Parameterized
```javascript
// Before - VULNERABLE
db.query(`SELECT * FROM users WHERE email = '${email}'`)

// After - SECURE
db.query('SELECT * FROM users WHERE email = ?', [email])
```

### Pattern 3: Hardcoded → Environment
```javascript
// Before
const DB_HOST = 'localhost';
const DB_PASS = 'password123';

// After
require('dotenv').config();
const DB_HOST = process.env.DB_HOST;
const DB_PASS = process.env.DB_PASS;

if (!DB_HOST || !DB_PASS) {
  throw new Error('Missing required environment variables');
}
```

---

## Bonus Challenges

### Challenge 1: Add Monitoring
```
Use Composer to add:
- Request logging with Winston
- Performance monitoring
- Error tracking with Sentry
- Health check endpoint
- Metrics collection
```

### Challenge 2: Database Migrations
```
Create database migration system:
- Use node-pg-migrate or similar
- Create initial schema migration
- Add seed data
- Version control migrations
```

### Challenge 3: API Documentation
```
Add Swagger/OpenAPI:
- Document all endpoints
- Add request/response examples
- Include authentication details
- Generate interactive docs
```

---

## Key Takeaways

1. **Always Understand First**
   - Use Chat to analyze legacy code
   - Identify security issues
   - Prioritize by severity

2. **Focused Fixes with Cmd+K**
   - Single-function security fixes
   - Targeted improvements
   - Quick, precise changes

3. **Coordinated Refactors with Composer**
   - Multi-file modernization
   - Architectural changes
   - Consistent patterns across files

4. **Automate Testing**
   - Background Agents for test generation
   - Ensure refactors don't break functionality
   - Build safety net

5. **Security is Priority #1**
   - Fix SQL injection immediately
   - Hash passwords properly
   - Validate all inputs
   - Use environment variables

---

## Next Steps

Move to **Lab 4: Multi-File Feature Development** to build a real-time notification system using Composer for complex, coordinated changes.

---

**Pro Tip:** Always refactor with tests. The background agent generating tests while you refactor is the professional way to work!
