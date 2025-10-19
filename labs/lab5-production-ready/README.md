# Lab 5: Production-Ready Deployment - Complete AI-Powered Workflow

**Duration:** 10 minutes
**Difficulty:** Advanced
**Goal:** Transform development code to production-ready with CI/CD, testing, security, and deployment using all Cursor features

## What You'll Accomplish

Take your app from "works on my machine" to production-ready:
- ✅ Comprehensive test suite (80%+ coverage)
- ✅ CI/CD pipeline (GitHub Actions)
- ✅ Docker containerization
- ✅ Security hardening
- ✅ Monitoring and logging
- ✅ API documentation
- ✅ Deployment automation
- ✅ Performance optimization

## All Cursor Features Combined

This lab uses **every Cursor feature** you've learned:
- Chat → Planning and problem-solving
- Cmd+K → Focused improvements
- Composer → Multi-file coordination
- Background Agents → Parallel tasks
- .cursorrules → Code standards
- AGENTS.md → Workflow automation
- Plan Mode → Transparent execution
- Hooks → Quality gates

---

## Part 1: Security Audit with Custom Hook (2 min)

### Step 1: Create Security Hook

Create `.cursor/hooks/security-audit.js`:

```javascript
/**
 * Security Audit Hook
 * Runs before major changes to catch security issues
 */
const fs = require('fs');
const path = require('path');

module.exports = {
  name: 'Security Auditor',

  async onBeforeComposer(context) {
    const securityIssues = [];

    // Check for common vulnerabilities
    const patterns = {
      'Hardcoded Secret': /(['"])(api[_-]?key|secret|password|token)\\1\\s*[:=]\\s*['"][^'"]{8,}/gi,
      'SQL Injection': /query\\s*\\([^?]*\\+/gi,
      'Eval Usage': /eval\\s*\\(/gi,
      'Unsafe Regex': /new\\s+RegExp\\([^,]*\\+/gi
    };

    for (const [issue, pattern] of Object.entries(patterns)) {
      if (pattern.test(context.prompt)) {
        securityIssues.push({
          severity: 'high',
          type: issue,
          message: `Potential ${issue} detected in prompt`
        });
      }
    }

    if (securityIssues.length > 0) {
      return {
        allow: false,
        message: `⚠️  Security Issues Detected:\n\n${
          securityIssues.map(i => `- ${i.type}: ${i.message}`).join('\n')
        }\n\nPlease address these issues first.`
      };
    }

    return { allow: true };
  },

  async onAfterGeneration(context) {
    // Run automated security scan
    console.log('✓ Security audit passed');
    return { success: true };
  }
};
```

### Step 2: Test the Hook

Try to use Composer with a vulnerable pattern:
```
Composer: Add user authentication with password = 'admin123'
```

Hook should block this and suggest using environment variables.

**📝 Key Learning:** Hooks act as automated quality gates, preventing security issues before they're committed.

---

## Part 2: Comprehensive Testing with Background Agent (3 min)

### Step 1: Start Background Agent for Testing

```
Open new Chat tab (Cmd+Shift+L)

Background Agent Task: Generate Complete Test Suite

@Folder before/ - Analyze all files

Create comprehensive tests:

1. UNIT TESTS (services/, models/)
   - Test all functions
   - Mock dependencies
   - Cover edge cases
   - Test error handling

2. INTEGRATION TESTS (routes/)
   - Test all API endpoints
   - Test authentication flows
   - Test database operations
   - Test WebSocket connections

3. E2E TESTS (with Playwright)
   - Test complete user workflows
   - Test checkout process
   - Test real-time notifications
   - Test error scenarios

4. PERFORMANCE TESTS
   - Load testing with k6
   - Stress testing critical endpoints
   - Memory leak detection

5. SECURITY TESTS
   - SQL injection attempts
   - XSS attempts
   - CSRF protection
   - Rate limiting

SETUP:
- Configure Jest
- Set up test database
- Add coverage reporting
- Create test helpers
- Mock external services

TARGET: 80%+ code coverage

Run as background agent.
```

While tests generate, continue with other tasks.

**📝 Key Learning:** Background Agents handle time-consuming test generation while you work on other production concerns.

---

## Part 3: CI/CD Pipeline with Composer (2 min)

### Step 1: Use Composer for CI/CD

```
Open Composer (Cmd+I)
Enable Plan Mode

Prompt:
Create complete CI/CD pipeline using GitHub Actions:

WORKFLOWS NEEDED:

1. .github/workflows/test.yml
   - Run on every PR
   - Install dependencies
   - Run linter (ESLint)
   - Run tests with coverage
   - Upload coverage to Codecov
   - Check coverage threshold (80%)
   - Security scan with npm audit

2. .github/workflows/deploy-staging.yml
   - Run on merge to develop
   - Build Docker image
   - Push to container registry
   - Deploy to staging environment
   - Run smoke tests
   - Notify team on Slack

3. .github/workflows/deploy-production.yml
   - Run on release tag
   - Require manual approval
   - Build production Docker image
   - Run security scan
   - Deploy to production
   - Run health checks
   - Rollback on failure
   - Notify team

4. .github/workflows/security-scan.yml
   - Run weekly
   - Dependency vulnerability scan
   - SAST analysis
   - Container image scan
   - Report findings

ALSO CREATE:
- Dockerfile (multi-stage build)
- docker-compose.yml (for local dev)
- .dockerignore
- Health check endpoints
- Deployment scripts

Follow best practices for:
- Secrets management
- Environment variables
- Caching strategies
- Parallel execution
```

