
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
