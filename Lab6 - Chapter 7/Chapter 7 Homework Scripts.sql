-- Lab6 - Chapter 7 HW
#1
SELECT DISTINCT category_name
FROM categories
WHERE category_id IN 
	(SELECT category_id
		FROM products)
ORDER BY category_name;

#1 THE SECOND NUMBER 1
SELECT product_name, list_price
FROM products 
WHERE list_price > (SELECT AVG(list_price) FROM products)
ORDER BY list_price DESC;

#2
SELECT category_name
FROM categories
WHERE NOT EXISTS 
	(SELECT *
    FROM products p
    WHERE category_id = categories.category_id);
    
#3
SELECT c.email_address, o.order_id, SUM(oi.item_price - oi.discount_amount) AS order_total
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
				 JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.email_address, o.order_id;

SELECT email_address, MAX(order_total) AS largest_order
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
				 JOIN (SELECT o.order_id, SUM(oi.item_price - oi.discount_amount) AS order_total
						FROM orders o, order_items oi
						WHERE o.order_id = oi.order_id) largest
                        ON largest.order_id = o.order_id
GROUP BY c.email_address;

#4
SELECT p1.product_name, p1.discount_percent
FROM products p1 
WHERE p1.discount_percent NOT IN 
	(SELECT p2.discount_percent
    FROM products p2
    WHERE p1.product_name <> p2.product_name) 
ORDER BY product_name;

#5
SELECT email_address, order_id, order_date
FROM customers c JOIN orders
WHERE order_date = 
	(SELECT MIN(order_date) FROM orders o
	WHERE c.customer_id = o.customer_id)
ORDER BY order_date;

#6
INSERT INTO customers (customer_id, email_address, password, first_name, last_name)
VALUES (DEFAULT, 'rick@raven.com', ' ', 'Rick', 'Raven');

#7
UPDATE customers
SET password = 'secret'
WHERE email_address = 'rick@raven.com';

#8
UPDATE customers
SET password = 'reset';