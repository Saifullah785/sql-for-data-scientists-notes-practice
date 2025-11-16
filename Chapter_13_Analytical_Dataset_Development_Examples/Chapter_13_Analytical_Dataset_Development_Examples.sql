-- ================================ Chapter 13 Analytical Dataset Development Examples==============

-- =================================What Factors Correlate with Fresh Produce Sales?===============

SELECT * FROM farmers_market.product_category

-- =============================================================================================
SELECT * FROM farmers_market.product
WHERE product_category_id IN (1, 5, 6)
ORDER BY product_category_id

-- =============================================================================================


SELECT * 
FROM  customer_purchases cp
	INNER JOIN product p
		ON cp.product_id = p.product_id
WHERE p.product_category_id = 1