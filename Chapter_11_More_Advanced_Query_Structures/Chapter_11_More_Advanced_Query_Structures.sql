
-- ===============More Advanced Query Structures=========

-- ===================UNIONs=============================
SELECT market_year, MIN(market_date) AS first_market_date
FROM farmers_market.market_date_info
Where market_year = '2019'

UNION

SELECT market_year, MIN(market_Date) AS first_market_date
FROM farmers_market.market_date_info
WHERE  market_year = '2020'  