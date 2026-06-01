-- USE ecom;

-- SELECT * FROM orders;

SET autocommit = 0

UPDATE orders
SET discount_percent = 21
WHERE order_id = 6 

ROLLBACK;

SELECT * FROM orders; 

UPDATE orders
SET  customer_name = 'atharva katkar'
WHERE order_id = 1

COMMIT;
-- ROLLBACK; AFTER COMMIT NO USE OF ROLLBACK --
SELECT * FROM orders; 