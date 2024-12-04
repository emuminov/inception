const express = require('express');
const app = express();

app.get('/bonus', (req, res) => {
  res.sendFile('/app/index.html')
})
app.listen(9000, () => console.log('Server is up and running'));
