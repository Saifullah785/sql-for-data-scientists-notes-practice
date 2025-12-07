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

-- =====================================================================================
CREATE VIEW farmers_market.product_units_vw AS
(
	SELECT *
    FROM farmers_market.product
    WHERE product_qty_type = "unit"
    
)
;

SELECT * FROM farmers_market.product_units_vw
;

DROP VIEW farmers_market.product_units_vw
;

-- =====================================================================================


CREATE TABLE farmers_market.product_units AS
(
		SELECT p. *,
			CURRENT_TIMESTAMP AS snapshot_timestamp
		FROM farmers_market.product AS p
        WHERE product_qty_type = "unit"
)


-- =====================================================================================




















