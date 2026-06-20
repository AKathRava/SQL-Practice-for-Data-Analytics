USE ecom;


ALTER TABLE department
ADD COLUMN emp_id int;

ALTER TABLE department
ADD CONSTRAINT fk_department
FOREIGN KEY(emp_id) REFERENCES employees(emp_id);

-- PARENT TABLE - EMPLOYEES
-- CHILD TABLE - DEPARTMENT 
-- THE ONE WHICH CONNECT THEM - emp_id
-- IF I TRY TO DELETE THE emp_id IT WOULDN'T WORK OUT

ALTER TABLE department
DROP FOREIGN KEY fk_department;

ALTER TABLE department
ADD CONSTRAINT fk_department
FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
ON DELETE CASCADE;

select * from employees;

UPDATE department
SET emp_id = 1
WHERE cus_id  = 1;

UPDATE department
SET emp_id = 2
WHERE cus_id  = 2;

SELECT * FROM department;

--  i ) THE RECORD HAVING FOREIGN KEY DELETE BECZ WE USE ON DELETE CASCADE
--  - .. - IT HAS NOT BEEN DELETED IF WE HAVE NOT USED ON DELETE CASCADE

DELETE FROM department 
WHERE emp_id = 1;
