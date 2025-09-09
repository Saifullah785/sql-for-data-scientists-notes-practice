
-- ===========Chapter 7 Window Functions and Subqueries=======================

-- ===========ROW NUMBER=======================

SELECT 
	vendor_id,
    MAX(original_price) AS highest_price
FROM data_science.vendor_booth_inventory
GROUP BY vendor_id
ORDER BY vendor_id

-- ===================================================================

SELECT 
	vendor_id,
    market_date,
    product_id,
    original_price,
    ROW_NUMBER() OVER (PARTITION BY vendor_id ORDER BY original_price DESC) AS
price_rank
FROM data_science.vendor_booth_inventory ORDER BY vendor_id, original_price DESC

-- ===================================================================

SELECT * FROM
(
	SELECT 
		vendor_id,
        market_date,
		product_id,
        original_price,
        ROW_NUMBER() OVER (PARTITION BY vendor_id ORDER BY original_price DESC) AS
price_rank
	FROM data_science.vendor_booth_inventory
    ORDER BY vendor_id) x
WHERE x.price_rank = 2




