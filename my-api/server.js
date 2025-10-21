const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// TODO: Add routes here using Cmd+K

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
