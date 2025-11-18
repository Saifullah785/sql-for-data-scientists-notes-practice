-- ================================ Chapter 13 Analytical Dataset Development Examples==============

-- =================================What Factors Correlate with Fresh Produce Sales?===============

SELECT * FROM farmers_market.product_category

-- =============================================================================================
SELECT * FROM farmers_market.product
WHERE product_category_id IN (1, 5, 6)
ORDER BY product_category_id

-- =============================================================================================

USE farmers_market;
SELECT * 
FROM  customer_purchases cp
	INNER JOIN product p
		ON cp.product_id = p.product_id
WHERE p.product_category_id = 1

-- =============================================================================================
USE farmers_market;
SELECT 
	cp.market_date,
    cp.customer_id,
    cp.quantity,
    cp.cost_to_customer_per_qty,
    p.product_category_id,
    mdi.market_date,
    mdi.market_week,
    mdi.market_year,
    mdi.market_rain_flag,
    mdi.market_snow_flag
FROM customer_purchases cp
	INNER JOIN product p
		ON cp.product_id = p.product_id
	RIGHT JOIN market_date_info mdi
		ON mdi.market_date = cp.market_date
WHERE p.product_category_id = 1
-- =============================================================================================

SELECT 
	mdi.market_date,
    mdi.market_week,
    mdi.market_year,
    mdi.market_rain_flag,
    mdi.market_snow_flag,
    cp.market_date,
    cp.customer_id,
    cp.quantity,
    cp.cost_to_customer_per_qty,
    p.product_category_id
    
FROM customer_purchases cp
	INNER JOIN product p
		ON cp.product_id = p.product_id
			AND p.product_category_id = 1
	RIGHT JOIN market_date_info mdi
		ON mdi.market_date = cp.market_date


-- =============================================================================================


















