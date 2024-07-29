const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
const port = 3000;
app.use(bodyParser.urlencoded({ extended: true }));


const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'bankon'
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('Connected to database');
});

app.use(express.urlencoded({ extended: false }));

app.post('/submit', (req, res) => {
 const name =  req.body.name;
 const email = req.body.email;
 const address = req.body.address;
 const phoneNumber =  req.body.phoneNumber;
 const accountNumber = req.body.accountNumber;
 const quantity =  req.body.quantity;
 const type = req.body.type;

  const query = 'INSERT INTO orders (Name, Email, address, phoneNumber, accountNumber, Quantity, Types) VALUES (?, ?, ?, ?, ?, ?, ?)';
  db.query(query, [name, email, address, phoneNumber, accountNumber, quantity, type], (err, result) => {
    if (err) {
      res.status(500).send('Error inserting data');
      } else {
        console.log('Form data submitted successfully');
      }
  });
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});