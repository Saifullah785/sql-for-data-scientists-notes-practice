

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