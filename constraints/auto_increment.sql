USE ecom;

CREATE TABLE employees(emp_id INT PRIMARY KEY AUTO_INCREMENT,emp_name VARCHAR(50)
NOT NULL,emp_city VARCHAR(30));

INSERT INTO employees (emp_name,emp_city) VALUES ('Ashok','pune'),('Lokesh','mumbai');

SELECT * FROM employees;