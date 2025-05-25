USE coffee_db;

DELIMITER //

-- Función 1: Calcular score total
CREATE FUNCTION calculate_total_score(
    p_aroma DECIMAL(3,2),
    p_flavor DECIMAL(3,2),
    p_aftertaste DECIMAL(3,2),
    p_acidity DECIMAL(3,2),
    p_body DECIMAL(3,2),
    p_balance DECIMAL(3,2)
)
RETURNS DECIMAL(4,2)
DETERMINISTIC
BEGIN
    RETURN (p_aroma + p_flavor + p_aftertaste + p_acidity + p_body + p_balance);
END //

-- Función 2: Categorizar altitud
CREATE FUNCTION categorize_altitude(altitude DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE category VARCHAR(20);
    IF altitude < 1000 THEN
        SET category = 'Bajo';
    ELSEIF altitude < 1500 THEN
        SET category = 'Medio';
    ELSE
        SET category = 'Alto';
    END IF;
    RETURN category;
END //

DELIMITER ;
