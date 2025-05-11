-- Eliminar tablas si ya existen (para permitir reejecución)
DROP TABLE IF EXISTS quality_logs;
DROP TABLE IF EXISTS coffee_samples;
DROP TABLE IF EXISTS farms;
DROP TABLE IF EXISTS countries;

-- Crear tabla de países
CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

-- Crear tabla de fincas
CREATE TABLE farms (
    farm_id INT AUTO_INCREMENT PRIMARY KEY,
    farm_name VARCHAR(100) NOT NULL,
    altitude INT,
    region VARCHAR(100),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

-- Crear tabla de muestras de café
CREATE TABLE coffee_samples (
    sample_id INT AUTO_INCREMENT PRIMARY KEY,
    farm_id INT,
    variety VARCHAR(100),
    processing_method VARCHAR(100),
    aroma_score DECIMAL(3,1),
    flavor_score DECIMAL(3,1),
    aftertaste_score DECIMAL(3,1),
    acidity_score DECIMAL(3,1),
    body_score DECIMAL(3,1),
    balance_score DECIMAL(3,1),
    uniformity_score DECIMAL(3,1),
    sweetness_score DECIMAL(3,1),
    clean_cup_score DECIMAL(3,1),
    overall_score DECIMAL(3,1),
    defects INT DEFAULT 0,
    total_score DECIMAL(4,1),
    FOREIGN KEY (farm_id) REFERENCES farms(farm_id)
);

-- Crear tabla de logs de cambios en calidad
CREATE TABLE quality_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    sample_id INT,
    old_score DECIMAL(4,1),
    new_score DECIMAL(4,1),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sample_id) REFERENCES coffee_samples(sample_id)
);
