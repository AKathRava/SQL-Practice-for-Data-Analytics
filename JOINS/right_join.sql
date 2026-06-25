USE ecom;

CREATE DATABASE gokuldham_society;
USE gokuldham_society;
CREATE TABLE apartments (
apartment_id INT PRIMARY KEY,
apartment_number VARCHAR(10) NOT NULL,
floor_number INT NOT NULL,
wing_name CHAR(1) NOT NULL
);
CREATE TABLE residents (
resident_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
occupation VARCHAR(100),
apartment_id INT,
FOREIGN KEY (apartment_id) REFERENCES apartments (apartment_id)
);
INSERT INTO apartments (apartment_id, apartment_number, floor_number, wing_name) VALUES
(1, '101', 1, 'A'),
(2, '102', 1, 'A'),
(3, 201, 2, 'A'),
(4, 202, 2, 'A'),
(5, '301', 3, 'A'),
(6, '302', 3, 'A'),
(7, '401', 4, 'A'),
(8, 402, 4, 'A'),
(9, '501', 5, 'B'),
(10, '502', 5, 'B');

INSERT INTO residents (resident_id, first_name, last_name, occupation, apartment_id) VALUES
(1, 'Jethalal', 'Gada', 'Electronics Shop Owner', 1),
(2, 'Daya', 'Gada', 'Housewife', 1),
(3, 'Taarak', 'Mehta', 'Writer', 2),
(4, 'Anjali', 'Mehta', 'Teacher', 2),
(5, 'Popatlal', 'Pandey', 'Reporter', 3),
(6, 'Bhide', 'Aatmaram', 'School Teacher', 4),
(7, 'Madhavi', 'Bhide', 'Housewife', 4),
(8, 'Dr', 'Hathi', 'Doctor', 5),
(9, 'Komal', 'Hathi', 'Housewife', 5);

-- Q1 DISPLAY ALL APARTMENTS ALONG WITH THEIR RESIDENTS

SELECT a.apartment_id,a.apartment_number,a.floor_number,r.resident_id
FROM residents r
RIGHT JOIN apartments a ON r.apartment_id = a.apartment_id;