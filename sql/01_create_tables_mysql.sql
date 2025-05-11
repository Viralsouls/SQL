-- Crear base de datos
CREATE DATABASE IF NOT EXISTS coffee_db;
USE coffee_db;

-- Crear tabla principal unificada
DROP TABLE IF EXISTS coffee_sample;

CREATE TABLE coffee_sample (
    id INT AUTO_INCREMENT PRIMARY KEY,
    species VARCHAR(20),
    owner VARCHAR(100),
    country_of_origin VARCHAR(100),
    farm_name VARCHAR(100),
    lot_number VARCHAR(50),
    mill VARCHAR(100),
    ICO_number VARCHAR(50),
    company VARCHAR(100),
    altitude_mean FLOAT,
    region VARCHAR(100),
    producer VARCHAR(100),
    number_of_bags INT,
    bag_weight VARCHAR(50),
    in_country_partner VARCHAR(100),
    harvest_year VARCHAR(20),
    grading_date DATE,
    color VARCHAR(50),
    status VARCHAR(50),
    processing_method VARCHAR(100),
    expiration DATE,
    aroma FLOAT,
    flavor FLOAT,
    aftertaste FLOAT,
    acidity FLOAT,
    body FLOAT,
    balance FLOAT,
    uniformity FLOAT,
    clean_cup FLOAT,
    sweetness FLOAT,
    cupper_points FLOAT,
    total_cup_points FLOAT,
    moisture FLOAT,
    category_one_defects INT,
    quakers INT,
    category_two_defects INT,
    defects INT,
    roast VARCHAR(50),
    sample_number VARCHAR(50),
    altitude_low FLOAT,
    altitude_high FLOAT
);
