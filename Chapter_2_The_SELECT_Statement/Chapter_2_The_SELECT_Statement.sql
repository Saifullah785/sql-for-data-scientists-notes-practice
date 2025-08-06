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

-- ==========The ORDER BY Clause: Sorting Results
/*
The ORDER BY clause is used to sort the output rows. In it, you list the columns
you want to sort the results by, in order, separated by commas. You can also
specify whether you want the sorting to be in ascending (ASC) or descending
(DESC) order. ASC sorts text alphabetically and numeric values from low to high,
and DESC sorts them in the reverse order. In MySQL, NULL values appear first
when sorting in default ascending order.
*/

SELECT product_id, product_name
FROM farmers_market.product
ORDER BY product_name
LIMIT 5


SELECT product_id, product_name
FROM farmers_market.product
ORDER BY product_id DESC
LIMIT 6


SELECT market_date, vendor_id, booth_number
FROM farmers_market.vendor_booth_assignments
ORDER BY market_date, vendor_id
LIMIT 5


