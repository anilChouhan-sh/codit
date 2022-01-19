SELECT * FROM category ;
-- get child categories
SELECT category_name , c.category_id, pc.child_id   FROM category c LEFT JOIN parent_category pc ON c.category_id = pc.parent_id;

-- get products with their category name
SELECT price , product_name , category_name FROM product p JOIN product_category pc ON p.product_id = pc.product_id JOIN category c ON pc.category_id = c.category_id;