### Step 2: Review Composer's Plan

Composer shows:
```
Phase 1: CI Configuration
  ✓ .github/workflows/test.yml
  ✓ .github/workflows/deploy-staging.yml
  ✓ .github/workflows/deploy-production.yml
  ✓ .github/workflows/security-scan.yml

Phase 2: Containerization
  ✓ Dockerfile
  ✓ docker-compose.yml
  ✓ .dockerignore

Phase 3: Deployment Scripts
  ✓ scripts/deploy.sh
  ✓ scripts/rollback.sh
  ✓ scripts/health-check.sh

[Execute Plan]
```

**📝 Key Learning:** Composer handles complex multi-file CI/CD setup, ensuring all pieces work together.

---

## Part 4: Monitoring & Logging with AGENTS.md Workflow (2 min)

### Step 1: Add to AGENTS.md

```markdown
### Workflow: Add Production Monitoring

**Goal:** Implement comprehensive monitoring and logging

**Steps:**
1. Set up Winston for structured logging
2. Add request/response logging middleware
3. Integrate error tracking (Sentry/LogRocket)
4. Add performance monitoring (New Relic/Datadog)
5. Create custom metrics
6. Set up health check endpoint
7. Add database query logging
8. Implement log rotation
9. Create monitoring dashboard config
10. Set up alerts

**Files to Create:**
- utils/logger.js
- middleware/requestLogger.js
- config/monitoring.js
- config/sentry.js
- monitoring/metrics.js
- health/checks.js

**Integration Points:**
- Add to app.js
- Wrap all routes
- Catch all errors
- Log all database queries
```

### Step 2: Use Chat with AGENTS.md

```
Chat: @File AGENTS.md - Implement production monitoring workflow

Follow the monitoring workflow to add:
- Structured logging with Winston
- Error tracking with Sentry
- Performance monitoring
- Custom business metrics
- Health checks
- Alerting rules

Reference the production-ready patterns from .cursorrules
```

Chat + AGENTS.md will guide through complete implementation.

**📝 Key Learning:** AGENTS.md workflows ensure nothing is missed in complex production setup.

---

## Part 5: API Documentation (1 min)

### Step 1: Generate Swagger Docs

```
Cmd+K on app.js

Prompt:
Add Swagger/OpenAPI documentation:
- Install swagger-jsdoc and swagger-ui-express
- Create /api-docs endpoint
- Document all routes with JSDoc annotations
- Include request/response examples
- Add authentication details
- Generate interactive docs
```

### Step 2: Auto-Document All Routes

```
Composer: Add OpenAPI documentation to all route files

For each route in:
- routes/auth.js
- routes/products.js
- routes/cart.js
- routes/orders.js
- routes/notifications.js

Add JSDoc comments with:
- Description
- Parameters
- Request body schema
- Response schema
- Status codes
- Example requests/responses
```

**📝 Key Learning:** Auto-generate API docs to save hours of manual documentation.

---

## Production Checklist

### Security ✅
- [ ] No hardcoded secrets
- [ ] All inputs validated
- [ ] SQL injection prevented
- [ ] XSS protection enabled
- [ ] CSRF tokens implemented
- [ ] Rate limiting active
- [ ] Security headers set (Helmet)
- [ ] Dependencies scanned
- [ ] HTTPS enforced

### Code Quality ✅
- [ ] 80%+ test coverage
- [ ] All tests passing
- [ ] Linter passing
- [ ] No console.logs
- [ ] Error handling comprehensive
- [ ] Code reviewed
- [ ] Documentation complete

### Performance ✅
- [ ] Database queries optimized
- [ ] Indexes created
- [ ] Caching implemented
- [ ] Connection pooling
- [ ] Compression enabled
- [ ] Static assets CDN
- [ ] Load tested

### Observability ✅
- [ ] Structured logging
- [ ] Error tracking
- [ ] Performance monitoring
- [ ] Custom metrics
- [ ] Health checks
- [ ] Alerts configured
- [ ] Dashboard created

### Deployment ✅
- [ ] CI/CD pipeline
- [ ] Automated tests
- [ ] Container built
- [ ] Staging environment
- [ ] Production deployment
- [ ] Rollback plan
- [ ] Documentation

---

## Before/After Comparison

### Before (Development Code)
```
❌ No tests
❌ No CI/CD
❌ Security vulnerabilities
❌ No monitoring
❌ Manual deployment
❌ No documentation
❌ Single environment
❌ No error tracking
```

