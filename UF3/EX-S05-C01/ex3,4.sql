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
SELECT @preuFinalOutput;


DELIMITER $$


/*4. A la BD World, Crea un procediment que donada una llengua, 
guardi en un fitxer els països que la parlen. */

--no podia exportar les dades directament dins del procediment per enviarles a un fitxer
DELIMITER $$

CREATE PROCEDURE `ObtenerPaisesxIdioma`(IN `idioma` VARCHAR(50))
BEGIN
    SELECT c.Name
    INTO OUTFILE 'C:\Users\aripa\Downloads\UF3-baseDades\païsosXllengua.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    FROM CountryLanguage as cl
    JOIN Country as c ON cl.CountryCode = c.Code
    WHERE cl.Language = 'Spanish' AND cl.IsOfficial = 'T';
END$$

DELIMITER ;

CALL ObtenerPaisesxIdioma('Spanish');

--Una altra manera

 DELIMITER $$
CREATE PROCEDURE `ObtenerPaisesPorIdioma`(IN `idioma` VARCHAR(50))
BEGIN
    SELECT Country.Name AS Pais
    FROM CountryLanguage
    JOIN Country ON CountryLanguage.CountryCode = Country.Code
    WHERE CountryLanguage.Language = idioma AND CountryLanguage.IsOfficial = 'T';
END$$

DELIMITER ;

SELECT c.Name
INTO OUTFILE 'C:\Users\aripa\Downloads\UF3-baseDades\païsosXllengua.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM CountryLanguage as cl
JOIN Country as c ON cl.CountryCode = c.Code
WHERE cl.Language = 'Spanish' AND cl.IsOfficial = 'T';

