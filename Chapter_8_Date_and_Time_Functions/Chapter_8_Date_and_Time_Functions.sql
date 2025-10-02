


-- =========Setting datetime Field Values+=======================

CREATE TABLE farmers_market.datetime_demo AS
(
	SELECT market_date,
		market_start_time,
        market_end_time,
        STR_TO_DATE(CONCAT(market_date, ' ', market_start_time),'%Y-%m-%d
%h:%i %p') 
			AS market_start_datetime,
            
		STR_TO_DATE(CONCAT(market_date, ' ', market_end_time),'%Y-%m-%d
%h:%i %p')
			AS market_end_datetime
		FROM farmers_market.market_date_info        
)

-- ==========EXTRACT and DATE_PART=======================
    
SELECT market_start_datetime,
	EXTRACT(DAY FROM market_start_datetime) AS mksrt_day,
    EXTRACT(MONTH FROM market_start_datetime) AS mktsrt_month,
    EXTRACT(YEAR FROM market_Start_datetime) AS mktsrt_year,
    EXTRACT(HOUR FROM market_start_datetime) AS mktsrt_hour,
    EXTRACT(MINUTE FROM market_start_datetime) AS mktsrt_minute
FROM farmers_market.datetime_demo
WHERE market_Start_datetime = '2019-03-02 08:00:00'

-- ===================================================================
SELECT *
FROM farmers_market.datetime_demo


SELECT market_start_datetime,
	DATE(market_start_datetime) AS mktsrt_date,
    TIME(market_start_datetime) AS mktsrt_time
FROM farmers_market.datetime_demo
WHERE market_start_datetime = '2019-03-02 08:00:00'

-- =============DATE_ADD and DATE_SUB=========================

SELECT market_start_datetime,
	DATE_ADD(market_start_datetime, INTERVAL 30 MINUTE)AS mktstrt_date_plus_30min
FROM farmers_market.datetime_demo
WHERE market_start_datetime = '2019-03-02 08:00:00'

-- ===================================================================

SELECT market_start_datetime,
	DATE_ADD(market_start_datetime, INTERVAL 30 DAY) AS mktstrt_date_plus_30days
FROM farmers_market.datetime_demo
WHERE market_start_datetime = '2019=03-02 08:00:00'


-- ===================================================================
SELECT market_start_datetime,
	DATE_ADD(market_start_datetime, INTERVAL -30 DAY) AS mkstrt_date_plus_neg30days,
    DATE_SUB(market_start_datetime, INTERVAL 30 DAY) AS mktstrt_date_minus_30days
FROM farmers_market.datetime_demo
WHERE market_start_datetime = '2019-03-02 08:00:00'

-- =============DATEDIFF=========================

SELECT
	x.first_market,
    x.last_market,
    DATEDIFF(x.last_market, x.first_market) days_first_to_last
FROM 
(
	SELECT
		min(market_start_Datetime) first_market,
        max(market_start_datetime) last_market
	FROM farmers_market.datetime_demo
) x


-- ==================TIMESTAMPDIFF===========================

SELECT market_start_datetime, market_end_datetime,
	TIMESTAMPDIFF(HOUR, market_start_datetime, market_end_datetime)
		AS market_duration_hours,
	TIMESTAMPDIFF(MINUTE, market_start_datetime, market_end_datetime)
		AS market_duration_mins
FROM farmers_market.datetime_demo


-- ======Date Functions in Aggregate Summaries and Window Functions================


SELECT customer_id, market_date
FROM farmers_market.customer_purchases
WHERE customer_id = 1

-- ===================================================================

SELECT customer_id,
	MIN(market_date) AS first_purchases,
    MAX(market_date) AS last_purchases,
    COUNT(DISTINCT market_date) AS count_of_purchase_dates
FROM farmers_market.customer_purchases
WHERE customer_id = 1
GROUP BY customer_id

-- ===================================================================

SELECT customer_id,
	MIN(market_date) AS first_purchases,
    MAX(market_date) AS last_purchases,
    COUNT(DISTINCT market_date) AS count_of_purchases_dates,
    DATEDIFF(MAX(market_date), MIN(market_date)) AS days_between_first_last_purchases
FROM farmers_market.customer_purchases
GROUP BY customer_id

-- ===================================================================
SELECT customer_id,
	MIN(market_date) AS first_purchase,
    MAX(market_date) AS last_purchase,
    COUNT(DISTINCT market_date) AS count_of_purchase_dates,
    DATEDIFF (MAX(market_date), MIN(market_date)) AS days_between_first_last_purchase,
    DATEDIFF (CURDATE(), MAX(market_date)) AS days_since_last_purchases
FROM farmers_market.customer_purchases
GROUP BY customer_id

-- ===================================================================

SELECT customer_id, market_date,
	RANK() OVER (PARTITION BY customer_id ORDER BY market_date) AS purchase_number,
    LEAD(market_date,1) OVER (PARTITION BY customer_id ORDER BY market_date) AS next_purchase
FROM farmers_market.customer_purchases
WHERE customer_id = 1




















