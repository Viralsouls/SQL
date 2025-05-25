USE coffee_db;

-- Reporte 1: Top 10 países por calidad
SELECT 
    country_of_origin,
    COUNT(*) as total_samples,
    ROUND(AVG(total_cup_points), 2) as avg_score,
    ROUND(AVG(altitude_mean), 2) as avg_altitude
FROM coffee_sample
GROUP BY country_of_origin
HAVING total_samples > 5
ORDER BY avg_score DESC
LIMIT 10;

-- Reporte 2: Análisis de métodos de procesamiento
SELECT 
    processing_method,
    COUNT(*) as samples,
    ROUND(AVG(total_cup_points), 2) as avg_score,
    ROUND(AVG(aroma), 2) as avg_aroma,
    ROUND(AVG(flavor), 2) as avg_flavor
FROM coffee_sample
GROUP BY processing_method
HAVING samples > 5
ORDER BY avg_score DESC;

-- Reporte 3: Correlación altitud-calidad
SELECT 
    CASE 
        WHEN altitude_mean < 1000 THEN 'Bajo (<1000m)'
        WHEN altitude_mean < 1500 THEN 'Medio (1000-1500m)'
        ELSE 'Alto (>1500m)'
    END as altitude_range,
    COUNT(*) as samples,
    ROUND(AVG(total_cup_points), 2) as avg_score
FROM coffee_sample
WHERE altitude_mean IS NOT NULL
GROUP BY altitude_range
ORDER BY avg_score DESC;

-- Reporte 4: Análisis de defectos
SELECT 
    CASE 
        WHEN category_one_defects = 0 THEN 'Sin defectos'
        WHEN category_one_defects <= 5 THEN '1-5 defectos'
        ELSE 'Más de 5 defectos'
    END as defect_range,
    COUNT(*) as samples,
    ROUND(AVG(total_cup_points), 2) as avg_score
FROM coffee_sample
GROUP BY defect_range
ORDER BY avg_score DESC;
