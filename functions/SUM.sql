SELECT * FROM orders;

-- BASIC SYNTAX OF SUM()

-- SELECT SUM(column_name)
-- FROM table_name; 

-- CASE 1 - SUM() 

SELECT SUM(quantity * price_per_unit) AS total_profit
FROM orders;

-- CASE 2 - SUM() WITH WHERE

SELECT SUM(price_per_unit) AS total_price
FROM orders
WHERE price_per_unit>1000;

-- CASE 3 - SUM() WITH GROUP BY

SELECT SUM(price_per_unit) AS total_price,category
FROM orders
WHERE price_per_unit>1000 GROUP BY category;

-- CASE 4 - SUM() WITH ORDER BY

SELECT SUM(price_per_unit) AS total_price,category
FROM orders
WHERE price_per_unit>1000 GROUP BY category ORDER BY total_price DESC;