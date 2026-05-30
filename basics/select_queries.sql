USE ecom ;

-- View all columns from the orders table
SELECT * FROM orders ;

-- View only customer names
SELECT customer_name
FROM orders ;

-- View employee names and quantity
SELECT customer_name, quantity
FROM orders;

-- View department names
SELECT product
FROM orders ;
