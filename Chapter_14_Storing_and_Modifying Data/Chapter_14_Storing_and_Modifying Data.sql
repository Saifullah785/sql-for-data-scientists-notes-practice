-- ================================ Chapter 14 Storing and Modifying Data ==============

CREATE TABLE farmers_market.product_units AS
	(
		SELECT * 
        FROM farmers_market.product
        WHERE product_qty_type = "unit"
)
;
SELECT * FROM farmers_market.product_units
;
DROP TABLE farmers_market.product_units
;