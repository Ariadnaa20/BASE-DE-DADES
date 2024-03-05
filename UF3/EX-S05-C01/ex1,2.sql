/*1. Dins de la base dades world, crea un procedure que permeti inserir 
dades noves dins de la taula City.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS InserirCiutat $$

CREATE PROCEDURE InserirCiutat(
    IN Name VARCHAR(35),
    IN CountryCode CHAR(3),
    IN District VARCHAR(20),
    IN Population INT
)
BEGIN
    INSERT INTO City (Name, CountryCode, District, Population)
    VALUES (Name, CountryCode, District, Population);
END $$

DELIMITER ;

CALL InserirCiutat('NewCity', 'BHR', 'NewDistrict', 100000); --cuidado amb las FK, els camps ja han d'exisitir 

SELECT co.name FROM City as c, Country as co WHERE c.CountryCode=co.Code AND c.CountryCode='BHR'

/*2. A la BD World, crea un procediment que donada una ciutat, 
retorni el recompte dels seus habitants per pantalla juntament amb el seu pais.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS RecompteHabitantsCiutat $$

CREATE PROCEDURE RecompteHabitantsCiutat(
    IN NomCiutat VARCHAR(35)
)
BEGIN
    SELECT c.Name AS CityName, co.Name AS CountryName, c.Population
    FROM City as c 
    JOIN Country as co ON c.CountryCode = co.Code
    WHERE c.Name = NomCiutat;
END $$

DELIMITER ;

CALL RecompteHabitantsCiutat('Toledo');