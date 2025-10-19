# Lab 1 Solutions - Getting Started with Cursor AI

## Exercise Solutions

### Part 1: Tab Autocomplete

#### Exercise 1.1: Simple Completion - greetUser Function

```javascript
function greetUser(name) {
  return `Hello, ${name}! Welcome to Cursor AI.`;
}
```

Alternative with more features:
```javascript
function greetUser(name = 'Guest') {
  if (!name) {
    return 'Hello! Welcome to Cursor AI.';
  }
  return `Hello, ${name}! Welcome to Cursor AI.`;
}
```

#### Exercise 1.2: Multi-line Completion - calculateDiscount

```javascript
function calculateDiscount(price, discountPercent) {
  if (price < 0 || discountPercent < 0 || discountPercent > 100) {
    throw new Error('Invalid input');
  }
  const discount = (price * discountPercent) / 100;
  return price - discount;
}
```

### Part 2: Cmd+K Inline Editing

#### Exercise 2.1: Enhanced greetUser with Time-of-Day

```javascript
function greetUser(name = 'Guest') {
  const hour = new Date().getHours();
  let timeOfDay;

  if (hour < 12) {
    timeOfDay = 'Good morning';
  } else if (hour < 18) {
    timeOfDay = 'Good afternoon';
  } else {
    timeOfDay = 'Good evening';
  }

  return `${timeOfDay}, ${name}! Welcome to Cursor AI.`;
}
```

#### Exercise 2.2: calculateTotal with Validation

```javascript
function calculateTotal(items) {
  // Input validation
  if (!Array.isArray(items)) {
    throw new TypeError('Items must be an array');
  }

  if (items.length === 0) {
    return 0;
  }

  // Error handling for invalid items
  for (let i = 0; i < items.length; i++) {
    const item = items[i];
    if (!item || typeof item.price !== 'number' || typeof item.quantity !== 'number') {
      throw new Error(`Invalid item at index ${i}`);
    }
    if (item.price < 0 || item.quantity < 0) {
      throw new Error(`Negative values not allowed at index ${i}`);
    }
  }

  // Calculate total
  let total = 0;
  for (let i = 0; i < items.length; i++) {
    total += items[i].price * items[i].quantity;
  }

  return total;
}
```

Modern ES6 version:
```javascript
function calculateTotal(items) {
  if (!Array.isArray(items)) {
    throw new TypeError('Items must be an array');
  }

  if (items.length === 0) {
    return 0;
  }

  // Validate all items
  items.forEach((item, index) => {
    if (!item || typeof item.price !== 'number' || typeof item.quantity !== 'number') {
      throw new Error(`Invalid item at index ${index}`);
    }
    if (item.price < 0 || item.quantity < 0) {
      throw new Error(`Negative values not allowed at index ${index}`);
    }
  });

  // Calculate total using reduce
  return items.reduce((total, item) => total + (item.price * item.quantity), 0);
}
```

## Challenge Solutions

### Challenge 1: Average Function

```javascript
function calculateAverage(numbers) {
  // Handle empty array
  if (!Array.isArray(numbers) || numbers.length === 0) {
    return 0;
  }

  // Validate all elements are numbers
  for (const num of numbers) {
    if (typeof num !== 'number' || isNaN(num)) {
      throw new TypeError('All elements must be valid numbers');
    }
  }

  const sum = numbers.reduce((acc, num) => acc + num, 0);
  return sum / numbers.length;
}

// Usage
console.log(calculateAverage([1, 2, 3, 4, 5])); // 3
console.log(calculateAverage([])); // 0
console.log(calculateAverage([10])); // 10
```

### Challenge 2: Cmd+K Transformations

#### Arrow Function Version

```javascript
const calculateTotal = (items) => {
  if (!Array.isArray(items) || items.length === 0) return 0;

  return items.reduce((total, item) => {
    if (!item?.price || !item?.quantity) {
      throw new Error('Invalid item structure');
    }
    return total + (item.price * item.quantity);
  }, 0);
};
```

#### With JSDoc Comments

```javascript
/**
 * Calculates the total cost of items in a shopping cart
 * @param {Array<{price: number, quantity: number}>} items - Array of items with price and quantity
 * @returns {number} The total cost of all items
 * @throws {TypeError} If items is not an array
 * @throws {Error} If any item is invalid
 * @example
 * calculateTotal([{ price: 10, quantity: 2 }, { price: 5, quantity: 3 }]); // 35
 */
function calculateTotal(items) {
  if (!Array.isArray(items)) {
    throw new TypeError('Items must be an array');
  }

  if (items.length === 0) {
    return 0;
  }

  return items.reduce((total, item) => {
    if (!item?.price || !item?.quantity) {
      throw new Error('Invalid item structure');
    }
    return total + (item.price * item.quantity);
  }, 0);
}
```

