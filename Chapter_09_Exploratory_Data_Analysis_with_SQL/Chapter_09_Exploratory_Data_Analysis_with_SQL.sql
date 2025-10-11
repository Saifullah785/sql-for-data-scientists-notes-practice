-- -------------------Exploratory Data Analysis with SQL-------------------

-- =======================Exploring the Products Table======================

SELECT * FROM farmers_market.product
LIMIT 10

-- =========================================================================

SELECT product_id, count(*)
FROM farmers_market.product
GROUP BY product_id
HAVING COUNT(*) > 1

-- =========================================================================

SELECT * FROM farmers_market.product_category

-- =========================================================================

SELECT count(*) FROM farmers_market.product

-- =========================================================================



SELECT DISTINCT product_qty_type
FROM farmers_market.product

-- ===================================================================

SELECT * FROM farmers_market.vendor_booth_inventory
LIMIT 10