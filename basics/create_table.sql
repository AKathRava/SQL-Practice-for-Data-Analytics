CREATE DATABASE ecom;
USE ecom;

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    discount_percent INT,
    order_date DATE,
    delivery_date DATE,
    payment_mode VARCHAR(30),
    order_status VARCHAR(30),
    rating INT
);
