-- ==============Chapter 10 ■ Building SQL Datasets for Analytical Reporting==========

-- ===========Thinking Through Analytical Dataset Requirements===============

SELECT
	market_date,
    vendor_id,
    quantity * cost_to_customer_per_qty
FROM farmers_market.customer_purchases