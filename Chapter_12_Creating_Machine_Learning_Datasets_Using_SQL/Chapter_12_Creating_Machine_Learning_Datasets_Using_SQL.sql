-- ======================Chapter 12 Creating Machine Learning Datasets Using SQL============================

-- ================================Datasets for Time Series Models===================================

SELECT 
	MIN(cp.market_date) AS first_market_date_of_week,
    ROUND(SUM(cp.quantity * cp.cost_to_customer_per_qty), 2) AS weekly_sales
FROM farmers_market.customer_purchases AS cp
	LEFT JOIN farmers_market.market_date_info AS md
		ON cp.market_date = md.market_date
GROUP BY md.market_year, md.market_week
ORDER BY md.market_year, md.market_week

-- ===========================================================================================

WITH
customer_market_attended AS
	(
		SELECT DISTINCT
			customer_id,
            market_date,
		FROM farmers_market.customer_purchases
        ORDER BY customer_id, market_date
	)
    SELECT
		cp.market_date,
        cp.customer_id,
        SUM(cp.quantity * cp.cost_to_customer_per_qty) AS purchase_total,
        COUNT(DISTINCT cp.vendor_id) AS vendors_patronized,
        COUNT(DISTINCT cp.product_id) AS different_product_purchases,
        