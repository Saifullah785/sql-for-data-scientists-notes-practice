
-- ===================== GROUP BY Syntax =============================

USE data_science;
SELECT
	market_date,
    customer_id
FROM data_science.customer_purchases
ORDER BY market_date, customer_id


-- ===================================================================

SELECT 
	market_date,
    customer_id
FROM data_science.customer_purchases
GROUP BY market_date, customer_id
ORDER BY market_date, customer_id

-- ====================Displaying Group Summaries=============================

SELECT 
	market_date,
    customer_id,
    COUNT(*) AS items_purchassed
FROM data_science.customer_purchases
GROUP BY market_date, customer_id
ORDER BY market_date, customer_id
LIMIT 10

-- ===================================================================


SELECT * 
FROM data_science.customer_purchases

SELECT 
	market_date,
    customer_id,
    SUM(Quantity) AS items_purchased
FROM data_science.customer_purchases
GROUP BY market_date, customer_id
ORDER BY market_date, customer_id
LIMIT 10

-- ===================================================================

SELECT 
	market_date,
    customer_id,
    COUNT(DISTINCT product_id) AS different_products_purchased
    FROM data_science.customer_purchases c
    GROUP BY market_date, customer_id
    ORDER BY market_date, customer_id
    LIMIT 10

-- ===================================================================

SELECT 
	market_date,
    customer_id,
    SUM(quantity) AS items_purchasesd,
    COUNT(DISTINCT product_id) AS different_products_purchased
FROM data_science.customer_purchases
GROUP BY market_date, customer_id
ORDER BY market_date, customer_id
LIMIT 10



-- ===================Performing Calculations Inside Aggregate Functions=============================

SELECT 
	market_date,
    customer_id,
    vendor_id,
    quantity * cost_to_customer_per_qty AS price
FROM data_science.customer_purchases
WHERE 
	customer_id = 3
ORDER BY market_date, vendor_id

-- ===================================================================

SELECT 
	customer_id,
    market_date,
    SUM(quantity * cost_to_customer_per_qty) AS total_spent
FROM data_science.customer_purchases
WHERE 
	customer_id = 3
GROUP BY market_date
ORDER BY market_date


-- ===================================================================

SELECT 
	customer_id,
    vendor_id,
    SUM(quantity * cost_to_customer_per_qty) AS total_spent
FROM data_science.customer_purchases
WHERE 
	customer_id = 3
GROUP BY customer_id, vendor_id
ORDER BY customer_id, vendor_id


-- ===================================================================
SELECT
	customer_id,
    SUM(quantity * cost_to_customer_per_qty) AS total_spent
FROM data_science.customer_purchases
GROUP BY customer_id
ORDER BY customer_id



-- ===================================================================
SELECT 
	c.customer_first_name,
    c.customer_last_name,
    cp.customer_id,
    v.vendor_name,
    cp.vendor_id,
    cp.quantity * cp.cost_to_customer_per_qty AS price
FROM data_science.customer c
	LEFT JOIN data_science.customer_purchases cp
		ON c.customer_id = cp.customer_id
    LEFT JOIN data_science.vendor v
		ON cp.vendor_id = v.vendor_id
WHERE 	
	cp.customer_id = 3
ORDER BY cp.customer_id, cp.vendor_id


-- ===================================================================

SELECT 
	c.customer_first_name,
    c.customer_last_name,
    cp.customer_id,
    v.vendor_name,
    cp.vendor_id,
    ROUND(SUM(quantity * cost_to_customer_per_qty), 2) AS total_spent
FROM data_Science.customer c
	LEFT JOIN data_science.customer_purchases cp
		ON c.customer_id = cp.customer_id
	LEFT JOIN data_science.vendor v
		ON cp.vendor_id = v.vendor_id
WHERE
	cp.customer_id = 3
GROUP BY 
	c.customer_first_name,
    c.customer_last_name,
    cp.customer_id,
    v.vendor_name,
    cp.vendor_id
ORDER BY cp.customer_id, cp.vendor_id


-- ===================================================================

SELECT
 c.customer_first_name,
 c.customer_last_name,
 cp.customer_id,
 v.vendor_name,
 cp.vendor_id,
 ROUND(SUM(quantity * cost_to_customer_per_qty), 2) AS total_spent
FROM data_science.customer c
LEFT JOIN data_science.customer_purchases cp

   ON c.customer_id = cp.customer_id
LEFT JOIN data_science.vendor v
   ON cp.vendor_id = v.vendor_id
WHERE
cp.vendor_id = 9
GROUP BY
 
 c.customer_first_name,
 c.customer_last_name,
 cp.customer_id,
 v.vendor_name,
 cp.vendor_id
 
ORDER BY cp.customer_id, cp.vendor_id

