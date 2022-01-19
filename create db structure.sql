CREATE DATABASE cod;
USE cod;

CREATE TABLE product (
product_id INT AUTO_INCREMENT PRIMARY KEY ,
price INT  NOT NULL ,
product_name VARCHAR(255) NOT NULL
);

CREATE TABLE category(
category_id INT PRIMARY KEY AUTO_INCREMENT ,
category_name VARCHAR(255) NOT NULL);

CREATE TABLE product_category (
product_id INT, 
category_id INT ,
FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE ON UPDATE CASCADE,

FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE parent_category(
child_id INT ,
parent_id INT,
FOREIGN KEY (parent_id) REFERENCES category(category_id) ON DELETE CASCADE ON UPDATE CASCADE,

FOREIGN KEY (child_id) REFERENCES category(category_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- ALTER TABLE parent_category RENAME category_id TO child_id; 
-- DROP DATABASE cod;
