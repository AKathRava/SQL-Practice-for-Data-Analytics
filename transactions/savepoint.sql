START TRANSACTION ;

set autocommit = 0;

UPDATE orders
SET discount_percent = 10             -- SP1 SAVEPOINT --
WHERE order_id = 2;

SAVEPOINT sp1;

UPDATE orders
SET discount_percent =  11
WHERE order_id = 2;

SELECT * FROM orders;

ROLLBACK TO sp1;

COMMIT;

SELECT * FROM orders;

