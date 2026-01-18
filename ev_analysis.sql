CREATE TABLE electric_vehicles (
    vin TEXT,
    county TEXT,
    city TEXT,
    state TEXT,
    postal_code TEXT,
    model_year INT,
    make TEXT,
    model TEXT,
    ev_type TEXT,
    cafv_eligibility TEXT,
    electric_range INT,
    base_msrp INT,
    legislative_district INT,
    dol_vehicle_id BIGINT,
    vehicle_location TEXT,
    electric_utility TEXT,
    census_tract TEXT
);

SELECT COUNT(*) AS total_records FROM electric_vehicles;

SELECT * FROM electric_vehicles LIMIT 10;

-- check null values
SELECT
    COUNT(*) FILTER (WHERE model_year IS NULL) AS null_model_year,
    COUNT(*) FILTER (WHERE make IS NULL) AS null_make,
    COUNT(*) FILTER (WHERE ev_type IS NULL) AS null_ev_type,
    COUNT(*) FILTER (WHERE electric_range IS NULL) AS null_range,
    COUNT(*) FILTER (WHERE base_msrp IS NULL) AS null_price
FROM electric_vehicles;

-- handle null number
UPDATE electric_vehicles
SET electric_range = 0
WHERE electric_range IS NULL;

UPDATE electric_vehicles
SET base_msrp = 0
WHERE base_msrp IS NULL;

-- standardize text values
UPDATE electric_vehicles SET make = INITCAP(make);
UPDATE electric_vehicles SET city = INITCAP(city);
UPDATE electric_vehicles SET ev_type = INITCAP(ev_type);

-- check duplicates
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT dol_vehicle_id) AS unique_vehicles
FROM electric_vehicles;

-- EV adoption trend
SELECT
    model_year,
    COUNT(*) AS total_vehicles,
    COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY model_year) AS yearly_growth
FROM electric_vehicles
GROUP BY model_year
ORDER BY model_year;

-- market share of each brand
SELECT
    make,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS market_share
FROM electric_vehicles
GROUP BY make
ORDER BY total DESC
LIMIT 10;

-- avg range of bev and phev
SELECT
    ev_type,
    ROUND(AVG(electric_range), 2) AS avg_range
FROM electric_vehicles
GROUP BY ev_type;

-- yearly growth analysis
WITH yearly_data AS (
    SELECT model_year, COUNT(*) AS total
    FROM electric_vehicles
    GROUP BY model_year
)
SELECT
    model_year,
    total,
    total - LAG(total) OVER (ORDER BY model_year) AS growth
FROM yearly_data;

-- view for power bi 
CREATE VIEW ev_yearly_summary AS
SELECT
    model_year,
    COUNT(*) AS total_vehicles,
    AVG(electric_range) AS avg_range,
    AVG(base_msrp) AS avg_price
FROM electric_vehicles
GROUP BY model_year;

-- yearly ev growth
CREATE VIEW ev_yearly_growth AS
SELECT
    model_year,
    COUNT(*) AS total_vehicles
FROM electric_vehicles
GROUP BY model_year;

-- brand market share
CREATE VIEW ev_make_share AS
SELECT
    make,
    COUNT(*) AS total_vehicles
FROM electric_vehicles
GROUP BY make;

-- ev type distribution
CREATE VIEW ev_type_distribution AS
SELECT
    ev_type,
    COUNT(*) AS total_vehicles
FROM electric_vehicles
GROUP BY ev_type;

-- city wise adoptation
CREATE VIEW ev_city_distribution AS
SELECT
    city,
    state,
    'United States' AS country,
    COUNT(*) AS total_vehicles
FROM electric_vehicles
GROUP BY city, state;

-- ml view 
CREATE VIEW ev_ml_dataset ASx
SELECT
    model_year,
    base_msrp,
    electric_range
FROM electric_vehicles
WHERE electric_range > 0;

-- ev_type_distribution
CREATE OR REPLACE VIEW ev_type_distribution AS
SELECT
    ev_type,
    COUNT(*) AS total_vehicles
FROM electric_vehicles
GROUP BY ev_type;

-- relations
CREATE OR REPLACE VIEW dim_model_year AS
SELECT DISTINCT
    model_year
FROM electric_vehicles;

CREATE OR REPLACE VIEW dim_make AS
SELECT DISTINCT make
FROM electric_vehicles;

CREATE OR REPLACE VIEW dim_state AS
SELECT DISTINCT state
FROM electric_vehicles;

CREATE OR REPLACE VIEW dim_ev_type AS
SELECT DISTINCT ev_type
FROM electric_vehicles;







	



