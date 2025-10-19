// Database connection - HARDCODED CREDENTIALS (VERY BAD!)

var mysql = require('mysql');

// SECURITY ISSUE: Hardcoded credentials
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password123',  // NEVER DO THIS!
  database: 'ecommerce'
});

// No error handling on connection
connection.connect(function(err) {
  if (err) {
    console.error('Database connection failed:', err);
    // App continues even if DB connection fails!
  } else {
    console.log('Connected to database');
  }
});

// No connection pooling (performance issue)
// No connection retry logic
// No graceful shutdown

module.exports = connection;
