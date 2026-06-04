-- CASE 01 -> AND OPERATOR

SELECT * FROM orders
WHERE category = 'Electronics'
AND payment_mode = 'Credit Card';

-- CASE 02 -> OR OPERATOR

SELECT * FROM orders
WHERE category = 'Electronics'
OR payment_mode = 'Credit Card';

-- CASE 03 -> NOT OPERATOR

SELECT * FROM orders
WHERE NOT customer_city = 'Delhi';