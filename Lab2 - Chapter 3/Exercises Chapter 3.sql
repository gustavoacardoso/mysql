#1
SELECT product_code, product_name, list_price, discount_percent
FROM products
ORDER BY list_price DESC;

#2
SELECT CONCAT(last_name,', ', first_name) AS full_name
FROM customers
WHERE last_name >='M'
ORDER BY last_name ASC;

#3
SELECT product_name, list_price, date_added
FROM products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;

#4
SELECT product_name, list_price, discount_percent, ROUND((list_price * discount_percent)/100, 2) AS discount_amont, ROUND(list_price - (list_price * discount_percent)/100, 2) AS discount_price
FROM products
ORDER BY discount_price DESC
LIMIT 5;

#5
SELECT item_id, item_price, discount_amount, quantity, item_price * quantity AS price_total, discount_amount * quantity AS discount_total, item_price - discount_amount AS item_total
FROM order_items
WHERE (item_price - discount_amount) > 500 
ORDER BY item_total DESC;

#6
SELECT order_id, order_date, ship_date
FROM orders
WHERE ship_date is NULL;

#7
SELECT NOW() AS today_unformatted, DATE_FORMAT(NOW(), '%e-%b-%Y') AS today_formatted;

#8
SELECT '100 (dollars)' AS price, '.07 (7 percent)' AS tax_rate, 100 * .07 AS tax_amount, 100 * (1 + .07) AS total; # I didn't find how to calculate the fourth column adding the expressions I used for the first and third columns.
