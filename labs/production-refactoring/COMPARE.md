# Lab 3 Comparison Guide

## Quick Diff View
```bash
code -d before/ complete/
```

## Key Changes Summary

### Security Fixes (CRITICAL)
| Issue | Before | After |
|-------|--------|-------|
| SQL Injection | `"SELECT * FROM users WHERE id = " + id` | `db.query('SELECT * FROM users WHERE id = ?', [id])` |
| Passwords | Plain text storage | bcrypt hashed with salt |
| Credentials | Hardcoded in code | Environment variables |
| XSS | No sanitization | Input validation + escaping |
| Auth | No authentication | JWT tokens required |

### Code Quality
| Aspect | Before | After |
|--------|--------|-------|
| Async Pattern | Callbacks (hell) | async/await |
| Error Handling | None/inconsistent | try-catch everywhere |
| Structure | Monolithic files | Service layer + middleware |
| Naming | `a`, `b`, `c` | Descriptive names |
| Tests | 0% coverage | 85% coverage |

### Architecture
```
BEFORE:                    AFTER:
app.js (500 lines)         app.js (main)
cart.js (200 lines)        ├── routes/
auth.js (150 lines)        ├── services/
db.js (hardcoded)          ├── middleware/
                           ├── models/
                           ├── config/
                           └── tests/
```

## Files to Compare

1. **app.js** - Main application
   - Before: Monolithic, no middleware
   - After: Clean, modular, secure

2. **cart.js** - Shopping cart logic
   - Before: Callback hell, SQL injection
   - After: async/await, transactions, parameterized queries

3. **auth.js** - Authentication
   - Before: Plain text passwords, no validation
   - After: bcrypt hashing, JWT, validation

4. **db.js** - Database connection
   - Before: Hardcoded credentials
   - After: Environment vars, connection pooling

## Students Use This Flow

1. Open diff view: `code -d before/ complete/`
2. Use Chat to analyze problems
3. Use Cmd+K for focused fixes
4. Use Composer for multi-file refactors
5. Compare results with complete/ folder
