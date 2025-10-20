-- ==============Chapter 10 Building SQL Datasets for Analytical Reporting==========

-- ===========Thinking Through Analytical Dataset Requirements===============

SELECT
	market_date,
    vendor_id,
    quantity * cost_to_customer_per_qty
FROM farmers_market.customer_purchases

-- ====================================================================

SELECT
	market_date,
    vendor_id,
    ROUND(SUM(quantity * cost_to_customer_per_qty),2) AS sales
FROM farmers_market.customer_purchases
GROUP BY market_date, vendor_id
ORDER BY market_date, vendor_id