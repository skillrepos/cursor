// Authentication - PLAIN TEXT PASSWORDS (CRITICAL SECURITY ISSUE!)

var db = require('./db');

// Register user - PLAIN TEXT PASSWORD STORAGE
function register(email, password, name, callback) {
  // No input validation
  // No email format check
  // No password strength check
  // STORING PASSWORD IN PLAIN TEXT!

  // Check if user exists - SQL INJECTION
  db.query("SELECT * FROM users WHERE email = '" + email + "'", function(err, users) {
    if (err) {
      callback(err);
      return;
    }

    if (users.length > 0) {
      callback(new Error('User already exists'));
      return;
    }

    // Insert user with PLAIN TEXT password - CRITICAL VULNERABILITY
    db.query("INSERT INTO users (email, password, name) VALUES ('" + email + "', '" + password + "', '" + name + "')", function(err, result) {
      if (err) {
        callback(err);
      } else {
        callback(null, {
          userId: result.insertId,
          email: email
        });
      }
    });
  });
}

// Login - PLAIN TEXT PASSWORD COMPARISON
function login(email, password, callback) {
  // SQL INJECTION VULNERABILITY
  // Comparing plain text passwords
  db.query("SELECT * FROM users WHERE email = '" + email + "' AND password = '" + password + "'", function(err, users) {
    if (err) {
      callback(err);
      return;
    }

    if (users.length === 0) {
      callback(new Error('Invalid credentials'));
      return;
    }

    var user = users[0];

    // Returning sensitive data including password!
    callback(null, {
      id: user.id,
      email: user.email,
      name: user.name,
      password: user.password, // NEVER RETURN PASSWORD!
      created_at: user.created_at
    });
  });
}

// Change password - NO VERIFICATION, PLAIN TEXT
function changePassword(userId, newPassword, callback) {
  // No current password verification
  // No password strength check
  // Storing plain text password

  // SQL INJECTION
  db.query("UPDATE users SET password = '" + newPassword + "' WHERE id = " + userId, function(err, result) {
    if (err) {
      callback(err);
    } else {
      callback(null, {success: true});
    }
  });
}

// Reset password - NO EMAIL VERIFICATION
function resetPassword(email, newPassword, callback) {
  // No email verification
  // No reset token
  // Anyone can reset anyone's password!

  // SQL INJECTION
  db.query("UPDATE users SET password = '" + newPassword + "' WHERE email = '" + email + "'", function(err, result) {
    if (err) {
      callback(err);
    } else {
      callback(null, {success: true});
    }
  });
}

// Get user - SQL INJECTION, RETURNS PASSWORD
function getUser(userId, callback) {
  // SQL INJECTION
  db.query("SELECT * FROM users WHERE id = " + userId, function(err, users) {
    if (err) {
      callback(err);
    } else {
      if (users.length > 0) {
        // Returns password field!
        callback(null, users[0]);
      } else {
        callback(new Error('User not found'));
      }
    }
  });
}

// Delete user - NO CASCADE, ORPHAN DATA
function deleteUser(userId, callback) {
  // Deletes user but leaves cart, orders, etc.
  // Creates orphaned data

  // SQL INJECTION
  db.query("DELETE FROM users WHERE id = " + userId, function(err) {
    if (err) {
      callback(err);
    } else {
      callback(null, {success: true});
    }
  });
}

module.exports = {
  register: register,
  login: login,
  changePassword: changePassword,
  resetPassword: resetPassword,
  getUser: getUser,
  deleteUser: deleteUser
};
