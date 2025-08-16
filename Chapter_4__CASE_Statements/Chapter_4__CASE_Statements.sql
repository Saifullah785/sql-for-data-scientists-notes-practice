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
    
    
    
    
    
    
    
    
    