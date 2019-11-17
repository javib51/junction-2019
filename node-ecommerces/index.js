const fs = require('fs');
const mysql = require('mysql');
const express = require('express');

var connection = mysql.createConnection({
    host: 'mysql-junction-javier-dd88.aivencloud.com',
    port: '11873',
    user: 'junction',
    password: 'junction2019',
    database: 'ecommerces',
    ssl: {
        ca: fs.readFileSync(__dirname + '/ca.pem'),
    }
});

connection.connect();

// Set up the express app
const app = express();

// get all todos
app.get('/products', (req, res) => {
    connection.query('SELECT DISTINCT products.product_category_name FROM products, orders, order_items WHERE orders.customer_id=\'8afb90a97ee661103014329b1bcea1a2\' and products.product_id=order_items.product_id LIMIT 5', function (error, results, fields) {
        if (error) throw error;
        // console.log('The solution is: ', results);
        res.status(200).send( results.map(function (r) {
                return r.product_category_name
              }),)
    });
  });
  const PORT = 8000;
  
  app.listen(PORT, () => {
    console.log(`server running on port ${PORT}`)
  });


//connection.end();