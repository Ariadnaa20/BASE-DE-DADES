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





/*5. També a la BD World, modifica l'exercici anterior per fer que el nom del fitxer 
resultant sigui: NOM_LLENGUA.txt on NOM_LLENGUA òbviament s'adapta al valor de a llengua passada per paràmetre, no en text literal.*/

/*6. A la BD World, donada la id d'un país, mostra per pantalla quants idiomes s'hi parlen així com el número de ciutats que té. 
Aquests dos valors també s'han de passar com a paràmetres de sortida */

/*7. A la BD World, crea un procedure que permeti exportar les dades de la taula CountryLanguage. 
El nom del fitxer ha de ser passat per paràmetre a gust de l'usuari.*/

/*8. Crea un procedure que faci backup de totes les taules de la BD world 
incloent les dades. El nom de les taules noves ha d'incloure "_YYYYMMDD" amb la data del dia actual.*/

/*9. Usant PL/SQL desenvolupeu una calculadora usant CASE i IF.

En una base de dades qualsevol, crear un procedure amb 4 paràmetres de tipus FLOAT: (IN pNum1, IN pNum2, IN pOperacio, OUT pResultat).

Segons el valor de la pOperacio (+, -, *, /) el procedure farà una acció o una altra i retornarà la variable resultat.

Heu d'evitar que el programa falli al fer una divisió per 0.

Entrega:

Entregueu el codi complet de la calculadora en un fitxer: CognomNom_Calc.sql
Entregueu un altre fitxer .sql amb un CALL d'exemple: CognomNom_CallCalc.sql.*/

/*10. Exercicis de loops i for's: A la BD northwind, fer un bucle que recorri tota la taula Categories i busqui si hi ha una categoria de nom "Seafood". (fer servir la BBDD Northwind) fer sense cursors)

Passos marcats:

     a) Fer loop de 1 a 10 o amb núm total de categories
     b) Buscar nom categoria on l'id = contador de loop
     c) Verificar si la la categoria = seafood
     d) En cas afirmatiu, mostrar missatge, sinó seguir buscant*/