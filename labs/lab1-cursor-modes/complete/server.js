const express = require('express');
require('dotenv').config();
const authMiddleware = require('./middleware/auth');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// In-memory task storage (replace with database in production)
let tasks = [];
let taskIdCounter = 1;

// Validation middleware
const validateTask = (req, res, next) => {
  const { title, description, priority } = req.body;

  const errors = [];

  if (!title || typeof title !== 'string' || title.trim() === '') {
    errors.push('Title is required and must be a non-empty string');
  }

  if (description && typeof description !== 'string') {
    errors.push('Description must be a string');
  }

  if (priority && !['low', 'medium', 'high'].includes(priority)) {
    errors.push('Priority must be one of: low, medium, high');
  }

  if (errors.length > 0) {
    return res.status(400).json({
      success: false,
      errors
    });
  }

  next();
};

// AUTH ROUTES
// POST /auth/register - Register new user
app.post('/auth/register', async (req, res) => {
  try {
    const { email, password, role } = req.body;

    // Implementation would be in User model
    res.status(201).json({
      success: true,
      message: 'User registered successfully',
      // In real app: return token
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

// POST /auth/login - Login user
app.post('/auth/login', async (req, res) => {
  try {
    const { email, password } = req.body;

    // Implementation would be in User model
    res.status(200).json({
      success: true,
      message: 'Login successful',
      // In real app: return JWT token
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

// TASK ROUTES (Protected)

// POST /tasks - Create a new task
app.post('/tasks', authMiddleware.authenticate, validateTask, async (req, res) => {
  try {
    const { title, description, priority = 'medium' } = req.body;

    const newTask = {
      id: taskIdCounter++,
      title: title.trim(),
      description: description?.trim() || '',
      priority,
      completed: false,
      userId: req.user.id,
      createdAt: new Date().toISOString()
    };

    tasks.push(newTask);

    res.status(201).json({
      success: true,
      data: newTask
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

// GET /tasks - Get all tasks for authenticated user
app.get('/tasks', authMiddleware.authenticate, async (req, res) => {
  try {
    const userTasks = tasks.filter(task => task.userId === req.user.id);

    res.status(200).json({
      success: true,
      count: userTasks.length,
      data: userTasks
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

// GET /tasks/:id - Get a single task by ID
app.get('/tasks/:id', authMiddleware.authenticate, async (req, res) => {
  try {
    const { id } = req.params;
    const task = tasks.find(t => t.id === parseInt(id) && t.userId === req.user.id);

    if (!task) {
      return res.status(404).json({
        success: false,
        message: 'Task not found'
      });
    }

    res.status(200).json({
      success: true,
      data: task
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

// PUT /tasks/:id - Update a task
app.put('/tasks/:id', authMiddleware.authenticate, async (req, res) => {
  try {
    const { id } = req.params;
    const { title, description, priority, completed } = req.body;

    const taskIndex = tasks.findIndex(t => t.id === parseInt(id) && t.userId === req.user.id);

    if (taskIndex === -1) {
      return res.status(404).json({
        success: false,
        message: 'Task not found'
      });
    }

    // Update only provided fields
    if (title !== undefined) tasks[taskIndex].title = title.trim();
    if (description !== undefined) tasks[taskIndex].description = description.trim();
    if (priority !== undefined) tasks[taskIndex].priority = priority;
    if (completed !== undefined) tasks[taskIndex].completed = completed;
    tasks[taskIndex].updatedAt = new Date().toISOString();

    res.status(200).json({
      success: true,
      data: tasks[taskIndex]
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

// DELETE /tasks/:id - Delete a task
app.delete('/tasks/:id', authMiddleware.authenticate, async (req, res) => {
  try {
    const { id } = req.params;
    const taskIndex = tasks.findIndex(t => t.id === parseInt(id) && t.userId === req.user.id);

    if (taskIndex === -1) {
      return res.status(404).json({
        success: false,
        message: 'Task not found'
      });
    }

    tasks.splice(taskIndex, 1);

    res.status(200).json({
      success: true,
      message: 'Task deleted successfully'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

// 404 Handler - Must be after all routes
app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: 'Route not found'
  });
});

// Global Error Handler - Must be last
app.use((err, req, res, next) => {
  console.error('Error:', err);

  res.status(err.status || 500).json({
    success: false,
    message: err.message || 'Internal server error',
    ...(process.env.NODE_ENV === 'development' && { stack: err.stack })
  });
});

app.listen(PORT, () => {
  console.log(`✓ Server running on port ${PORT}`);
  console.log(`✓ Environment: ${process.env.NODE_ENV || 'development'}`);
});

module.exports = app;
