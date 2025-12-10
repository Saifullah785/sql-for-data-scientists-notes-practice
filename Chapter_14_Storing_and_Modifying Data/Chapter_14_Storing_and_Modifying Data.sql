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

INSERT INTO farmers_market.product_units (product_id, product_name, product_size, product_category_id, product_qty_type, snapshot_timestamp)
	SELECT
		product_id,
        product_name,
        product_size,
        product_category_id,
        product_qty_type,
        CURRENT_TIMESTAMP
	FROM farmers_market.product AS p
    WHERE product_id = 23

-- =====================================================================================

DELETE FROM farmers_market.product_units
WHERE product_id = 23
	AND snapshot_timestamp = "2021-04-18 00:49:24"


-- =====================================================================================
CREATE TABLE farmers_market.vendor_booth_log AS
(
	SELECT vba. *,
		b.booth_type,
        v.vendor_name,
        CURRENT_TIMESTAMP AS snapshot_timestamp
	FROM farmers_market.vendor_booth_assignments vba
		INNER JOIN farmers_market.vendor v
			ON vba.vendor_id = v.vendor_id
		INNER JOIN farmers_market.booth b
			ON vba.booth_number = b.booth_number
	WHERE market_date >= '2020-10-01'
)


-- =====================================================================================










