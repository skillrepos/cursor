const bcrypt = require('bcryptjs');
const { generateToken } = require('../middleware/auth');

// In-memory user storage (replace with database in production)
let users = [];
let userIdCounter = 1;

/**
 * User Model
 * Handles user data and authentication logic
 */
class User {
  /**
   * Create a new user
   * @param {Object} userData - User data
   * @param {string} userData.email - User email
   * @param {string} userData.password - Plain text password (will be hashed)
   * @param {string} userData.role - User role (default: 'user')
   */
  static async create({ email, password, role = 'user' }) {
    // Validate email
    if (!email || !this.isValidEmail(email)) {
      throw new Error('Invalid email address');
    }

    // Check if user already exists
    const existingUser = users.find(u => u.email === email);
    if (existingUser) {
      throw new Error('User already exists');
    }

    // Validate password
    if (!password || password.length < 8) {
      throw new Error('Password must be at least 8 characters');
    }

    // Hash password
    const salt = await bcrypt.genSalt(10);
    const passwordHash = await bcrypt.hash(password, salt);

    // Create user object
    const newUser = {
      id: userIdCounter++,
      email: email.toLowerCase(),
      passwordHash,
      role,
      createdAt: new Date().toISOString(),
      lastLogin: null
    };

    users.push(newUser);

    // Return user without password
    return this.sanitize(newUser);
  }

  /**
   * Login user and return JWT token
   * @param {string} email - User email
   * @param {string} password - Plain text password
   * @returns {Object} User object and JWT token
   */
  static async login(email, password) {
    // Find user
    const user = users.find(u => u.email === email.toLowerCase());
    if (!user) {
      throw new Error('Invalid credentials');
    }

    // Verify password
    const isValidPassword = await bcrypt.compare(password, user.passwordHash);
    if (!isValidPassword) {
      throw new Error('Invalid credentials');
    }

    // Update last login
    user.lastLogin = new Date().toISOString();

    // Generate token
    const token = generateToken({
      id: user.id,
      email: user.email,
      role: user.role
    });

    return {
      user: this.sanitize(user),
      token
    };
  }

  /**
   * Find user by ID
   * @param {number} id - User ID
   * @returns {Object|null} User object without password
   */
  static findById(id) {
    const user = users.find(u => u.id === id);
    return user ? this.sanitize(user) : null;
  }

  /**
   * Find user by email
   * @param {string} email - User email
   * @returns {Object|null} User object without password
   */
  static findByEmail(email) {
    const user = users.find(u => u.email === email.toLowerCase());
    return user ? this.sanitize(user) : null;
  }

  /**
   * Update user data
   * @param {number} id - User ID
   * @param {Object} updates - Fields to update
   * @returns {Object} Updated user
   */
  static async update(id, updates) {
    const userIndex = users.findIndex(u => u.id === id);
    if (userIndex === -1) {
      throw new Error('User not found');
    }

    // Handle password update separately
    if (updates.password) {
      if (updates.password.length < 8) {
        throw new Error('Password must be at least 8 characters');
      }
      const salt = await bcrypt.genSalt(10);
      updates.passwordHash = await bcrypt.hash(updates.password, salt);
      delete updates.password;
    }

    // Update user
    users[userIndex] = {
      ...users[userIndex],
      ...updates,
      updatedAt: new Date().toISOString()
    };

    return this.sanitize(users[userIndex]);
  }

  /**
   * Delete user
   * @param {number} id - User ID
   * @returns {boolean} Success status
   */
  static delete(id) {
    const userIndex = users.findIndex(u => u.id === id);
    if (userIndex === -1) {
      throw new Error('User not found');
    }

    users.splice(userIndex, 1);
    return true;
  }

  /**
   * Get all users (admin only)
   * @returns {Array} Array of users without passwords
   */
  static findAll() {
    return users.map(user => this.sanitize(user));
  }

  /**
   * Remove sensitive data from user object
   * @param {Object} user - User object
   * @returns {Object} Sanitized user object
   */
  static sanitize(user) {
    const { passwordHash, ...sanitizedUser } = user;
    return sanitizedUser;
  }

  /**
   * Validate email format
   * @param {string} email - Email to validate
   * @returns {boolean} Valid or not
   */
  static isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }

  /**
   * Change user password
   * @param {number} id - User ID
   * @param {string} oldPassword - Current password
   * @param {string} newPassword - New password
   * @returns {boolean} Success status
   */
  static async changePassword(id, oldPassword, newPassword) {
    const user = users.find(u => u.id === id);
    if (!user) {
      throw new Error('User not found');
    }

    // Verify old password
    const isValid = await bcrypt.compare(oldPassword, user.passwordHash);
    if (!isValid) {
      throw new Error('Current password is incorrect');
    }

    // Validate new password
    if (newPassword.length < 8) {
      throw new Error('New password must be at least 8 characters');
    }

    // Hash and update password
    const salt = await bcrypt.genSalt(10);
    user.passwordHash = await bcrypt.hash(newPassword, salt);
    user.updatedAt = new Date().toISOString();

    return true;
  }
}

module.exports = User;
