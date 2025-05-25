USE coffee_db;

-- Vista 1: Análisis por país
CREATE OR REPLACE VIEW country_analysis AS
SELECT 
    country_of_origin,
    COUNT(*) as total_samples,
    ROUND(AVG(total_cup_points), 2) as avg_score,
    ROUND(AVG(altitude_mean), 2) as avg_altitude,
    COUNT(DISTINCT processing_method) as processing_methods_used
FROM coffee_sample
GROUP BY country_of_origin;

-- Vista 2: Calidad por región
CREATE OR REPLACE VIEW regional_quality AS
SELECT 
    region,
    country_of_origin,
    ROUND(AVG(total_cup_points), 2) as avg_score,
    ROUND(AVG(aroma), 2) as avg_aroma,
    ROUND(AVG(flavor), 2) as avg_flavor
FROM coffee_sample
GROUP BY region, country_of_origin;

-- Vista 3: Métodos de procesamiento efectivos
CREATE OR REPLACE VIEW processing_effectiveness AS
SELECT 
    processing_method,
    COUNT(*) as total_samples,
    ROUND(AVG(total_cup_points), 2) as avg_score,
    ROUND(AVG(aroma), 2) as avg_aroma,
    ROUND(AVG(flavor), 2) as avg_flavor
FROM coffee_sample
GROUP BY processing_method;

-- Vista 4: Top productores
CREATE OR REPLACE VIEW top_producers AS
SELECT 
    producer,
    country_of_origin,
    COUNT(*) as total_samples,
    ROUND(AVG(total_cup_points), 2) as avg_score
FROM coffee_sample
WHERE producer IS NOT NULL
GROUP BY producer, country_of_origin
HAVING total_samples > 1;

-- Vista 5: Análisis de defectos
CREATE OR REPLACE VIEW defects_analysis AS
SELECT 
    country_of_origin,
    AVG(category_one_defects) as avg_cat1_defects,
    AVG(category_two_defects) as avg_cat2_defects,
    AVG(total_cup_points) as avg_score
FROM coffee_sample
GROUP BY country_of_origin;
