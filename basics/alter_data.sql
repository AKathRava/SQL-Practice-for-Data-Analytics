USE ecom;

ALTER TABLE orders
ADD COLUMN delivery_partner VARCHAR(50) 

RENAME TABLE customer TO client ;

ALTER TABLE orders
RENAME COLUMN city TO customer_city 

ALTER TABLE orders
MODIFY price_per_unit DECIMAL(12,2)

ALTER TABLE orders
ADD CONSTRAINT pk_cn PRIMARY KEY(customer_name);



SELECT * FROM orders ;