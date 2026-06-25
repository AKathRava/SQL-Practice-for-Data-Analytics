-- What is Self Join?

-- Self Join mein ek table ko usi table ke saath join karte hain.

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Rahul', NULL),
(2, 'Amit', 1),
(3, 'Priya', 1),
(4, 'Rohan', 2),
(5, 'Sneha', 2);

SELECT
    e.emp_name AS Employee,
    m.emp_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;