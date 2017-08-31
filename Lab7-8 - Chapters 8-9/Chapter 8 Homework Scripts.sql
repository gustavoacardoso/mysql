-- Lab7 - Chapter 8 HW
#1
SELECT list_price, 
		FORMAT(list_price, 1) AS list_format, 
        CONVERT(list_price, SIGNED) AS list_convert,
        CAST(list_price AS SIGNED) AS list_cast
FROM products;

#2
SELECT date_added,
		CAST(date_added AS DATE),
        CAST(date_added AS CHAR(7)),
        CAST(date_added AS TIME)
FROM products;