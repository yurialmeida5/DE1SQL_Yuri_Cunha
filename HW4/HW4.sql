Use classicmodels;

-- Exercise -- INNER join orders,orderdetails,products and customers. 
-- Return back: orderNumber, priceEach , quantityOrdered, productName, productLine, city, country, orderDate

-- Explore the tables to define the proper joins

SELECT * FROM orders LIMIT 10;  -- CustomerNumber with Customer / OrderNumber with OrderDetails
SELECT * FROM orderdetails LIMIT 10; 
SELECT * FROM products LIMIT 10; -- ProductCode with OrderDetails
SELECT * FROM customers LIMIT 10;

-- Answer: 

SELECT orders.orderNumber, orderdetails.priceEach, orderdetails.quantityOrdered, products.productName, products.productLine, customers.city, customers.country, orders.orderDate  FROM orders 
INNER JOIN customers ON orders.customerNumber = customers.customerNumber
INNER JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products ON orderdetails.productCode = products.productCode;
