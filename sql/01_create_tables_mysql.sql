CREATE DATABASE IF NOT EXISTS coffee_db;
USE coffee_db;

-- Crear tabla de auditoria
CREATE TABLE IF NOT EXISTS audit_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(50),
    table_name VARCHAR(50),
    record_id INT,
    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla principal
CREATE TABLE IF NOT EXISTS coffee_sample (
    id INT AUTO_INCREMENT PRIMARY KEY,
    species VARCHAR(20),
    owner VARCHAR(100),
    country_of_origin VARCHAR(100),
    farm_name VARCHAR(100),
    lot_number VARCHAR(50),
    mill VARCHAR(100),
    company VARCHAR(100),
    altitude_mean DECIMAL(10,2),
    region VARCHAR(100),
    producer VARCHAR(100),
    processing_method VARCHAR(100),
    aroma DECIMAL(3,2),
    flavor DECIMAL(3,2),
    aftertaste DECIMAL(3,2),
    acidity DECIMAL(3,2),
    body DECIMAL(3,2),
    balance DECIMAL(3,2),
    uniformity DECIMAL(3,2),
    clean_cup DECIMAL(3,2),
    sweetness DECIMAL(3,2),
    cupper_points DECIMAL(3,2),
    total_cup_points DECIMAL(4,2),
    moisture DECIMAL(4,2),
    category_one_defects INT,
    quakers INT,
    color VARCHAR(50),
    category_two_defects INT,
    
    INDEX idx_country (country_of_origin),
    INDEX idx_region (region),
    INDEX idx_score (total_cup_points)
);

-- Crear tabla de categorias por calidad
CREATE TABLE IF NOT EXISTS quality_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    min_score DECIMAL(4,2),
    max_score DECIMAL(4,2),
    category_name VARCHAR(50)
);

-- Insertar cateforias de calidad
INSERT INTO quality_categories (min_score, max_score, category_name) VALUES
(90, 100, 'Outstanding'),
(85, 89.99, 'Excellent'),
(80, 84.99, 'Very Good'),
(0, 79.99, 'Below Specialty');
