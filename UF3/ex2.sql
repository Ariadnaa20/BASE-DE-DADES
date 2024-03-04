CREATE DATABASE Champions;
USE Champions;

CREATE TABLE Characters (
    id INT,
    Name VARCHAR(70), 
    Class VARCHAR(20),
    Style INT,
    Difficulty INT,
    DamageType VARCHAR(2),
    Damage INT,
    Sturdiness INT,
    CrowdControl INT,
    Mobility INT,
    Functionality INT,
    PRIMARY KEY(id)
);

LOAD DATA INFILE 'C:\\Users\\aripa\\Downloads\\UF3-baseDades\\LoL-Champions-con-cabezera.csv'
INTO TABLE Characters
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES --ignorar la cabezera

