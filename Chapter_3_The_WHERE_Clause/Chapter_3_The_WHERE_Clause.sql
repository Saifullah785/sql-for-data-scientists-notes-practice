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
    
    

SELECT 
	customer_id,
    customer_first_name,
    customer_last_name
FROM farmers_market.customer
WHERE
	customer_first_name = 'Carlos'
    OR customer_last_name = 'Diaz'
    
    
SELECT * 
FROM farmers_market.vendor_booth_assignments
WHERE 
	vendor_id = 7
    AND market_date <= '2019-05-08'
ORDER BY market_date
    
    

-- =========================More Ways to Filter=======================


-- =========================BETWEEN=======================
SELECT *
FROM farmers_market.vendor_booth_assignments



SELECT *
FROM farmers_market.vendor_booth_assignments
WHERE
	vendor_id = 7
    AND market_date BETWEEN '2019-04-03' and '2019-04-13'
    ORDER BY market_date


-- =========================IN=======================

SELECT 
	customer_id,
    customer_first_name,
    customer_last_name
FROM farmers_market.customer
WHERE
	customer_last_name = 'Diaz'
    OR customer_last_name = 'Edwards'
    OR customer_last_name = 'Wilson'
ORDER BY customer_last_name, customer_first_name 

- --------------------------------------------------------
SELECT * 
FROM farmers_market.customer

- ------------------------------------------------------

SELECT 
	customer_id,
    customer_first_name,
    customer_last_name
FROM farmers_market.customer
WHERE
	customer_last_name IN ('Diaz', 'Edwards', 'Wilson')
    
ORDER BY customer_last_name, customer_first_name


- --------------------------------------------------------
SELECT
	customer_id,
	customer_first_name,
	customer_last_name
FROM farmers_market.customer
WHERE
	customer_first_name IN ('Renee', 'Rene', 'Renée', 'René', 'Renne')

- --------------------------------------------------------
-- =========================LIKE=======================

SELECT 
	customer_id, 
    customer_first_name,
    customer_last_name
FROM farmers_market.customer
WHERE
	customer_first_name LIKE 'Jer%'