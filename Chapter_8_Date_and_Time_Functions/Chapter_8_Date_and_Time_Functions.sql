


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

















