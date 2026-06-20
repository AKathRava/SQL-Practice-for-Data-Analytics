USE ecom;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
email VARCHAR(100),
city VARCHAR(50));

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE NOT NULL,
total_amount DECIMAL(10,2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id));

INSERT INTO customers VALUES
(1, 'John Smith', 'johngexample.com', 'New York'),
(2, 'Jane Doe', 'Janegexample.com', 'Los Angeles'),
(3, 'Robert Johnson',' robert@example.com', 'Chicago'),
(4, 'Emily Davis', 'emily@example.com', 'Houston'),
(5, 'Michael Brown', 'michael@example.com', 'Phoenix');

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
(101, 1, '2023-01-15', 150.75), (102, 3, '2023-01-16', 89.50), (103, 1, '2023-01-20', 45.25),
(104, 2, '2023-01-25', 218.38),(105, 3, '2023-02-11', 75.00);

-- Q RETURN ALL CUSTOMERS WITH ORDER DETAILS

SELECT c.customer_name,c.customer_id,count(o.order_id) AS total_order ,
ifnull(SUM(o.total_amount),0)
 AS spend_total
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id ;

-- Q ANALYZE THE CUSTOMERS FROM NEW YORK CITY

SELECT c.customer_name,c.customer_id,count(o.order_id) AS total_order ,ifnull(SUM(o.total_amount),0) AS spend_total
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
	AND c.city = 'New York'
GROUP BY c.customer_id ;

-- IF YOU JUST WANT NEW YORK CUSTOMERS

SELECT c.customer_name,c.customer_id,count(o.order_id) AS totall_order ,ifnull(SUM(o.total_amount),0) AS total
FROM (SELECT * FROM customers WHERE city = 'New York') c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id ;

-- Q FIND CUSTOMERS WHO HAVEN'T ORDER PAST 30 DAYS

SELECT c.customer_name , c.customer_id ,MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY customer_id
HAVING last_order_date IS NULL OR last_order_date < DATE_SUB(CURDATE(),INTERVAL 30 DAY);