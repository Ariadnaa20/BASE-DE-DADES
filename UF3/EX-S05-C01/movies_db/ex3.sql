/*
EXERCICI 3:
Useu la base de dades mymovies.
Creeu un procedure nou que permeti a l'usuari calcular els beneficis d'una pel·lícula en concret especificant el seu id de pel·lícula.
Els beneficis de les pel·lícules es calculen multiplicant la columna stockUnits * price.
Els beneficis de la peli s'han de guardar en una variable de sortida.
Aquest procedure només té un paràmetre.

El seu call per exemple podria ser:

DECLARE X FLOAT;
SET X = 36;
CALL calculateRevenue(X);
SELECT X;

Amb aquestes pistes, ja sabeu com s'ha de dir el procedure i quins tipus de paràmetres ha de tenir.
*/
DELIMITER $$
CREATE PROCEDURE calculateRevenue (INOUT var FLOAT)
BEGIN
   SELECT SUM(m.stockUnits*m.price) INTO var
   FROM Movies as m
   WHERE m.id = id 
END $$

DELIMITER ;

SET  @aux=46; --declarem variable per que aixi guardi els valors del procediment OUT
CALL calculateRevenue(@aux) --cridem procediment amb valors. El 1 es el id i el 2 es on guardara el resultat del procediment
SELECT @aux as Revenue; --per recuperar el valor de la variable 

