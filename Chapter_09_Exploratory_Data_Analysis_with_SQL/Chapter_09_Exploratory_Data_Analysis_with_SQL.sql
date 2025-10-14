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

SELECT pc.product_category_id, pc.product_category_name,
	COUNT(product_id) AS count_of_products
FROM farmers_market.product_category AS pc
LEFT JOIN farmers_market.product AS p
	ON pc.product_category_id = p.product_category_id
GROUP BY pc.product_category_id



-- ===================Exploring Possible Column Values====================

SELECT DISTINCT product_qty_type
FROM farmers_market.product

-- ===================================================================

SELECT * FROM farmers_market.vendor_booth_inventory
LIMIT 10
-- ===================================================================


SELECT market_date, vendor_id, product_id, count(*)
FROM farmers_market.vendor_booth_inventory
GROUP BY market_date, vendor_id, product_id
HAVING count(*) >1

-- ===================================================================

SELECT min(market_date), max(market_date)
FROM farmers_market.vendor_booth_inventory

-- ===================================================================

SELECT vendor_id, min(market_date), max(market_date)
FROM farmers_market.vendor_booth_inventory
GROUP BY vendor_id
ORDER BY min(market_date), max(market_date)

-- ===================Exploring Changes Over Time====================

SELECT
EXTRACT(YEAR FROM market_date) AS market_year,
EXTRACT(MONTH FROM market_date) AS market_month,
COUNT(DISTINCT vendor_id) AS vendor_with_inventory
FROM farmers_market.vendor_booth_inventory
GROUP BY EXTRACT(YEAR FROM market_date), EXTRACT(MONTH FROM market_date)
ORDER BY EXTRACT(YEAR FROM market_date), EXTRACT(MONTH FROM market_date)

-- ===================================================================


SELECT * FROM farmers_market.vendor_booth_inventory
WHERE vendor_id = 7
ORDER BY market_date, product_id


-- ============Exploring Multiple Tables Simultaneously==================




























