/*
Selecting Columns and Limiting the Number of Rows Returned
*/

SELECT * FROM farmers_market.product


SELECT * 
FROM farmers_market.product
lIMIT 5


SELECT product_id, product_name
FROM farmers_market.product
LIMIT 5


SELECT *
FROM farmers_market.vendor_booth_assignments

SELECT market_date, vendor_id, booth_number
FROM farmers_market.vendor_booth_assignments
LIMIT 5







