/*
EXERCICI 2:
Useu la base de dades mymovies.
Creeu un procedure nou que mostri per pantalla el títol i l'any de creació de totes les pel·lícules que en el seu títol de la pel·lícula continguin
el text passat per paràmetre.

El seu call per exemple podria ser: CALL getMoviesByName('Superman');

Amb aquestes pistes, ja sabeu com s'ha de dir el procedure i quins tipus de paràmetres ha de tenir.*/

DELIMITER $$

CREATE PROCEDURE getMoviesByName (IN titol VARCHAR(100))
BEGIN
   SELECT m.name, m.year FROM Movies as m 
   WHERE m.name LIKE CONCAT('%', titol,  '%'); /*si fessim aixi '%titol%' esta malament ja q buscaria la paraula titol en lloc del contingut 
                                               de la variable per aixo hem de fer CONCAT*/
END $$

DELIMITER ;


