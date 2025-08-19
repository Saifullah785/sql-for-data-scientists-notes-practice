-- ===========================CASE Statement Syntax====================
SELECT *
FROM  farmers_market.vendor


SELECT 
	vendor_id,
    vendor_name,
    vendor_type,
	CASE
		WHEN LOWER(vendor_type) LIKE '%fresh%'
         THEN 'Fresh Produce'
        ELSE 'Other'
	END AS vendor_type_condensed
    FROM farmers_market.vendor
    
    
    -- ===================================================================
    -- ========================Creating Binary Flags Using CASE====================
    
SELECT 
	market_date,
	market_day
FROM farmers_market.market_date_info
LIMIT 5


SELECT
	market_date,
    CASE
		WHEN market_day = 'Saturday' OR market_day = 'Sunday'
			THEN 1
		ELSE 0
	END AS weekend_flag
FROM farmers_market.market_date_info
LIMIT 5
    
-- ===================================================================
-- =====================Grouping or Binning Continuous Values Using CASE=====
    /*
    we had a query that filtered to only customer purchases where
an item or quantity of an item cost over $50, by putting a conditional statement
in the WHERE clause. But let’s say we wanted to return all rows, and instead of
using that value as a filter, only indicate whether the cost was over $50 or not.
We could write the query like this
*/
    
SELECT 
	market_date,
    customer_id,
    vendor_id,
    ROUND (quantity * cost_to_customer_per_qty, 2) AS price,
    CASE
		WHEN quantity * cost_to_customer_per_qty > 15
			THEN 1
		ELSE 0
	END AS price_over_50
FROM farmers_market.customer_purchases
LIMIT 10
    
    
    -- =================================================================== 
SELECT
	market_date,
	customer_id,
	vendor_id,
	ROUND (quantity * cost_to_customer_per_qty, 2) AS price,
	CASE
		WHEN quantity * cost_to_customer_per_qty < 5.00
			THEN ' Under $5'
		WHEN quantity * cost_to_customer_per_qty < 10.00
			THEN ' $5 -$9.99'
		WHEN quantity * cost_to_customer_per_qty < 20.00
			THEN ' $10 - $19.99'
		WHEN quantity * cost_to_customer_per_qty >= 20.00
			THEN ' $20 and Up'
			
		END AS price_bin
		
	FROM farmers_market.customer_purchases
	LIMIT 10
    
    
    
    SELECT
	market_date,
	customer_id,
	vendor_id,
	ROUND (quantity * cost_to_customer_per_qty, 2) AS price,
	CASE
		WHEN quantity * cost_to_customer_per_qty < 5.00
			THEN 0
		WHEN quantity * cost_to_customer_per_qty < 10.00
			THEN 5
		WHEN quantity * cost_to_customer_per_qty < 20.00
			THEN 10
		WHEN quantity * cost_to_customer_per_qty >= 20.00
			THEN 20
			
		END AS price_bin_lower_end
		
	FROM farmers_market.customer_purchases
	LIMIT 10
    
    
-- ===================== Categorical Encoding Using CASE =====


SELECT 
	booth_number,
    booth_price_level,
    CASE
		WHEN booth_price_level = 'A' THEN 1
        WHEN booth_price_level = 'B' THEN 2
        WHEN booth_price_level = 'C' THEN 3
	END AS booth_price_level_numeric
FROM farmers_market.booth
LIMIT 5


-- =================================================================== 


SELECT 
	vendor_id,
    vendor_name,
    vendor_type,
    CASE WHEN vendor_type = 'Arts & Jewelry'
		THEN 1
        ELSE 0
        
	END AS vendor_type_arts_jewelry,
    CASE WHEN vendor_type = 'Eggs & Meats'
		THEN 1
        ELSE 0
	END AS vendor_type_eggs_meats,
	CASE WHEN vendor_type = 'Fresh Focused'
		THEN 1
        ELSE 0
	END AS vendor_type_fresh_focused,
	
	CASE WHEN vendor_type = 'Fresh Variety Veggies & More '
		THEN 1
        ELSE 0
	END AS vendor_type_fresh_variety,
	CASE WHEN vendor_type = 'Prepared Foods '
		THEN 1
        ELSE 0
	END AS vendor_type_prepared
    
FROM farmers_market.vendor


-- =================================================================== 


-- ===================== CASE Statement Summary =====

SELECT
	customer_id,
    CASE
		WHEN customer_zip = '22801' THEN 'Local'
        ELSE 'Not Local'
	END customer_location_type
	FROM data_science.customer
    LIMIT 10
    
    

-- =================================================================== 
SELECT
 booth_number,
 CASE WHEN booth_price_level = 'A'
 THEN 1
 ELSE 0
 END booth_price_level_A,
 CASE WHEN booth_price_level = 'B'
 THEN 1
 ELSE 0     
END booth_price_level_B,
 CASE WHEN booth_price_level = 'C'
 THEN 1
 ELSE 0
 END booth_price_level_C
FROM data_science.booth
LIMIT 5

