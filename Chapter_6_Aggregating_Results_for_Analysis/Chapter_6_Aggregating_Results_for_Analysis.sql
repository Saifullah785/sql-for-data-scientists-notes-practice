
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

-- ===================MIN and MAX======================================

SELECT *
FROM data_science.vendor_booth_inventory
ORDER BY original_price
LIMIT 10


-- ===================================================================

SELECT 
	MIN(original_price) AS minimum_price,
    MAX(original_price) AS maximum_price
FROM data_science.vendor_booth_inventory
ORDER BY original_price

-- ===================================================================


SELECT 
	pc.product_category_name,
    p.product_category_id,
    MIN(vi.original_price) AS minimun_price,
    MAX(vi.original_price) AS maximum_price
    
FROM data_science.vendor_booth_inventory AS vi
	INNER JOIN data_science.product AS p
		ON vi.product_id = p.product_id
	INNER JOIN data_science.product_category AS pc
		ON p.product_category_id = pc.product_category_id
GROUP BY pc.product_category_name, p.product_category_id


-- ===================COUNT and COUNT DISTINCT================================



SELECT 
	market_date,
    COUNT(product_id) AS product_count
FROM data_science.vendor_booth_inventory
GROUP BY market_date
ORDER BY market_date

-- ===================================================================

SELECT
	vendor_id,
    COUNT(DISTINCT product_id) AS different_products_offered
FROM data_science.vendor_booth_inventory
WHERE market_date BETWEEN '2019-04-03' AND '2019-12-28'
GROUP BY vendor_id
ORDER BY vendor_id


-- ===================================================================

-- ===================Average================================


SELECT 
	vendor_id,
    COUNT(DISTINCT product_id) AS different_products_offered,
    AVG(original_price) AS average_product_price
FROM data_science.vendor_booth_inventory
WHERE market_date BETWEEN '2019-04-03' AND '2019-12-28'
GROUP BY vendor_id
ORDER BY vendor_id



-- ===================================================================


SELECT 
	vendor_id,
    COUNT(DISTINCT product_id) AS different_products_offered,
    SUM(quantity * original_price) AS value_of_inventory,
    SUM(quantity) AS inventory_item_count,
    ROUND(SUM(quantity * original_price) / SUM(quantity), 2) AS 
average_item_price
FROM data_science.vendor_booth_inventory
WHERE market_date BETWEEN '2019-04-03' AND '2019-12-28'
GROUP BY vendor_id
ORDER BY vendor_id



-- ===================================================================















