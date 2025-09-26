


-- =========Setting datetime Field Values+=======================

CREATE TABLE data_science.datetime_demo AS
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
		FROM data_science.market_date_info        
)

-- ==========EXTRACT and DATE_PART=======================
    
SELECT market_start_datetime,
	EXTRACT(DAY FROM market_start_datetime) AS mksrt_day,
    EXTRACT(MONTH FROM market_start_datetime) AS mktsrt_month,
    EXTRACT(YEAR FROM market_Start_datetime) AS mktsrt_year,
    EXTRACT(HOUR FROM market_start_datetime) AS mktsrt_hour,
    EXTRACT(MINUTE FROM market_start_datetime) AS mktsrt_minute
FROM data_science.datetime_demo
WHERE market_Start_datetime = '2019-03-02 08:00:00'

-- ===================================================================



SELECT market_start_datetime,
	DATE(market_start_datetime) AS mktsrt_date,
    TIME(market_start_datetime) AS mktsrt_time
FROM data_science.datatime_demo
WHERE market_start_datetime = '2019-03-02 08:00:00'

-- =============DATE_ADD and DATE_SUB=========================

SELECT market_start_datetime,
	DATE_ADD(market_start_datetime, INTERVAL 30 MINUTE)AS mktstrt_date_plus_30min
FROM data_Science.datetime_demo
WHERE market_start_datetime = '2019-03-02 08:00:00'

-- ===================================================================

SELECT market_start_datetime,
	DATE_ADD(market_start_datetime, INTERVAL 30 DAY) AS mktstrt_date_plus_30days
FROM data_science.datetime_demo
WHERE market_start_datetime = '2019=03-02 08:00:00'


-- ===================================================================
SELECT market_start_datetime,
	DATE_ADD(market_start_datetime, INTERVAL -30 DAY) AS mkstrt_date_plus_neg30days,
    DATE_SUB(market_start_datetime, INTERVAL 30 DAY) AS mktstrt_date_minus_30days
FROM data_science.datetime_demo
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
	FROM data_science.datetime_demo
) x



