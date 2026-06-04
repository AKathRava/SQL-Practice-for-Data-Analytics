-- CASE 01 ->IS NULL

SELECT * FROM orders 
WHERE delivery_date IS NULL;

-- CASE 02 ->IS NOT NULL

SELECT * FROM orders 
WHERE delivery_date IS NOT NULL;
