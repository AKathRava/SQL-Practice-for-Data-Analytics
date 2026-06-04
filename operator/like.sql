-- CASE 01 ->STARTS WITH A

SELECT customer_name FROM orders
WHERE customer_name LIKE 'A%';

-- CASE 02 ->ENDS WITH A

SELECT customer_name FROM orders
WHERE customer_name LIKE '%A';

-- CASE 03 ->MID WITH (LETTERS) SUPPOSE ->TH

SELECT customer_name FROM orders
WHERE customer_name LIKE '%th%';