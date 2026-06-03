SELECT * FROM orders ORDER BY price_per_unit ; -- By default is in Ascending Order --  ---CASE 01---

SELECT * FROM orders ORDER BY discount_percent ASC ; -- CASE 02--

SELECT * FROM orders ORDER BY delivery_date DESC ;  -- CASE 03--

SELECT * FROM orders ORDER BY discount_percent ASC , delivery_date DESC ;  -- CASE 04--