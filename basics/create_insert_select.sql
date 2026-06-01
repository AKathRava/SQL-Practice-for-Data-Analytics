CREATE TABLE customer( name VARCHAR(20) , email VARCHAR(50) , age INT , phone VARCHAR(15) , is_active BOOLEAN ,signup_date
DATE , created_at DATETIME , total_spend DECIMAL(10,2));

INSERT INTO customer VALUES ('amit','amit@gmail.com',27,'8989898989',TRUE,'2026-05-30','2026-05-30 10:30:00',75000);

SELECT * FROM customer ;