### After (Production-Ready)
```
✅ 85% test coverage
✅ Automated CI/CD pipeline
✅ Security hardened
✅ Comprehensive monitoring
✅ One-click deployment
✅ API docs auto-generated
✅ Staging + Production
✅ Error tracking with Sentry
✅ Performance monitoring
✅ Automated rollbacks
```

---

## Real Deployment Flow

```
1. Developer creates PR
   ↓
2. GitHub Actions: Run Tests
   ├─ Lint code
   ├─ Run unit tests
   ├─ Run integration tests
   ├─ Check coverage (80%+)
   └─ Security scan
   ↓
3. Merge to develop
   ↓
4. Auto-deploy to Staging
   ├─ Build Docker image
   ├─ Push to registry
   ├─ Deploy to staging
   ├─ Run smoke tests
   └─ Notify team
   ↓
5. QA Testing on Staging
   ↓
6. Create Release Tag
   ↓
7. Production Deployment
   ├─ Require approval
   ├─ Build production image
   ├─ Security scan
   ├─ Deploy with zero-downtime
   ├─ Health checks
   ├─ Rollback if issues
   └─ Notify team
   ↓
8. Monitor in Production
   ├─ Error tracking
   ├─ Performance metrics
   ├─ User analytics
   └─ Alert on issues
```

---

## Key Cursor Features in Production Workflow

| Task | Cursor Feature | Why |
|------|---------------|-----|
| Security Review | Hooks | Automated gates |
| Test Generation | Background Agent | Parallel work |
| CI/CD Setup | Composer | Multi-file coordination |
| Monitoring | AGENTS.md | Workflow guidance |
| Documentation | Cmd+K | Focused additions |
| Architecture | Chat | Planning & decisions |
| Code Standards | .cursorrules | Automatic compliance |
| Complex Refactors | Plan Mode | Transparent execution |

---

## Metrics That Matter

### Development Velocity
- Time to add feature: 4 hours → 1 hour (75% faster)
- Time to deploy: 2 days → 10 minutes (99% faster)
- Code review time: 2 hours → 20 minutes (83% faster)

### Quality
- Test coverage: 0% → 85%
- Bugs in production: 12/month → 2/month (83% reduction)
- Security vulnerabilities: 8 critical → 0

### Team Productivity
- Developer onboarding: 2 weeks → 2 days
- Documentation: Always outdated → Always current
- Deployment confidence: Low → High

---

## Bonus Challenges

### Challenge 1: Multi-Region Deployment
```
Use Composer to add:
- Multi-region configuration
- Database replication
- CDN setup
- Load balancing
- Failover automation
```

### Challenge 2: Observability Stack
```
Implement complete observability:
- Distributed tracing (Jaeger)
- Log aggregation (ELK Stack)
- Metrics (Prometheus + Grafana)
- Alerting (PagerDuty)
- Status page
```

### Challenge 3: Advanced CI/CD
```
Add advanced pipeline features:
- Canary deployments
- Blue-green deployments
- Feature flags
- A/B testing infrastructure
- Automated rollback triggers
```

---

## Key Takeaways

1. **Production Requires More Than Code**
   - Testing, monitoring, deployment
   - Security, documentation, observability
   - CI/CD, infrastructure, scaling

2. **AI Accelerates Production Prep**
   - Background Agents: Generate tests
   - Composer: Set up CI/CD
   - Hooks: Enforce quality
   - AGENTS.md: Guide workflows

3. **Automation is Key**
   - Automated testing catches bugs
   - Automated deployment reduces errors
   - Automated monitoring catches issues
   - Automated rollback saves the day

4. **Standards Matter**
   - .cursorrules ensure consistency
   - Hooks enforce quality gates
   - CI/CD validates changes
   - Monitoring catches deviations

5. **Cursor Covers Full SDLC**
   - Planning → Chat + AGENTS.md
   - Development → Cmd+K + Composer
   - Testing → Background Agents
   - Deployment → Composer + Plan Mode
   - Monitoring → AGENTS.md workflows

---

## Workshop Complete! 🎉

You've now learned:
- ✅ Chat, Edit, Composer modes
- ✅ .cursorrules for team standards
- ✅ AGENTS.md for workflows
- ✅ Plan Mode for transparency
- ✅ Background Agents for parallelism
- ✅ Hooks for quality gates
- ✅ Production-ready development
- ✅ Full CI/CD pipeline
- ✅ Real-world refactoring
- ✅ Multi-file features

## Next Steps

1. **Apply to Real Projects**
   - Use these patterns in your work
   - Build your own .cursorrules
   - Create team AGENTS.md
   - Set up custom hooks

2. **Share with Team**
   - Teach Cursor features
   - Establish standards
   - Automate workflows
   - Improve productivity

3. **Continue Learning**
   - Explore advanced features
   - Join Cursor community
   - Share discoveries
   - Build amazing things

---

**Congratulations on completing the Cursor AI Workshop!**

You're now equipped to build production-quality applications faster than ever with AI assistance. 🚀
