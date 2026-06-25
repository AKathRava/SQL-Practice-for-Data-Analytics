-- What is Cross Join?
-- Answer:
-- A Cross Join returns the Cartesian Product of two tables. Every row of the first table is combined with every row of the 
-- second table.

CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(20)
);

INSERT INTO colors VALUES
(1, 'Red'),
(2, 'Blue'),
(3, 'Green');

CREATE TABLE sizes (
    size_id INT PRIMARY KEY,
    size_name VARCHAR(10)
);

INSERT INTO sizes VALUES
(1, 'S'),
(2, 'M'),
(3, 'L');

SELECT *
FROM colors
CROSS JOIN sizes;

SELECT CONCAT(color_name, ' - ', size_name) AS product_variant
FROM colors
CROSS JOIN sizes;
