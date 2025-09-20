
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