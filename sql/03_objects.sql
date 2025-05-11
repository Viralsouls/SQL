USE coffee_db;

-- ================================================
-- VISTAS
-- ================================================

-- Vista 1: Promedio de puntuación total por país
CREATE OR REPLACE VIEW avg_score_by_country AS
SELECT country_of_origin, 
       ROUND(AVG(total_cup_points), 2) AS avg_total_score
FROM coffee_sample
GROUP BY country_of_origin;

-- Vista 2: Registros con defectos altos
CREATE OR REPLACE VIEW high_defect_samples AS
SELECT id, species, country_of_origin, category_one_defects, category_two_defects, total_cup_points
FROM coffee_sample
WHERE category_one_defects > 10 OR category_two_defects > 10;

-- ================================================
-- FUNCIONES PERSONALIZADAS
-- ================================================

-- Función 1: Clasificación de calidad por puntaje
DELIMITER //
CREATE FUNCTION classify_quality(score FLOAT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE quality VARCHAR(20);
    IF score >= 85 THEN
        SET quality = 'Excelente';
    ELSEIF score >= 80 THEN
        SET quality = 'Buena';
    ELSEIF score >= 70 THEN
        SET quality = 'Regular';
    ELSE
        SET quality = 'Mala';
    END IF;
    RETURN quality;
END;
//
DELIMITER ;

-- Función 2: Defectos totales combinados
DELIMITER //
CREATE FUNCTION total_defects(cat1 INT, cat2 INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN cat1 + cat2;
END;
//
DELIMITER ;

-- ================================================
-- STORED PROCEDURES
-- ================================================

-- SP 1: Obtener cafés por país
DELIMITER //
CREATE PROCEDURE get_samples_by_country(IN countryName VARCHAR(100))
BEGIN
    SELECT * FROM coffee_sample
    WHERE country_of_origin = countryName;
END;
//
DELIMITER ;

-- SP 2: Insertar nuevo registro básico de café
DELIMITER //
CREATE PROCEDURE insert_coffee_basic(
    IN p_species VARCHAR(20),
    IN p_country VARCHAR(100),
    IN p_flavor FLOAT,
    IN p_total_score FLOAT
)
BEGIN
    INSERT INTO coffee_sample (
        species, country_of_origin, flavor, total_cup_points
    )
    VALUES (p_species, p_country, p_flavor, p_total_score);
END;
//
DELIMITER ;

-- ================================================
-- TRIGGERS
-- ================================================

-- Trigger 1: Validar que el puntaje total no sea mayor a 100
DELIMITER //
CREATE TRIGGER check_score_before_insert
BEFORE INSERT ON coffee_sample
FOR EACH ROW
BEGIN
    IF NEW.total_cup_points > 100 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Puntaje total no puede superar 100.';
    END IF;
END;
//
DELIMITER ;

-- Trigger 2: Log de inserciones en tabla de auditoría
CREATE TABLE IF NOT EXISTS audit_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sample_id INT,
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    action_type VARCHAR(50)
);

DELIMITER //
CREATE TRIGGER log_insert_sample
AFTER INSERT ON coffee_sample
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (sample_id, action_type)
    VALUES (NEW.id, 'INSERT');
END;
//
DELIMITER ;
