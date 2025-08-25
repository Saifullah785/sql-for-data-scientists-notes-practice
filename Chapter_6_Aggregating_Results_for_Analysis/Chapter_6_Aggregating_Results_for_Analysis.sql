
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








