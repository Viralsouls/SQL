CREATE TABLE country (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE processing_method (
    id INT AUTO_INCREMENT PRIMARY KEY,
    method VARCHAR(100) NOT NULL
);

CREATE TABLE variety (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE farm (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    owner VARCHAR(100),
    region VARCHAR(100),
    altitude VARCHAR(100),
    company VARCHAR(100),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE coffee_sample (
    id INT AUTO_INCREMENT PRIMARY KEY,
    species VARCHAR(50),
    color VARCHAR(50),
    farm_id INT,
    processing_method_id INT,
    variety_id INT,
    FOREIGN KEY (farm_id) REFERENCES farm(id),
    FOREIGN KEY (processing_method_id) REFERENCES processing_method(id),
    FOREIGN KEY (variety_id) REFERENCES variety(id)
);

CREATE TABLE tasting_score (
    id INT AUTO_INCREMENT PRIMARY KEY,
    coffee_sample_id INT,
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
    FOREIGN KEY (coffee_sample_id) REFERENCES coffee_sample(id)
);

CREATE TABLE defect (
    id INT AUTO_INCREMENT PRIMARY KEY,
    coffee_sample_id INT,
    category_one_defects INT,
    quakers INT,
    FOREIGN KEY (coffee_sample_id) REFERENCES coffee_sample(id)
);
