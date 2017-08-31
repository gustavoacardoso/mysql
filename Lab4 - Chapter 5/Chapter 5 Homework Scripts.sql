-- Chapter 5 Exercises
#1
INSERT INTO categories (category_id, category_name)
VALUES (DEFAULT,'Brass');

#1
UPDATE categories
SET category_name = 'Woodwinds'
WHERE category_name = 'Brass';

#2
DELETE FROM categories
WHERE category_id = 5;

#3
INSERT INTO products (product_id, category_id, product_code, product_name, description, list_price, discount_percent, date_added)
VALUES (DEFAULT, 4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come', 799.99, 0, NOW());

#4
UPDATE products 
SET discount_percent = 35
WHERE product_id = 11;

#5
DELETE FROM categories
WHERE category_id = 5;