#### With Debug Logging

```javascript
function calculateTotal(items) {
  console.log('calculateTotal called with:', items);

  if (!Array.isArray(items)) {
    console.error('Error: items is not an array');
    throw new TypeError('Items must be an array');
  }

  if (items.length === 0) {
    console.log('Empty items array, returning 0');
    return 0;
  }

  let total = 0;
  for (let i = 0; i < items.length; i++) {
    const item = items[i];
    console.log(`Processing item ${i}:`, item);

    if (!item?.price || !item?.quantity) {
      console.error(`Invalid item at index ${i}:`, item);
      throw new Error(`Invalid item at index ${i}`);
    }

    const itemTotal = item.price * item.quantity;
    console.log(`Item ${i} total: ${itemTotal}`);
    total += itemTotal;
  }

  console.log('Final total:', total);
  return total;
}
```

## Complete Working File

```javascript
// Lab 1: Getting Started with Cursor AI
// Practice file for basic Cursor features

/**
 * Greets a user with a time-appropriate message
 * @param {string} name - The name of the user
 * @returns {string} A greeting message
 */
function greetUser(name = 'Guest') {
  const hour = new Date().getHours();
  let timeOfDay;

  if (hour < 12) {
    timeOfDay = 'Good morning';
  } else if (hour < 18) {
    timeOfDay = 'Good afternoon';
  } else {
    timeOfDay = 'Good evening';
  }

  return `${timeOfDay}, ${name}! Welcome to Cursor AI.`;
}

/**
 * Calculates the discounted price
 * @param {number} price - Original price
 * @param {number} discountPercent - Discount percentage (0-100)
 * @returns {number} The discounted price
 */
function calculateDiscount(price, discountPercent) {
  if (price < 0 || discountPercent < 0 || discountPercent > 100) {
    throw new Error('Invalid input: price must be >= 0 and discount between 0-100');
  }
  const discount = (price * discountPercent) / 100;
  return price - discount;
}

/**
 * Calculates the total cost of items
 * @param {Array<{price: number, quantity: number}>} items - Array of items
 * @returns {number} Total cost
 */
function calculateTotal(items) {
  if (!Array.isArray(items)) {
    throw new TypeError('Items must be an array');
  }

  if (items.length === 0) {
    return 0;
  }

  return items.reduce((total, item, index) => {
    if (!item?.price || !item?.quantity) {
      throw new Error(`Invalid item at index ${index}`);
    }
    if (item.price < 0 || item.quantity < 0) {
      throw new Error(`Negative values not allowed at index ${index}`);
    }
    return total + (item.price * item.quantity);
  }, 0);
}

/**
 * Calculates the average of an array of numbers
 * @param {number[]} numbers - Array of numbers
 * @returns {number} The average value
 */
function calculateAverage(numbers) {
  if (!Array.isArray(numbers) || numbers.length === 0) {
    return 0;
  }

  const sum = numbers.reduce((acc, num) => acc + num, 0);
  return sum / numbers.length;
}

// Test data
const sampleItems = [
  { name: "Laptop", price: 999.99, quantity: 1 },
  { name: "Mouse", price: 29.99, quantity: 2 },
  { name: "Keyboard", price: 79.99, quantity: 1 }
];

// Tests
console.log(greetUser("Alice"));
// Output: "Good [morning/afternoon/evening], Alice! Welcome to Cursor AI."

console.log(calculateDiscount(100, 20));
// Output: 80

console.log(calculateTotal(sampleItems));
// Output: 1139.96

console.log(calculateAverage([1, 2, 3, 4, 5]));
// Output: 3

// Edge case tests
console.log(calculateTotal([]));
// Output: 0

console.log(calculateAverage([]));
// Output: 0

try {
  calculateTotal("not an array");
} catch (e) {
  console.log("Caught error:", e.message);
  // Output: "Caught error: Items must be an array"
}
```

## Key Learnings

### Tab Autocomplete
- Wait for suggestions to appear
- Press Tab to accept
- Keep typing to reject
- Context-aware completions

### Cmd+K
- Select code first
- Describe desired changes
- Review before accepting
- Can iterate multiple times

### Chat
- Ask questions about code
- Get explanations
- Request improvements
- Use @ symbols for context

### @ Symbols
- @Files - reference specific files
- @Code - reference functions
- @Codebase - search project
- Provide better context

## Common Mistakes

1. **Not validating inputs** - Always check parameters
2. **Accepting without reviewing** - Read generated code
3. **Vague prompts** - Be specific about requirements
4. **Not testing edge cases** - Test empty arrays, null, etc.
5. **Ignoring errors** - Add proper error handling

## Next Steps

Move on to Lab 2 to learn advanced code generation techniques!
