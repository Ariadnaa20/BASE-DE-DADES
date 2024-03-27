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

/*3. A la BD northwind, crea un procediment que donats 2 paràmetres d'entrada (preu i iva)
Retorni preu final per paràmetre de sortida.*/

DELIMITER $$

DROP PROCEDURE IF EXISTS PreuFinal $$

CREATE PROCEDURE PreuFinal(
    IN preu DECIMAL(10,2),
    IN iva DECIMAL(10,2),
    OUT preuFinal DECIMAL(10,2)
)
BEGIN
    SET preuFinal = preu + (preu * (iva / 100));
END $$

DELIMITER ;

CALL preuFinal(100.00, 21.00, @preuFinalOutput); --es @ pq es una variable d'usuaro
SELECT @resultat;


DELIMITER $$


/*4. A la BD World, Crea un procediment que donada una llengua, 
guardi en un fitxer els països que la parlen. */

--no podia exportar les dades directament dins del procediment per enviarles a un fitxer
DELIMITER $$
DROP PROCEDURE IF EXISTS wCountryLanguageInfoToFile $$
CREATE PROCEDURE wCountryLanguageInfo (IN vLanguage varchar(50))
BEGIN
    SELECT co.name INTO OUTFILE 'C:\Users\aripa\Downloads\UF3-baseDades\païsosXllengua.csv'
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
        LINES TERMINATED BY '\n' 
        FROM country AS co, countrylanguage AS cl 
        WHERE co.code = cl.countrycode
            AND cl.language = vLanguage;
END $$
DELIMITER ;

CALL wCountryLanguageInfo('Catalan');



/*5. També a la BD World, modifica l'exercici anterior per fer que el nom del fitxer 
resultant sigui: NOM_LLENGUA.txt on NOM_LLENGUA òbviament s'adapta al valor de a llengua passada per paràmetre, no en text literal.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS wCountryLanguageInfoToFile $$
CREATE PROCEDURE wCountryLanguageInfo (IN vLanguage varchar(50))
BEGIN
    SET @NomFitxer = CONCAT("'C:/Users/aripa/Downloads/UF3-baseDades/païsosX", vLanguage, ".csv'");
    
    SET @Consulta = CONCAT("SELECT co.name INTO OUTFILE ",@NomFitxer, 
        "FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
        LINES TERMINATED BY '\n' 
        FROM country AS co, countrylanguage AS cl 
        WHERE co.code = cl.countrycode
            AND cl.language = vLanguage;"');

    PREPARE stmt FROM @Consulta;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END $$
DELIMITER ;

CALL wCountryLanguageInfo('Catalan');


/*6. A la BD World, donada la id d'un país, mostra per pantalla quants idiomes s'hi parlen així com el número de ciutats que té. 
Aquests dos valors(idiomes i ciutats) també s'han de passar com a paràmetres de sortida */

DELIMITER $$
DROP PROCEDURE IF EXISTS QuantitatIdiomes $$
CREATE PROCEDURE QuantitatIdiomas(IN codiPais CHAR(3), OUT num_idiomes INT, OUT num_ciutats INT)
BEGIN 
    SELECT COUNT(DISTINCT Language)
    INTO numIdiomes
    FROM countrylanguage as cl
    WHERE cl.CountryCode = codiPais;

    SELECT COUNT(*)
    INTO num_ciutats
    FROM city
    WHERE CountryCode = codiPais;

    END$$
DELIMITER ;
    


/*7. A la BD World, crea un procedure que permeti exportar les dades de la taula CountryLanguage. 
El nom del fitxer ha de ser passat per paràmetre a gust de l'usuari.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS export_CountryLanguage $$
CREATE PROCEDURE export_CountryLanguage(IN nom_fitxer)

BEGIN
   SET @NomFitxer = CONCAT("'C:/Users/aripa/Downloads/UF3-baseDades/païsosX ", nom_fitxer, ".csv'");
   SET @Info_CountryLanguage = CONCAT("SELECT * INTO OUTFILE ",@Nom_fitxer, 
        "FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
        LINES TERMINATED BY '\n' 
        FROM countrylanguage "');

   END$$
   DELIMITER ;

CALL () 


/*8. Crea un procedure que faci backup de totes les taules de la BD world  incloent les dades. El nom de les taules noves ha d'incloure "_YYYYMMDD" amb la data del dia actual.*/

DELIMITER $$
DROP PROCEDURE IF EXISTS backup_taules  $$
CREATE PROCEDURE  backup_tables() $$

BEGIN 