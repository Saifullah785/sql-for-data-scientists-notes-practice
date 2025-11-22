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
USE farmers_market;
SELECT
	mdi.market_year,
    mdi.market_week,
    MAX(mdi.market_rain_flag) AS market_week_rain_flag,
    MAX(mdi.market_snow_flag) AS market_week_snow_flag,
    MIN(mdi.market_min_temp) AS minimum_temperature,
    MAX(mdi.market_max_temp) AS maximum_temperature,
    MIN(mdi.market_season) AS market_season,
    ROUND(COALESCE(SUM(cp.quantity * cp.cost_to_customer_per_qty), 0), 2) AS
Weekly_category1_sales
FROM customer_purchases cp
	INNER JOIN product p
		ON cp.product_id = p.product_id
			AND p.product_category_id = 1
	RIGHT JOIN market_date_info mdi
		ON mdi.market_date = cp.market_date
GROUP BY 
	mdi.market_year,
    mdi.market_week
    
-- =============================================================================================

USE farmers_market;

SELECT 
	mdi.market_date,
    mdi.market_year,
    mdi.market_week,
    vi.*,
    p.*
FROM vendor_booth_inventory vi
	INNER JOIN product p
		ON vi.product_id = p.product_id
			AND p.product_category_id = 1
	RIGHT JOIN market_date_info mdi
		ON mdi.market_date = vi.market_date


-- =============================================================================================
USE farmers_market;
SELECT
	mdi.market_year,
    mdi.market_week,
    COUNT(DISTINCT vi.vendor_id) AS vendor_count,
    COUNT(DISTINCT vi.product_id) as unique_product_count,
    SUM(CASE WHEN p.product_qty_type = 'unit' THEN vi.quantity ELSE 0 END)
AS unit_products_qty,
	SUM(CASE WHEN p.product_qty_type = 'lbs' THEN vi.quantity ELSE 0 END) AS bulk_products_lbs,
	ROUND (COALESCE(SUM(vi.quantity * vi.original_price), 0), 2) AS
total_product_value,
	MAX(CASE WHEN p.product_id = 16 THEN 1 ELSE 0 END) AS corn_available_flag
FROM vendor_booth_inventory vi
	INNER JOIN product p
		ON vi.product_id = p.product_id
	RIGHT JOIN market_date_info mdi
		ON mdi.market_date = vi.market_date
	GROUP BY 
    mdi.market_year,
    mdi.market_week

-- =============================================================================================
USE farmers_market;
SELECT
	mdi.market_year,
    mdi.market_week,
    COUNT(DISTINCT vi.vendor_id) AS vendor_count,
    COUNT(DISTINCT CASE WHEN p.product_category_id = 1 THEN vi.vendor_id
ELSE NULL END) AS vendor_count_product_category1,
	COUNT(DISTINCT vi.product_id) AS unique_product_count,
    COUNT(DISTINCT CASE WHEN p.product_category_id = 1 THEN vi.product_id
ELSE NULL END) AS unique_product_count_product_category1,
	SUM(CASE WHEN p.product_qty_type = 'unit' THEN vi.quantity ELSE 0 END)
AS unit_products_qty,
		
	SUM(CASE WHEN p.product_category_id = 1 AND p.product_qty_type = 'unit'
THEN vi.quantity ELSE 0 END) AS unit_products_qty_product_category1,
	SUM(CASE WHEN p.product_qty_type = 'lbs' THEN vi.quantity ELSE 0 END)
AS bulk_products_lbs,
	SUM(CASE WHEN p.product_category_id = 1 AND p.product_qty_type = 'lbs'
THEN vi.quantity ELSE 0 END) AS bulk_products_lbs_product_category1,
	ROUND(COALESCE(SUM(vi.quantity * vi.original_price), 0), 2) AS total_product_value,
    ROUND(COALESCE(SUM(CASE WHEN p.product_category_id = 1 THEN vi.quantity
* vi.original_price ELSE 0 END), 0), 2) AS total_product_value_product_category1,
	MAX(CASE WHEN p.product_id = 16 THEN 1 ELSE 0 END) AS corn_available_flag
FROM vendor_booth_inventory vi
	INNER JOIN product p
		ON vi.product_id = p.product_id
	RIGHT JOIN market_date_info mdi
		ON mdi.market_date = vi.market_date
GROUP BY 
	mdi.market_year,
    mdi.market_week

-- =============================================================================================













































































