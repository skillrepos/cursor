// Cart operations - CALLBACK HELL & SQL INJECTION

var db = require('./db');

// Add item to cart - CALLBACK HELL + SQL INJECTION
function addToCart(userId, productId, quantity, callback) {
  // No input validation
  // No type checking
  // SQL INJECTION VULNERABILITY

  // Check if user exists
  db.query("SELECT * FROM users WHERE id = " + userId, function(err, users) {
    if (err) {
      callback(err);
      return;
    }

    if (users.length === 0) {
      callback(new Error('User not found'));
      return;
    }

    // Check if product exists and has stock
    db.query("SELECT * FROM products WHERE id = " + productId, function(err, products) {
      if (err) {
        callback(err);
        return;
      }

      if (products.length === 0) {
        callback(new Error('Product not found'));
        return;
      }

      var product = products[0];

      if (product.stock < quantity) {
        callback(new Error('Insufficient stock'));
        return;
      }

      // Check if item already in cart
      db.query("SELECT * FROM cart WHERE user_id = " + userId + " AND product_id = " + productId, function(err, existing) {
        if (err) {
          callback(err);
          return;
        }

        if (existing.length > 0) {
          // Update quantity - SQL INJECTION
          var newQuantity = existing[0].quantity + quantity;
          db.query("UPDATE cart SET quantity = " + newQuantity + " WHERE id = " + existing[0].id, function(err, result) {
            if (err) {
              callback(err);
              return;
            }

            // Update product stock - NO TRANSACTION
            db.query("UPDATE products SET stock = stock - " + quantity + " WHERE id = " + productId, function(err) {
              if (err) {
                // Cart updated but stock not updated - DATA INCONSISTENCY!
                callback(err);
                return;
              }

              callback(null, result);
            });
          });
        } else {
          // Insert new cart item - SQL INJECTION
          db.query("INSERT INTO cart (user_id, product_id, quantity) VALUES (" + userId + ", " + productId + ", " + quantity + ")", function(err, result) {
            if (err) {
              callback(err);
              return;
            }

            // Update product stock - NO TRANSACTION
            db.query("UPDATE products SET stock = stock - " + quantity + " WHERE id = " + productId, function(err) {
              if (err) {
                // Cart item inserted but stock not updated!
                callback(err);
                return;
              }

              callback(null, result);
            });
          });
        }
      });
    });
  });
}

// Get cart items - SQL INJECTION
function getCart(userId, callback) {
  // SQL INJECTION VULNERABILITY
  db.query("SELECT c.id, c.quantity, p.name, p.price, p.image_url FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = " + userId, function(err, items) {
    if (err) {
      callback(err);
    } else {
      callback(null, items);
    }
  });
}

// Remove from cart - SQL INJECTION, NO STOCK REFUND
function removeFromCart(cartId, callback) {
  // Get cart item first
  db.query("SELECT * FROM cart WHERE id = " + cartId, function(err, items) {
    if (err) {
      callback(err);
      return;
    }

    if (items.length === 0) {
      callback(new Error('Cart item not found'));
      return;
    }

    var item = items[0];

    // Delete cart item
    db.query("DELETE FROM cart WHERE id = " + cartId, function(err) {
      if (err) {
        callback(err);
        return;
      }

      // Refund stock - NO TRANSACTION
      db.query("UPDATE products SET stock = stock + " + item.quantity + " WHERE id = " + item.product_id, function(err) {
        if (err) {
          // Cart item deleted but stock not refunded!
          callback(err);
          return;
        }

        callback(null, {success: true});
      });
    });
  });
}

// Clear cart - NO STOCK REFUND
function clearCart(userId, callback) {
  // SQL INJECTION
  // Doesn't refund stock to products!
  db.query("DELETE FROM cart WHERE user_id = " + userId, function(err) {
    if (err) {
      callback(err);
    } else {
      callback(null, {success: true});
    }
  });
}

// Update quantity - SQL INJECTION, NO STOCK ADJUSTMENT
function updateQuantity(cartId, newQuantity, callback) {
  // No validation
  // Doesn't adjust product stock
  // SQL INJECTION
  db.query("UPDATE cart SET quantity = " + newQuantity + " WHERE id = " + cartId, function(err, result) {
    if (err) {
      callback(err);
    } else {
      callback(null, result);
    }
  });
}

module.exports = {
  addToCart: addToCart,
  getCart: getCart,
  removeFromCart: removeFromCart,
  clearCart: clearCart,
  updateQuantity: updateQuantity
};
