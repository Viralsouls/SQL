USE coffee_db;

DELIMITER //

-- Trigger 1: Validación de datos antes de inserción
CREATE TRIGGER before_coffee_insert
BEFORE INSERT ON coffee_sample
FOR EACH ROW
BEGIN
    IF NEW.total_cup_points > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Total cup points cannot exceed 100';
    END IF;
    
    IF NEW.altitude_mean < 0 THEN
        SET NEW.altitude_mean = NULL;
    END IF;
END //

-- Trigger 2: Registro de auditoría
CREATE TRIGGER after_coffee_update
AFTER UPDATE ON coffee_sample
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (action_type, table_name, record_id)
    VALUES ('UPDATE', 'coffee_sample', NEW.id);
END //

DELIMITER ;
