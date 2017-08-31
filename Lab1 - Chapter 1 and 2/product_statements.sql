SELECT product_name, list_price, date_added
FROM products
ORDER BY product_name;

SELECT COUNT(*) AS number_of_products,
       MAX(list_price) AS most_expensive_product,
       MIN(date_added) AS oldest_product
FROM products;