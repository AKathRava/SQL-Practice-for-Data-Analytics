-- =========================================================
-- SQL VIEWS - INSERT & UPDATE PRACTICE FILE
-- =========================================================

DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1,'Rahul','IT',50000),
(2,'Amit','HR',60000),
(3,'Priya','IT',70000);

-- =========================================================
-- SIMPLE VIEW (UPDATABLE)
-- =========================================================
CREATE VIEW Employee_View AS
SELECT emp_id,name,department
FROM employees;

-- INSERT INTO VIEW (Allowed)        ORIGINAL TABLE MADHE INSERT HONAR --
INSERT INTO Employee_View(emp_id,name,department)
VALUES(4,'Rohan','Sales');

SELECT * FROM employees;

-- UPDATE VIEW (Allowed)        -- ORIGINAL TABLE MADHE UPDATE HONAR --
UPDATE Employee_View
SET department='Marketing'
WHERE emp_id=4;

SELECT * FROM employees;

-- DELETE VIEW (Allowed)
DELETE FROM Employee_View
WHERE emp_id=4;

SELECT * FROM employees;

-- =========================================================
-- DISTINCT VIEW (NOT UPDATABLE)
-- =========================================================
CREATE VIEW Department_View AS
SELECT DISTINCT department
FROM employees;

-- The following statements will fail:
-- INSERT INTO Department_View VALUES('Finance');
-- UPDATE Department_View
-- SET department='Finance'
-- WHERE department='IT';

-- =========================================================
-- GROUP BY VIEW (NOT UPDATABLE)
-- =========================================================
CREATE VIEW Salary_Report AS
SELECT department,
       SUM(salary) total_salary
FROM employees
GROUP BY department;

-- UPDATE Salary_Report
-- SET total_salary=100000
-- WHERE department='IT';

-- =========================================================
-- WITH CHECK OPTION              --  CHECK MADHE INSERT HOTANA VIEW CHI EK SPECIFIC CONDITION FOLLOW HOTE MHI HOT ASL TAR ERROR YETO --
-- =========================================================
CREATE VIEW IT_Employees AS
SELECT *
FROM employees
WHERE department='IT'
WITH CHECK OPTION;

-- Allowed
INSERT INTO IT_Employees
VALUES(5,'Karan','IT',55000);

-- Not Allowed
-- INSERT INTO IT_Employees
-- VALUES(6,'Rohit','HR',60000);

-- Allowed
UPDATE IT_Employees
SET salary=80000
WHERE emp_id=5;

-- Not Allowed
-- UPDATE IT_Employees
-- SET department='HR'
-- WHERE emp_id=5;

SELECT * FROM employees;

-- =========================================================
-- MODIFY VIEW
-- =========================================================
CREATE OR REPLACE VIEW Employee_View AS
SELECT emp_id,name,department,salary
FROM employees;

SELECT * FROM Employee_View;
