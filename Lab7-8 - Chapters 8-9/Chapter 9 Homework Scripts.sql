-- Lab8 - Chapter 9 HW
#1
SELECT list_price, discount_percent, 
		ROUND(list_price - list_price * discount_percent/100, 2) AS discount_amount
FROM products;

#2
SELECT order_date,
		DATE_FORMAT(order_date, '%Y'),
        DATE_FORMAT(order_date, '%b-%d-%Y'),
        DATE_FORMAT(order_date, '%h:%i %p'),
        DATE_FORMAT(order_date, '%c/%e/%y %H:%i')
FROM orders;

#3
SELECT card_number, 
	LENGTH(card_number) AS length_card, 
    CONCAT('XXXX-XXXX-XXXX-', SUBSTRING(card_number, -4)) AS masked_card
FROM orders;

#4
SELECT order_id, order_date,
		DATE_ADD(order_date, INTERVAL 2 DAY) AS approx_ship_date,
        ship_date,
        DATEDIFF(ship_date, order_date) AS days_to_ship
FROM orders
WHERE MONTH(order_date) = 5 AND YEAR(order_date) = 2015