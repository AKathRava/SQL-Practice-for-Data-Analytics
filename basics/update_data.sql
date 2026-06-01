USE ecom ;

UPDATE orders
SET order_status = 'Delivered' , rating = 4 , delivery_date ='2025-02-05'
WHERE order_id = 10

SELECT * FROM orders WHERE order_id = 10 ;

UPDATE orders
SET discount_percent = 40
WHERE order_id = 1

SELECT * FROM orders WHERE order_id = 1 ;
