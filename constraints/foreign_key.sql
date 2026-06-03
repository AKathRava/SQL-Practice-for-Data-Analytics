CREATE TABLE customer(cus_id INT PRIMARY KEY AUTO_INCREMENT , cus_name VARCHAR(20) , cus_city VARCHAR(20));

INSERT INTO customer VALUES (1,'Atharva','pune'),(2,'jack','london');

CREATE TABLE department(d_name VARCHAR(20) , cus_id INT , FOREIGN KEY(cus_id) REFERENCES customer(cus_id)); -- FOREIGN KEY --

INSERT INTO department VALUES ('CS',1),('CA',2);

SELECT * FROM customer;

SELECT * FROM department;