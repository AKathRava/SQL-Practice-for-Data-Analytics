-- FUNCTIONS --

USE ecom;
SELECT * FROM orders;

SELECT COUNT(*) AS total_products
FROM orders ;

SELECT COUNT(*) AS mumbai_customers,customer_name
FROM orders WHERE city = 'mumbai' GROUP BY customer_name;

SELECT COUNT(*) AS category_wise_count,category
FROM orders GROUP BY category ORDER BY category_wise_count ASC ;