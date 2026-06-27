/*1. Simple View → ✅ INSERT, UPDATE, DELETE Allowed
Example
CREATE VIEW Employee_View AS
SELECT emp_id, name, department
FROM employees;
Why is it allowed?
Uses only one table.
Every row in the view corresponds to exactly one row in the employees table.
MySQL knows exactly which row to insert, update, or delete.

Think of it like this:

View Row 1  --------->  Employees Row 1
View Row 2  --------->  Employees Row 2

There is a 1-to-1 mapping.

2. DISTINCT View → ❌ Not Allowed
Example
CREATE VIEW Department_View AS
SELECT DISTINCT department
FROM employees;

Table:

emp_id	department
1	IT
2	IT
3	HR

View:

department
IT
HR
Why not?

The view removed duplicate rows.

If you write:

UPDATE Department_View
SET department='Finance'
WHERE department='IT';

Which employee should change?

Employee 1?
Employee 2?
Both?

The view doesn't tell MySQL which original row(s) correspond to the single IT row.

3. GROUP BY View → ❌ Not Allowed
Example
CREATE VIEW Salary_Report AS
SELECT department,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department;

View:

department	total_salary
IT	120000
HR	60000
Why not?

120000 is not stored in the table.

It is calculated as:

50000 + 70000 = 120000

If you do:

UPDATE Salary_Report
SET total_salary=100000;

Which salary should MySQL change?

Rahul's?
Priya's?
Both?

It cannot know.

4. Aggregate View → ❌ Not Allowed
Example
CREATE VIEW AverageSalary AS
SELECT AVG(salary)
FROM employees;

View:

AVG(salary)
60000
Why not?

AVG(salary) is a calculated value.

There is no column named AVG(salary) in the table.

Updating it doesn't make sense because SQL cannot determine which employee salaries should be changed.

5. UNION View → ❌ Not Allowed
Example
CREATE VIEW AllEmployees AS
SELECT emp_id, name FROM permanent_employee
UNION
SELECT emp_id, name FROM contract_employee;
Why not?

The view combines two different tables.

If you run:

UPDATE AllEmployees
SET name='Rahul';

Which table should be updated?

permanent_employee
contract_employee

The view doesn't always provide a clear, unique mapping.

6. Complex JOIN View → ⚠️ Usually Not Allowed
Example
CREATE VIEW CustomerOrders AS
SELECT c.customer_name,
       o.order_date
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id;
Why usually not?

The view contains data from multiple tables.

Suppose:

customer_name	order_date
Rahul	2025-01-01

If you run:

UPDATE CustomerOrders
SET customer_name='Amit';

Should MySQL update:

The customers table?
The orders table?

Because multiple tables are involved, many join views are not updatable. Some simple join views can be updated depending on the database and the query, which is why we say "usually not."

Memory Trick
View Type	Reason
✅ Simple View	One row in the view = one row in one table (1-to-1 mapping)
❌ DISTINCT	Duplicates removed, original rows can't be uniquely identified
❌ GROUP BY	Rows are grouped into summaries
❌ Aggregate Functions	Values are calculated, not stored
❌ UNION	Data comes from multiple result sets/tables
⚠️ Complex JOIN	Data comes from multiple tables, so the target row/table may be ambiguous */
