USE ecom;

SELECT * FROM orders;

-- What is a VIEW in SQL?

-- A VIEW is a virtual table.

-- It does not store data itself. Instead, it stores an SQL query. Whenever you query the view, SQL executes the stored query
-- and shows the latest data from the underlying tables.

-- Think of it like this:

-- Imagine you have a notebook.

-- Table = Original book containing all information.
-- View = A bookmarked page that shows only the information you need.

-- The data remains in the original table. The view simply provides a different way to look at it --

-- SYNTAX :-
-- CREATE VIEW VIEW_NAME 
-- AS
-- SELECT column1, column2
-- FROM table_name
-- WHERE condition;

-- CREATING A VIEW --

CREATE VIEW DISPLAY_ORDERS
AS SELECT * FROM orders;

-- CALL --

SELECT * FROM DISPLAY_ORDERS;

-- * ADDING A COLUMN
-- RULES -  1.CANNOT CHANGE COLUMN NAME 2.CANNOT CHANGE COLUMN DATATYPE

CREATE VIEW category_wise_profit
AS SELECT SUM(price_per_unit * quantity) AS profit,category
FROM orders
GROUP  BY category;

SELECT * FROM category_wise_profit;

-- NOW IF I HAVE TO ADD NEW COLUMN WHICH WAS NOT PREVIOUSLY ADDED IN THE VIEW

CREATE OR REPLACE VIEW category_wise_profit
AS SELECT SUM(price_per_unit * quantity) AS profit,category,customer_name
FROM orders
GROUP  BY category,customer_name;

SELECT * FROM category_wise_profit;

-- ****-- DELETE VIEW 
-- Syntax
-- DROP VIEW VIEW_NAME;

DROP VIEW DISPLAY_ORDERS;

