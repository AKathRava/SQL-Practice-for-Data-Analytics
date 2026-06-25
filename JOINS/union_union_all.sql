CREATE TABLE students1 (
    name VARCHAR(50)
);

INSERT INTO students1 VALUES
('Rahul'),
('Amit'),
('Priya');

CREATE TABLE students2 (
    name VARCHAR(50)
);

INSERT INTO students2 VALUES
('Amit'),
('Sneha'),
('Rohan');

SELECT name FROM students1
UNION
SELECT name FROM students2;

SELECT name FROM students1
UNION ALL
SELECT name FROM students2;