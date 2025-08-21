

-- ===================== Database Relationships and SQL JOINs =====

USE data_science
SELECT * FROM product
	LEFT JOIN product_category
    ON product.product_category_id = product_category.
    product_category_id
    

-- =================================================================== 


SELECT
 product.product_id,
 product.product_name,
 product.product_category_id AS product_prod_cat_id,
 product_category.product_category_id AS category_prod_cat_id,
 product_category.product_category_name
FROM product
 LEFT JOIN product_category
 ON product.product_category_id = product_category.
 product_category_id
 
 
 -- =================================================================== 
 
SELECT
 p.product_id,
 p.product_name,
 pc.product_category_id,
 pc.product_category_name
FROM product AS p
 LEFT JOIN product_category AS pc
 ON p.product_category_id = pc.product_category_id
ORDER BY pc.product_category_name, p.product_name
 
  -- =================================================================== 
 
 SELECT *
 FROM customer AS c
 LEFT JOIN customer_purchases AS cp
	ON c.customer_id = cp.customer_id
 
   -- =================================================================== 
   
SELECT c.*
FROM customer AS c
LEFT JOIN customer_purchases AS cp
	ON c.customer_id = cp.customer_id
WHERE cp.customer_id IS NULL


SELECT *
FROM customer AS c 
RIGHT JOIN customer_purchases AS cp
	ON c.customer_id = cp.customer_id
 
 
 
 