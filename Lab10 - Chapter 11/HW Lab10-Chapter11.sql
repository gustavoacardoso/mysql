-- Homework Lab10 - Chapter 11
-- Gustavo Assis Cardoso


#1
USE my_guitar_shop;
CREATE INDEX customer_zip_code_idx ON customers (customer_zip_code); -- instead of there's no customer_zip_code column



#2
DROP DATABASE IF EXISTS my_web_db;
CREATE DATABASE IF NOT EXISTS my_web_db;

USE my_web_db;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users
(
  user_id 			    INT				    PRIMARY KEY		AUTO_INCREMENT,
  email_address	    	VARCHAR(100),
  first_name	    	VARCHAR(45),
  last_name			    VARCHAR(45)
)
ENGINE = InnoDB;



DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products
(
  product_id 		    INT				    PRIMARY KEY		AUTO_INCREMENT,
  product_name      	VARCHAR(45)
)
ENGINE = InnoDB;



DROP TABLE IF EXISTS downloads;
CREATE TABLE IF NOT EXISTS downloads
(
  download_id   		INT(11)			  PRIMARY KEY		AUTO_INCREMENT,
  user_id 			    INT(11)	NOT NULL,
  download_date 		DATETIME,
  filename			    VARCHAR(50),
  product_id		    INT(11) NOT NULL,
  CONSTRAINT users_fk_products
	FOREIGN KEY (user_id) REFERENCES users (user_id),
  CONSTRAINT downloads_fk_products
	FOREIGN KEY (product_id) REFERENCES products (product_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX users_fk_products (user_id ASC),
  INDEX downloads_fk_products_idx (product_id ASC)
)
ENGINE = InnoDB;



#3
INSERT INTO users
VALUES (DEFAULT, 'John', 'Smith', 'johnsmith@gmail.com');
INSERT INTO users
VALUES (DEFAULT, 'Jane', 'Doe', 'janedoe@gmail.com');

INSERT INTO products
VALUES (DEFAULT, 'Yamaha 1000');
INSERT INTO products
VALUES (DEFAULT, 'Yamaha 2000');


INSERT INTO downloads
VALUES (DEFAULT, 1, NOW(), 'filename1', 2);
INSERT INTO downloads
VALUES (DEFAULT, 2, NOW(), 'filename2', 1);
INSERT INTO downloads
VALUES (DEFAULT, 2, NOW(), 'filename3', 2);