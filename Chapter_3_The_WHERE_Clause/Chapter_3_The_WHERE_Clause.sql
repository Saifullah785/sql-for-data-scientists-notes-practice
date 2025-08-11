-- ================Filtering SELECT Statement Results=================

SELECT 
	product_id,
	product_name,
	product_category_id
FROM farmers_market.product
WHERE 
	product_category_id = 1
LIMIT 5



SELECT 
	market_date,
    customer_id, 
    vendor_id,
    product_id,
    quantity,
    quantity * cost_to_customer_per_qty AS price
    
FROM farmers_market.customer_purchases
WHERE customer_id = 4
ORDER BY market_date, vendor_id, product_id
LIMIT 5

-- ======================Filtering on Multiple Conditions===============

SELECT 
	market_date,
    customer_id,
    vendor_id,
    product_id,
    quantity,
    quantity * cost_to_customer_per_qty AS price
FROM farmers_market.customer_purchases
WHERE customer_id = 3
	OR customer_id = 4
ORDER BY market_date, customer_id, vendor_id, product_id



SELECT 
	market_date,
    customer_id,
    vendor_id,
    product_id,
    quantity,
    quantity * cost_to_customer_per_qty AS price
FROM farmers_market.customer_purchases
WHERE customer_id > 3
	AND customer_id <= 5
ORDER BY market_date, customer_id, vendor_id, product_id


SELECT 
	product_id,
    product_name
FROM farmers_market.product
WHERE
	product_id = 10
    OR (product_id > 3
    AND product_id < 8)
    
    

SELECT 
	product_id,
    product_name
FROM farmers_market.product
WHERE 
	(product_id = 10
    OR product_id > 3)
    AND product_id < 8


-- =======================Multi-Column Conditional Filtering===============

SELECT 
	market_date,
    customer_id,
    vendor_id,
    quantity * cost_to_customer_per_qty AS price
FROM farmers_market.customer_purchases
WHERE
	customer_id = 4
    AND vendor_id = 7








