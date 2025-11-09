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