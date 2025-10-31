
-- ===============More Advanced Query Structures=========

-- ===================UNIONs=============================
SELECT market_year, MIN(market_date) AS first_market_date
FROM farmers_market.market_date_info
Where market_year = '2019'

UNION

SELECT market_year, MIN(market_Date) AS first_market_date
FROM farmers_market.market_date_info
WHERE  market_year = '2020'  

-- ========================================================

WITH
product_quantity_by_date AS
(
	SELECT
		vi.market_date,
        vi.product_id,
        p.product_name,
        SUM(vi.quantity) AS total_quantity_available,
        p.product_qty_type
	FROM farmers_market.vendor_booth_inventory vi
		lEFT JOIN farmers_market.product p
			ON vi.product_id = p.product_id
	GROUP BY market_date, product_id
)
SELECT * FROM 
(
	SELECT
		
        market_date,
        product_id,
        product_name,
        total_quantity_available,
        product_qty_type,
        RANK() OVER (PARTITION BY market_date ORDER BY total_quantity_available DESC) AS quantity_rank
        
	FROM product_quantity_by_date
    WHERE product_qty_type = 'unit'
    
    UNION
    SELECT
		market_date,
        product_id,
        product_name,
        total_quantity_available,
        product_qty_type,
        RANK() OVER (PARTITION BY market_date ORDER BY total_quantity_available DESC) AS quantity_rank
        FROM product_quantity_by_date
        WHERE product_qty_type = 'lbs'
        
) x

WHERE x.quantity_rank = 1
ORDER BY market_date
		
        
-- ========================================================
WITH
product_quantity_by_date AS
 (
	SELECT
		vi.market_date,
        vi.product_id,
        p.product_name,
        SUM(vi.quantity) AS total_quantity_available,
        p.product_qty_type
	FROM farmers_market.vendor_booth_inventory vi
		LEFT JOIN farmers_market.product p
			ON vi.product_id = p.product_id
	GROUP BY market_date, product_id
    
),
rank_by_qty_type AS
(
	SELECT
		market_date,
        product_id,
        product_name,
        total_quantity_available,
        product_qty_type,
        RANK() OVER (PARTITION BY market_date, product_qty_type ORDER BY
	total_quantity_available DESC) AS quantity_rank
		FROM product_quantity_by_date
)

SELECT * FROM rank_by_qty_type
WHERE quantity_rank = 1
ORDER BY market_date

-- ========================================================
-- ===============Self-Join to Determine To-Date Maximum=========

WITH
sales_per_market_date AS
	(
		SELECT
			market_date,
            ROUND(SUM(quantity * cost_to_customer_per_qty),2) AS sales
		FROM farmers_market.customer_purchases
		GROUP BY market_date
        ORDER BY market_date
	)
    SELECT *
    FROM sales_per_market_date
    LIMIT 10


-- ====================================================================

















