ALTER TABLE orders
RENAME COLUMN customer_city TO city;

SELECT * FROM orders
WHERE city IN ('pune','mumbai','Delhi');