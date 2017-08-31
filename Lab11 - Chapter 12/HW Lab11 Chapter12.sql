-- HW Lab11 - Chapter 12
-- Gustavo Assis Cardoso

#1
CREATE OR REPLACE VIEW customer_addresses 
AS 
SELECT c.customer_id, email_address, last_name, first_name, 
ba.line1 AS bill_line1, 
ba.line2 AS bill_line2,
ba.city AS bill_city,
ba.state AS bill_state,
ba.zip_code AS bill_zip,
ba.line1 AS ship_line1,
ba.line2 AS ship_line2,
ba.city AS ship_city, 
ba.state AS ship_state,
ba.zip_code AS ship_zip

FROM customers c
JOIN addresses ba ON c.billing_address_id = ba.address_id
JOIN addresses sa ON c.shipping_address_id = sa.address_id

ORDER BY last_name, first_name;

#2
SELECT customer_id,last_name,first_name,bill_line1
FROM customer_addresses;

#3
UPDATE customer_addresses
SET ship_line1 = '1990 Westwood Blvd.'
WHERE customer_id = 8;

#4
CREATE OR REPLACE VIEW order_item_products
AS
SELECT o.order_id, o.order_date, o.tax_amount, o.ship_date,
oi.item_price, 
discount_amount, 
(item_price-discount_amount) AS final_price, quantity, 
((item_price-discount_amount)*quantity) AS item_total,
product_name

FROM orders o JOIN order_items oi ON o.order_id = oi.order_id
			  JOIN products p ON p.product_id = oi.product_id
GROUP BY product_name;


#5
CREATE OR REPLACE VIEW product_summary
AS
SELECT p.product_name, COUNT(*) AS order_count, (oi.item_price * oi.quantity - oi.discount_amount) AS order_total
FROM products p JOIN order_items oi ON p.product_id = oi.product_id;
-- FROM order_item_products; -- doesn't work

#6
SELECT *
FROM product_summary
LIMIT 5;