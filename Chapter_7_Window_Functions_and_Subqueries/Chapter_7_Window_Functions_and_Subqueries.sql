
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


-- ===========RANK and DENSE RANK=======================

SELECT 
	vendor_id,
    market_date,
    product_id,
    original_price,
    RANK() OVER (PARTITION BY vendor_id ORDER BY original_price DESC) AS
price_rank
	FROM data_science.vendor_booth_inventory
ORDER BY vendor_id, original_price DESC


-- ===========NTILE=======================


SELECT 
	vendor_id,
    market_date,
    product_id,
    original_price,
    NTILE(10) OVER ( ORDER BY original_price DESC) AS price_ntile
    FROM data_science.vendor_booth_inventory
ORDER BY original_price DESC

-- ===========Aggregate Window Functions=======================

SELECT
	vendor_id,
    market_date,
    product_id,
    original_price,
    AVG(original_price) OVER (PARTITION BY market_date ORDER BY 
    market_date) 
				AS  average_cost_product_by_market_date
	FROM data_science.vendor_booth_inventory 
    
    
    
    -- ===================================================================
    SELECT * 
    FROM data_science.vendor_booth_inventory
      
    -- ===================================================================
    
    SELECT * FROM 
    (
		SELECT 
			vendor_id,
            market_date,
            product_id,
            original_price,
            ROUND(AVG(original_price) OVER (PARTITION BY market_date ORDER BY
		market_date), 2 ) 
					AS average_cost_product_by_market_date
		    FROM data_Science.vendor_booth_inventory
    ) x
    WHERE x.vendor_id =4
		AND x.original_price > x.average_cost_product_by_market_date
	ORDER BY x.market_date, x.original_price DESC
    
-- ===================================================================

SELECT 
	vendor_id,
    market_date,
    product_id,
    original_price,
    COUNT(product_id) OVER (PARTITION BY market_date, vendor_id)
vendor_product_count_per_market_date
	FROM data_science.vendor_booth_inventory
ORDER BY vendor_id, market_date, original_price DESC
    
-- ===================================================================

SELECT customer_id,
	market_date,
    vendor_id,
    product_id,
    quantity * cost_to_customer_per_qty AS price,
    SUM(quantity * cost_to_customer_per_qty) OVER (ORDER BY market_date,
    transaction_time, customer_id, product_id) AS running_total_purchases
    FROM data_science.customer_purchases

-- ===================================================================

SELECT customer_id,
	market_date,
    vendor_id,
    product_id,
    quantity * cost_to_customer_per_qty AS price,
    SUM(quantity * cost_to_customer_per_qty) OVER (PARTITION BY customer_id ORDER BY market_date,
    transaction_time, customer_id, product_id) AS customer_spend_running_total
    FROM data_science.customer_purchases

-- ===================================================================

SELECT customer_id,
	market_date,
    vendor_id,
    product_id,
    ROUND(quantity * cost_to_customer_per_qty, 2) AS price,
    ROUND(SUM(quantity * cost_to_customer_per_qty) OVER (PARTITION BY
customer_id), 2) AS customer_spend_total
FROM data_science.customer_purchases



-- ===========LAG and LEAD=======================

SELECT 
	market_date,
    vendor_id,
    booth_number,
    LAG(booth_number,1) OVER (PARTITION BY vendor_id ORDER BY market_date,vendor_id) AS previous_booth_number
    FROM data_science.vendor_booth_assignments
    ORDER BY market_date, vendor_id, booth_number


-- ===================================================================

SELECT * FROM 
(
	SELECT 
		market_date,
        vendor_id,
        booth_number,
        LAG(booth_number,1) OVER (PARTITION BY vendor_id ORDER BY market_date, vendor_id)
        AS previous_booth_number
        FROM data_science.vendor_booth_assignments
        ORDER BY market_date, vendor_id, booth_number
        
) x
WHERE x.market_date = '2019-04-10'
		AND (x.booth_number <> x.previous_booth_number OR x.previous_booth_number is NULL)


-- ===================================================================

SELECT 
	market_date,
    SUM(quantity * cost_to_customer_per_qty) AS market_date_total_sales
FROM data_science.customer_purchases
GROUP BY market_date
ORDER BY market_date

-- ===================================================================

SELECT 
	market_date,
    SUM(quantity * cost_to_customer_per_qty) AS market_date_total_sales,
    LAG(SUM(quantity * cost_to_customer_per_qty), 1) OVER (ORDER BY market_date) AS previous_market_date_total_sales
FROM data_science.customer_purchases
GROUP BY market_date
ORDER BY market_date











