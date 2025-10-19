# Lab 4: Real-Time Notifications - Multi-File Feature with Composer & Background Agents

**Duration:** 10 minutes
**Difficulty:** Advanced
**Goal:** Build a complete real-time notification system using Composer for coordinated multi-file changes

## What You'll Build

A production-ready notification system with:
- WebSocket server (Socket.io)
- Notification service layer
- Database schema and models
- Event emitters across the app
- Real-time frontend components
- Notification preferences
- Read/unread status tracking
- Push notification queue

## Key Cursor Features

- **Composer (Cmd+I)** - Coordinate changes across 10+ files
- **Plan Mode** - Review implementation plan before execution
- **Background Agent** - Install dependencies and run migrations
- **AGENTS.md** - Guide autonomous implementation

---

## Before You Start

### View What You're Building

```bash
cd labs/lab4-realtime-notifications
code -d before/ complete/
```

**before/**: Basic API without notifications
**complete/**: Full real-time notification system

Study the complete/ folder to see:
- New files created
- Existing files modified
- How everything connects

---

## Part 1: Plan with Chat & AGENTS.md (2 min)

### Step 1: Update AGENTS.md

Add this workflow to your AGENTS.md:

```markdown
### Workflow: Add Real-Time Notifications

**Goal:** Implement WebSocket-based notification system

**Steps:**
1. Install dependencies (socket.io, socket.io-client)
2. Create database schema for notifications
3. Set up WebSocket server in app.js
4. Create notification service (create, mark read, delete)
5. Create notification model with database operations
6. Add event emitters in existing features (orders, cart)
7. Create frontend NotificationBell component
8. Add notification preferences endpoint
9. Implement notification queue for offline users
10. Add comprehensive tests

**Files to Create:**
- server/sockets/index.js
- server/services/notification.js
- server/models/Notification.js
- server/routes/notifications.js
- client/components/NotificationBell.jsx
- database/migrations/notifications.sql

**Files to Modify:**
- app.js (add WebSocket)
- routes/orders.js (emit events)
- routes/cart.js (emit events)

**Testing:**
- Unit tests for notification service
- Integration tests for WebSocket
- E2E tests for real-time updates
```

### Step 2: Ask Chat for Architecture

```
Press Cmd+L

Prompt:
I need to add real-time notifications to this e-commerce API.
Reference: @Folder before/ and AGENTS.md workflow

Questions:
1. Should I use Socket.io or native WebSockets?
2. How should I structure the notification service?
3. What events should trigger notifications?
4. How to handle offline users?
5. Best practices for WebSocket scaling?
```

Review Chat's recommendations before proceeding.

**📝 Key Learning:** Plan complex features before implementing. Chat + AGENTS.md ensure nothing is missed.

---

## Part 2: Use Composer with Plan Mode (5 min)

### Step 1: Open Composer

```
Press Cmd+I (or Ctrl+I)
Enable Plan Mode (if available)
```

### Step 2: Request Complete Feature

Type this in Composer:

```
Add complete real-time notification system to the e-commerce API:

CONTEXT:
@Folder before/ - Current codebase
@File AGENTS.md - Implementation workflow

REQUIREMENTS:

1. WebSocket Server Setup
   - Integrate Socket.io with Express
   - Handle connection/disconnection
   - Implement authentication for sockets
   - Add room-based notifications (per user)

2. Notification Service (services/notification.js)
   - createNotification(userId, type, message, metadata)
   - getNotifications(userId, filters)
   - markAsRead(notificationId)
   - markAllAsRead(userId)
   - deleteNotification(notificationId)
   - getUnreadCount(userId)

3. Database Schema
   - notifications table with:
     - id, user_id, type, title, message, metadata (JSON)
     - read (boolean), created_at, read_at
     - link (optional URL)
   - Add indexes for performance

4. Notification Model (models/Notification.js)
   - Database operations with transactions
   - Input validation
   - Error handling

5. Event Integration
   - Emit "order.created" when order placed
   - Emit "cart.reminder" for abandoned carts
   - Emit "product.back_in_stock" when restocked
   - Emit "order.shipped" when order ships

6. REST API Endpoints (routes/notifications.js)
   - GET /notifications (with pagination)
   - GET /notifications/unread-count
   - PUT /notifications/:id/read
   - PUT /notifications/read-all
   - DELETE /notifications/:id
   - GET /notifications/preferences
   - PUT /notifications/preferences

7. Frontend Component (client/NotificationBell.jsx)
   - Real-time notification bell icon
   - Unread count badge
   - Dropdown with recent notifications
   - Mark as read on click
   - Auto-refresh via WebSocket

8. Notification Queue
   - Queue notifications for offline users
   - Send when user reconnects
   - Handle connection drops gracefully

9. Preferences System
   - User preferences (email, push, in-app)
   - Notification types they want
   - Quiet hours support

10. Testing
    - Unit tests for service
    - WebSocket connection tests
    - Real-time event tests
    - Offline/online scenarios

CONSTRAINTS:
- Follow .cursorrules standards
- Use async/await throughout
- Add comprehensive error handling
- Include JSDoc comments
- Ensure backward compatibility
- No breaking changes to existing APIs

OUTPUT:
Show me a detailed plan first, then implement.
```

### Step 3: Review the Plan

Composer with Plan Mode will show:

```
PLAN: Real-Time Notification System

Phase 1: Setup (2 files)
  ✓ Install socket.io, socket.io-client
  ✓ Create database migration

Phase 2: Backend Core (4 files)
  ✓ Create server/sockets/index.js
  ✓ Create services/notification.js
  ✓ Create models/Notification.js
  ✓ Update app.js with WebSocket

Phase 3: Integration (3 files)
  ✓ Update routes/orders.js
  ✓ Update routes/cart.js
  ✓ Create routes/notifications.js

Phase 4: Frontend (1 file)
  ✓ Create NotificationBell.jsx

Phase 5: Testing (3 files)
  ✓ notification.test.js
  ✓ websocket.test.js
  ✓ integration.test.js

[Review Plan] [Edit Plan] [Execute] [Cancel]
```

### Step 4: Edit the Plan (Optional)

If you want changes:
- Click "Edit Plan"
- Modify steps
- Add/remove files
- Adjust implementation details

### Step 5: Execute the Plan

- Click "Execute"
- Composer shows progress for each phase
- Review file diffs as they're created
- Accept or modify each change

**📝 Key Learning:** Plan Mode gives you transparency and control. You see the approach before execution and can guide it.

---

## Part 3: Background Agent for Dependencies (1 min)

While Composer works, use a Background Agent for setup tasks.

### Step 1: Open New Chat Tab
```
Cmd+Shift+L (new chat tab)
```

### Step 2: Start Background Agent

```
Background Agent Task: Setup notification system infrastructure

Please:
1. Run: npm install socket.io socket.io-client
2. Run database migration (create notifications table)
3. Set up test database
4. Configure Jest for WebSocket testing
5. Generate seed data (50 sample notifications)
6. Update package.json scripts

Run as background agent.
```

Agent works in parallel while you review Composer changes.

**📝 Key Learning:** Background Agents handle setup/maintenance while you focus on code review.

---

## Part 4: Test Real-Time System (2 min)

### Step 1: Review WebSocket Code

Open `complete/server/sockets/index.js`:

```javascript
// Study how WebSocket handles:
- Authentication
- Room management
- Event broadcasting
- Error handling
- Reconnection logic
```

### Step 2: Test Locally

```bash
# Terminal 1: Start server
npm start

# Terminal 2: Test WebSocket connection
node test-websocket.js
```

### Step 3: Verify Features

Test these scenarios:
1. User receives notification in real-time
2. Unread count updates live
3. Mark as read works
4. Offline queue delivers on reconnect
5. Multiple tabs stay in sync

**📝 Key Learning:** Always test real-time features with actual connections.

---

## Verification Checklist

- [ ] WebSocket server integrated with Express
- [ ] Notifications stored in database
- [ ] Real-time delivery working
- [ ] Unread count accurate
- [ ] Mark as read functional
- [ ] Offline queue implemented
- [ ] Frontend component working
- [ ] Tests passing
- [ ] Events emit from cart/orders
- [ ] Preferences system working

---

## Key Composer Benefits Demonstrated

### Without Composer:
```
You manually:
1. Create socket server file
2. Update app.js imports
3. Create service file
4. Create model file
5. Update each route file
6. Create frontend component
7. Link everything together
8. Fix import errors
9. Fix type mismatches
10. Debug integration issues
```
**Time: 2-3 hours, Error-prone**

### With Composer:
```
1. Describe complete feature
2. Review coordinated plan
3. Accept changes
4. Test integration
```
**Time: 10 minutes, Coordinated correctly**

---

## Real-World Architecture

```
CLIENT (Browser)
  ↓
[Socket.io Client] ←→ WebSocket Connection
  ↓
SERVER
  ├── Socket Handler (sockets/index.js)
  │   ├── Authenticate connection
  │   ├── Join user-specific room
  │   └── Listen for client events
  │
  ├── Notification Service
  │   ├── Create notification
  │   ├── Save to database
  │   └── Broadcast via WebSocket
  │
  ├── Event Emitters (throughout app)
  │   ├── Order created → Notification
  │   ├── Product restocked → Notification
  │   └── Cart reminder → Notification
  │
  └── REST API
      ├── GET /notifications
      ├── PUT /notifications/:id/read
      └── PUT /preferences

DATABASE
  └── notifications table
```

---

## Advanced Features (Bonus)

### Challenge 1: Add Push Notifications
```
Use Composer to add:
- Web Push API integration
- Service worker
- Push subscription management
- Fallback to in-app notifications
```

### Challenge 2: Notification Templates
```
Create template system:
- Predefined notification types
- Variable substitution
- Internationalization support
- Custom styling per type
```

### Challenge 3: Analytics
```
Track notification metrics:
- Delivery rate
- Read rate
- Click-through rate
- User preferences analysis
```

---

## Key Takeaways

1. **Composer Excels at Multi-File Features**
   - Coordinates changes across 10+ files
   - Ensures consistency
   - Updates imports automatically
   - Maintains integration

2. **Plan Mode Provides Control**
   - See the approach before execution
   - Edit and refine the plan
   - Understand the architecture
   - Catch issues early

3. **Background Agents Enable Parallelism**
   - Setup tasks run while you code
   - Install dependencies
   - Run migrations
   - Generate boilerplate

4. **AGENTS.md Guides Implementation**
   - Defines workflows
   - Ensures completeness
   - Maintains standards
   - Documents decisions

5. **Real-Time Requires Special Handling**
   - Authentication for WebSocket
   - Room-based broadcasting
   - Offline queue
   - Reconnection logic

---

## Next Steps

Move to **Lab 5: Production-Ready Workflow** to take your app from development to production with CI/CD, monitoring, and deployment.

---

**Pro Tip:** Use Composer for any feature that touches 3+ files. It saves hours and prevents integration bugs!
