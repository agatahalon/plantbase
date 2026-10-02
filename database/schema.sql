CREATE TABLE plants (
    id INTEGER PRIMARY KEY,
    common_name VARCHAR(200) NOT NULL,
    latin_name VARCHAR(200) NOT NULL,
    family VARCHAR(100),
    found_in_poland BOOLEAN DEFAULT FALSE,
    plant_description TEXT,
    is_toxic BOOLEAN DEFAULT FALSE,
    toxicity_notes TEXT
);
CREATE TABLE growing_conditions (
    id INTEGER PRIMARY KEY,
    plant_id INTEGER NOT NULL,
    sunlight VARCHAR(50),
    soil_type VARCHAR(50),
    bloom_start_month INTEGER,
    bloom_end_month INTEGER,
    harvest_start_month INTEGER,
    harvest_end_month INTEGER,
    notes TEXT,
    FOREIGN KEY (plant_id) REFERENCES plants(id)
);
CREATE TABLE uses (
    id INTEGER PRIMARY KEY,
    use_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE plant_uses (
    plant_id INTEGER NOT NULL,
    use_id INTEGER NOT NULL,
    notes TEXT,
    PRIMARY KEY (plant_id, use_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id),
    FOREIGN KEY (use_id) REFERENCES uses(id)
);
/*fictional herbal shop's business data, since 2020*/
CREATE TABLE sales (
    id INTEGER PRIMARY KEY,
    plant_id INTEGER NOT NULL,
    sale_date TEXT NOT NULL,
    quantity_sold INTEGER NOT NULL,
    price_per_package NUMERIC(10, 2),
    FOREIGN KEY (plant_id) REFERENCES plants(id)
);