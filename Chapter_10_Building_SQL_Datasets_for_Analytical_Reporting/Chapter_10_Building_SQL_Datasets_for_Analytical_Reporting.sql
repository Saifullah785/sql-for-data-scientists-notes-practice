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

-- ====================================================================
SELECT
	cp.market_date,
    md.market_day,
    md.market_week,
    md.market_year,
    cp.vendor_id,
    v.vendor_name,
    v.vendor_type,
    ROUND(SUM(cp.quantity * cp.cost_to_customer_per_qty),2) AS sales
FROM farmers_market.customer_purchases AS cp
	LEFT JOIN farmers_market.market_date_info AS md
		ON cp.market_date = md.market_date
	LEFT JOIN farmers_market.vendor AS v
		ON cp.vendor_id = v.vendor_id
GROUP BY cp.market_date, cp.vendor_id
ORDER BY cp.market_date, cp.vendor_id
    
    
-- ====================================================================    
    

WITH sales_by_day_vendor AS
	(
		SELECT
			cp.market_date,
            md.market_day,
            md.market_week,
            md.market_year,
            cp.vendor_id,
            v.vendor_name,
            v.vendor_type,
            ROUND(SUM(cp.quantity * cp.cost_to_customer_per_qty),2) AS sales
		FROM farmers_market.customer_purchases AS cp
			LEFT JOIN farmers_market.market_date_info AS md
				ON cp.market_date = md.market_date
			LEFT JOIN farmers_market.vendor AS v
				ON cp.vendor_id = v.vendor_id
		GROUP BY cp.market_date, cp.vendor_id
        ORDER BY cp.market_date, cp.vendor_id
	)
    SELECT
		s.market_year,
        s.market_week,
        SUM(s.sales) AS weekly_sales
	FROM sales_by_day_vendor AS s
    GROUP BY s.market_year, s.market_week

-- ==================================================================== 
CREATE VIEW farmers_market.vw_sales_by_day_vendor AS
SELECT
	cp.market_date,
    md.market_day,
    md.market_week,
    md.market_year,
    cp.vendor_id,
    v.vendor_name,
    v.vendor_type,
    ROUND(SUM(cp.quantity * cp.cost_to_customer_per_qty),2) AS sales
    
FROM farmers_market.customer_purchases AS cp
	LEFT JOIN farmers_market.market_date_info AS md
		ON cp.market_date = md.market_date
	LEFT JOIN farmers_market.vendor AS v
		ON cp.vendor_id = v.vendor_id
GROUP BY cp.market_date, cp.vendor_id
ORDER BY cp.market_date, cp.vendor_id

-- ==================================================================== 

SELECT * 
FROM farmers_market.vw_sales_by_day_vendor AS s
WHERE s.market_date BETWEEN '2020-04-01' AND '2020-04-30'
	AND s.vendor_id =7
ORDER BY market_date






















    
    
    
    
    
    
    
    


















