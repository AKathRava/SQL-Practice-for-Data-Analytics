USE ecom;

CREATE TABLE authors
(author_id INT PRIMARY KEY,first_name VARCHAR(20),last_name VARCHAR(20),birth_date INT);

CREATE TABLE books
(book_id INT PRIMARY KEY,book_name VARCHAR(20),author_id INT,publication_year INT,price DECIMAL(6,2));

INSERT INTO authors (author_id, first_name, last_name, birth_date)
VALUES
(1, 'Jane', 'Austen', 1775),
(2, 'George', 'Orwell', 1903),
(3, 'Ernest', 'Hemingway', 1899),
(4, 'Agatha', 'Christie', 1890),
(5,' J.K.','Rowling', 1965);

-- Insert data into books table

INSERT INTO books (book_id, title, author_id, publication_year, price)
VALUES
(101, 'Pride and Prejudice', 1, 1813, 12.99),
(102, '1984', 2, 1949, 14.50),
(103, 'Animal Farm', 2, 1945, 11.75),
(104, 'The Old Man and the Sea', 3, 1952, 10.99),
(105, 'Murder on the Orient Express', 4, 1934, 13.25),
(106, 'Death on the Nile', 4, 1937, 12.50),
(107, 'Emma', 1, 1815, 11.99),
(188, 'For Whom the Bell Tolls', 3, 1940, 15.75);

SELECT * FROM authors;

SELECT * FROM books;

ALTER TABLE books
RENAME COLUMN book_name TO title ;

ALTER TABLE books
MODIFY title varchar(100);

-- INNER JOIN/JOIN

SELECT b.title , a.first_name , a.last_name
FROM books b
JOIN authors a ON b.author_id = a.author_id;


-- Q how much books is written by an author

SELECT * FROM authors a JOIN books b ON a.author_id = b.author_id;  -- ALL data

SELECT  a.author_id,b.title, a.first_name , a.last_name 
FROM authors a
JOIN books b ON a.author_id = b.author_id
ORDER BY author_id ASC;             -- UNOPTIMISED METHODD OF COUNTING 

SELECT a.first_name , a.last_name , COUNT(*) AS book_count
FROM authors a
JOIN books b ON a.author_id = b.author_id
GROUP BY a.author_id;                   -- OPTIMISED METHOD 

CREATE TABLE category
(category_id INT,category_name VARCHAR(20));

CREATE TABLE book_category
(book_id INT,category_id INT); 

INSERT INTO category VALUES(1,'fiction'),(2,'action'),(3,'adventure'),(4,'political'),(5,'crime'),(6,'romance');

INSERT INTO book_category VALUES(101,1),(101,2),(101,3),(102,3),(102,4),(103,1),(104,2),(105,5),(105,6),(106,2),(106,6),(107,1),(107,3)
,(188,5);

-- Q WHICH BOOK COMES IN WHICH CATEGORY

SELECT b.title,a.first_name,a.last_name,group_concat(c.category_name separator ',') AS category_name
FROM books b
JOIN authors a ON b.author_id = a.author_id
JOIN book_category bc ON b.book_id = bc.book_id
JOIN category c ON bc.category_id = c.category_id
GROUP BY b.book_id;

-- Q RETURN BOOKS PUBLISHED BEFORE 1950 BY AUTHORS BORN BEFORE 1900

SELECT b.title,a.first_name,a.last_name,a.birth_date,b.publication_year
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE a.birth_date < 1900 AND publication_year < 1950
ORDER BY birth_date ASC;

-- Q RETURN THE BOOKS PUBLISHED MORE THAN 70 YEARS AGO

SELECT b.title,b.publication_year
FROM books b
WHERE YEAR(CURDATE())-(b.publication_year) > 70;

-- Q FINDS AUTHORS WHO WRITTEN MORE THAN ONE BOOK

SELECT a.first_name,a.last_name,COUNT(*) AS BOOK_COUNT
FROM authors a 
JOIN books b ON a.author_id = b.author_id
GROUP BY a.first_name , a.last_name HAVING COUNT(b.book_id) > 1; 