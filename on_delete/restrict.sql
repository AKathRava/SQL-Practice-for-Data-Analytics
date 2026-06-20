ALTER TABLE department
DROP FOREIGN KEY fk_department;

ALTER TABLE department
ADD CONSTRAINT fk_department
FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
ON DELETE RESTRICT;

SELECT * FROM employees;

INSERT INTO employees VALUES(1,'lokesh','pune'),(2,'sonu','mumbai');

DELETE FROM employees
WHERE emp_id = 1;

