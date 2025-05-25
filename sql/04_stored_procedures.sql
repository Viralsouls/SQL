USE coffee_db;

DELIMITER //

-- SP1: Análisis detallado por país
CREATE PROCEDURE analyze_country(IN p_country VARCHAR(100))
BEGIN
    SELECT 
        COUNT(*) as total_samples,
        ROUND(AVG(total_cup_points), 2) as avg_score,
        ROUND(AVG(altitude_mean), 2) as avg_altitude,
        COUNT(DISTINCT processing_method) as processing_methods,
        ROUND(AVG(category_one_defects), 2) as avg_defects_cat1,
        ROUND(AVG(category_two_defects), 2) as avg_defects_cat2
    FROM coffee_sample
    WHERE country_of_origin = p_country;
END //

-- SP2: Muestras por rango de puntuación
CREATE PROCEDURE samples_by_score_range(
    IN p_min_score DECIMAL(4,2),
    IN p_max_score DECIMAL(4,2)
)
BEGIN
    SELECT *
    FROM coffee_sample
    WHERE total_cup_points BETWEEN p_min_score AND p_max_score
    ORDER BY total_cup_points DESC;
END //

-- SP3: Actualizar categoría de calidad
CREATE PROCEDURE update_quality_categories()
BEGIN
    UPDATE coffee_sample cs
    JOIN quality_categories qc
    ON cs.total_cup_points BETWEEN qc.min_score AND qc.max_score
    SET cs.quality_category = qc.category_name;
END //

DELIMITER ;
