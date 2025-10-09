-- -------------------Exploratory Data Analysis with SQL-------------------

-- =======================Exploring the Products Table======================

SELECT * FROM farmers_market.product
LIMIT 10

-- =========================================================================

SELECT product_id, count(*)
FROM farmers_market.product
GROUP BY product_id
HAVING COUNT(*) > 1