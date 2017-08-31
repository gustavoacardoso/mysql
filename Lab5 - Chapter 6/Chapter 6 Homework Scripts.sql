-- Lab5 - Chapter 6 HW
#1
SELECT COUNT(*) AS order_count, SUM(tax_amount) AS tax_total
FROM orders;

#2
SELECT category_name, 
COUNT(p.product_id) AS product_count, 
MAX(list_price) AS most_expensive_product
FROM categories c JOIN products p ON c.category_id = p.category_id
    GROUP BY category_name
ORDER BY list_price;

#3
SELECT email_address, 
SUM(item_price * quantity) AS item_price_total, 
SUM(discount_amount * quantity) AS discount_amount_total
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
				 JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY email_address
ORDER BY item_price_total DESC;

#4
SELECT email_address,
COUNT(o.order_id) AS order_count, 
SUM((item_price - discount_amount)*quantity) AS order_total
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
				 JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY email_address
HAVING COUNT(*) > 1
ORDER BY order_total DESC;

#5
SELECT email_address,
COUNT(o.order_id) AS order_count, 
SUM((item_price - discount_amount)*quantity) AS order_total
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
				 JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.item_price > 400
GROUP BY email_address
HAVING COUNT(*) > 1
ORDER BY order_total DESC;

#6
SELECT product_name, SUM((oi.item_price - oi.discount_amount)*oi.quantity) AS product_total
FROM products p JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY product_name WITH ROLLUP;

#7
SELECT email_address, COUNT(o.order_id) AS number_of_products
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
				 JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY email_address
HAVING number_of_products > 1;