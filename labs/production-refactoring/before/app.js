// Legacy E-commerce App - NEEDS REFACTORING
// WARNING: This code has security vulnerabilities and poor practices

var express = require('express');
var bodyParser = require('body-parser');
var db = require('./db');
var cart = require('./cart');
var auth = require('./auth');

var app = express();
app.use(bodyParser.json());

// Global variables (BAD PRACTICE)
var currentUser = null;
var sessionStore = {};

// No error handling middleware
// No validation middleware
// No authentication middleware

// Register endpoint - NO PASSWORD HASHING
app.post('/register', function(req, res) {
  var email = req.body.email;
  var password = req.body.password;

  // SQL INJECTION VULNERABILITY
  db.query("INSERT INTO users (email, password) VALUES ('" + email + "', '" + password + "')", function(err, result) {
    if (err) {
      res.send({error: err.message});
      return;
    }
    res.send({success: true, userId: result.insertId});
  });
});

// Login endpoint - PLAIN TEXT PASSWORD
app.post('/login', function(req, res) {
  var email = req.body.email;
  var password = req.body.password;

  // SQL INJECTION VULNERABILITY
  db.query("SELECT * FROM users WHERE email = '" + email + "' AND password = '" + password + "'", function(err, users) {
    if (err) {
      res.send({error: err.message});
      return;
    }

    if (users.length > 0) {
      // Storing user in global variable (BAD)
      currentUser = users[0];
      var sessionId = Math.random().toString();
      sessionStore[sessionId] = users[0];

      res.send({
        success: true,
        sessionId: sessionId,
        user: users[0] // Leaking all user data including password!
      });
    } else {
      res.send({error: 'Invalid credentials'});
    }
  });
});

// Get products - NO PAGINATION, NO FILTERING
app.get('/products', function(req, res) {
  // SQL INJECTION if query params used
  db.query("SELECT * FROM products", function(err, products) {
    if (err) {
      res.send({error: err.message});
    } else {
      res.send(products);
    }
  });
});

// Get single product - SQL INJECTION
app.get('/products/:id', function(req, res) {
  var id = req.params.id;

  // SQL INJECTION VULNERABILITY
  db.query("SELECT * FROM products WHERE id = " + id, function(err, products) {
    if (err) {
      res.send({error: err.message});
    } else {
      if (products.length > 0) {
        res.send(products[0]);
      } else {
        res.send({error: 'Not found'});
      }
    }
  });
});

// Add to cart - CALLBACK HELL + SQL INJECTION
app.post('/cart', function(req, res) {
  var userId = req.body.userId;
  var productId = req.body.productId;
  var quantity = req.body.quantity;

  // No input validation
  // No authentication check
  // SQL INJECTION VULNERABILITY

  cart.addToCart(userId, productId, quantity, function(err, result) {
    if (err) {
      res.send({error: err.message});
    } else {
      res.send({success: true, cartId: result.insertId});
    }
  });
});

// Get cart - SQL INJECTION
app.get('/cart/:userId', function(req, res) {
  var userId = req.params.userId;

  cart.getCart(userId, function(err, items) {
    if (err) {
      res.send({error: err.message});
    } else {
      res.send(items);
    }
  });
});

// Checkout - CALLBACK HELL, NO TRANSACTIONS
app.post('/checkout', function(req, res) {
  var userId = req.body.userId;
  var paymentMethod = req.body.paymentMethod;

  // Get cart items
  cart.getCart(userId, function(err, items) {
    if (err) {
      res.send({error: err.message});
      return;
    }

    // Calculate total
    var total = 0;
    for (var i = 0; i < items.length; i++) {
      total += items[i].price * items[i].quantity;
    }

    // Process payment (FAKE - No error handling)
    processPayment(userId, total, paymentMethod, function(err, payment) {
      if (err) {
        res.send({error: err.message});
        return;
      }

      // Create order - SQL INJECTION
      db.query("INSERT INTO orders (user_id, total, status) VALUES (" + userId + ", " + total + ", 'pending')", function(err, order) {
        if (err) {
          // Payment already processed but order failed!
          // Money taken but no order created!
          res.send({error: err.message});
          return;
        }

        // Clear cart
        cart.clearCart(userId, function(err) {
          if (err) {
            // Order created but cart not cleared!
            res.send({error: err.message});
            return;
          }

          res.send({
            success: true,
            orderId: order.insertId,
            total: total
          });
        });
      });
    });
  });
});

// Fake payment processor
function processPayment(userId, amount, method, callback) {
  // Simulate payment processing
  setTimeout(function() {
    // No validation
    // No error handling
    // Just pretend it worked
    callback(null, {
      paymentId: Math.random().toString(),
      status: 'completed'
    });
  }, 100);
}

// Update product - NO AUTHENTICATION, SQL INJECTION
app.put('/products/:id', function(req, res) {
  var id = req.params.id;
  var name = req.body.name;
  var price = req.body.price;
  var stock = req.body.stock;

  // Anyone can update any product!
  // SQL INJECTION VULNERABILITY
  db.query("UPDATE products SET name = '" + name + "', price = " + price + ", stock = " + stock + " WHERE id = " + id, function(err, result) {
    if (err) {
      res.send({error: err.message});
    } else {
      res.send({success: true});
    }
  });
});

// Delete product - NO AUTHENTICATION
app.delete('/products/:id', function(req, res) {
  var id = req.params.id;

  // Anyone can delete any product!
  db.query("DELETE FROM products WHERE id = " + id, function(err) {
    if (err) {
      res.send({error: err.message});
    } else {
      res.send({success: true});
    }
  });
});

// Search products - XSS VULNERABILITY
app.get('/search', function(req, res) {
  var query = req.query.q;

  // No sanitization - XSS vulnerability
  // SQL INJECTION
  db.query("SELECT * FROM products WHERE name LIKE '%" + query + "%'", function(err, products) {
    if (err) {
      res.send({error: err.message});
    } else {
      // Returning unsanitized data
      res.send(products);
    }
  });
});

// No 404 handler
// No global error handler
// No graceful shutdown

var PORT = 3000; // Hardcoded port
app.listen(PORT, function() {
  console.log('Server running on port ' + PORT);
});

// No process error handlers
// Memory leaks possible
// No connection cleanup

module.exports = app;
