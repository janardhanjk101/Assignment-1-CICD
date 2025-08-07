const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello from Node.js CI/CD app!');
});

app.listen(port, () => {
  console.log(`App running on http://localhost:${6000}`);
});
