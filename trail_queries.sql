INSERT INTO product VALUES(3,57,'fork-1');
INSERT INTO product VALUES(4,58,'table cloth');
INSERT INTO product VALUES(5,58,'table cloth');
INSERT INTO product VALUES(1,58,'spoon');
INSERT INTO product VALUES(2,58,'fork');
SELECT MAX(product_id) FROM product;
SELECT * FROM product;
SELECT * FROM product_category;


DELETE FROM product WHERE product_id = 4;

INSERT INTO category VALUES(1 , 'kitchen');
INSERT INTO category VALUES(2 , 'hotel');
INSERT INTO category VALUES(3 , 'space');


INSERT INTO product_category VALUES(3,1);
INSERT INTO product_category VALUES(2,1);
INSERT INTO product_category VALUES(1,1);
INSERT INTO product_category VALUES(1,2);
SELECT product_id FROM product WHERE product_name = fork;

SELECT * FROM category;

UPDATE product SET price = 60 WHERE product_id = 2;

SELECT * FROM parent_category;
INSERT INTO parent_category VALUES (1 , 3);
INSERT INTO parent_category VALUES (2 , 3);

DELETE FROM category WHERE category_id = 2;