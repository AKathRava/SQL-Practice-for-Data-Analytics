START TRANSACTION ;

set autocommit = 0;

UPDATE orders
SET discount_percent = 41
WHERE order_id = 10;

ROLLBACK;

SELECT * FROM orders;