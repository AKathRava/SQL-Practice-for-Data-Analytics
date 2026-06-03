START TRANSACTION ;

set autocommit = 0;

UPDATE orders
SET discount_percent = 4
WHERE order_id = 9;

COMMIT;