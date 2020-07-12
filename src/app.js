const express = require('express');

const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send({
    message: `Hello, ${req.query.name || 'World'}!`,
  });
});

app.get('/review', (req, res) => {
  res.send({
    message: 'need a review',
  });
});

app.listen(port, () => console.log(`listening on port ${port}!`));
