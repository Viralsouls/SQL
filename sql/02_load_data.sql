-- Seleccionar base de datos
USE coffee_db;

-- -------------------------------
-- CARGA DE DATOS PARA ARABICA
-- -------------------------------
LOAD DATA INFILE '../data/arabica_data_cleaned.csv'
INTO TABLE coffee_sample
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(species, owner, country_of_origin, farm_name, lot_number, mill, company, altitude_mean_meters,
 region, processing_method, variety, aroma, flavor, aftertaste, acidity, body, balance,
 uniformity, clean_cup, sweetness, cupper_points, total_cup_points, moisture_percentage,
 category_one_defects, quakers, color, category_two_defects);

-- -------------------------------
-- CARGA DE DATOS PARA ROBUSTA
-- -------------------------------
LOAD DATA INFILE '../data/robusta_data_cleaned.csv'
INTO TABLE coffee_sample
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(species, owner, country_of_origin, farm_name, lot_number, mill, company, altitude_mean_meters,
 region, processing_method, variety, aroma, flavor, aftertaste, acidity, body, balance,
 uniformity, clean_cup, sweetness, cupper_points, total_cup_points, moisture_percentage,
 category_one_defects, quakers, color, category_two_defects);

-- -------------------------------
-- CARGA DE DATOS PARA MERGED
-- -------------------------------
LOAD DATA INFILE '../data/merged_data_cleaned.csv'
INTO TABLE coffee_sample
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(species, owner, country_of_origin, farm_name, lot_number, mill, company, altitude_mean_meters,
 region, processing_method, variety, aroma, flavor, aftertaste, acidity, body, balance,
 uniformity, clean_cup, sweetness, cupper_points, total_cup_points, moisture_percentage,
 category_one_defects, quakers, color, category_two_defects);
