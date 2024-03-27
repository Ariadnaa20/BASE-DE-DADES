/*
EXERCICI 1:
Useu la base de dades mymovies.
Creeu un procedure nou que mostri per pantalla el títol i l'any de creació de totes les pel·lícules que hàgin estat
creades dins d'un període d'anys especificat per l'usuari i ordenades per data de creació i títol de la pel·lícula.

El seu call per exemple podria ser: CALL getMoviesByYear(1986,2001);

Amb aquestes pistes, ja sabeu com s'ha de dir el procedure i quins tipus de paràmetres ha de tenir.*/

DELIMITER $$
CREATE PROCEDURE 'getMoviesByYear' (IN startYear INT, IN endYear INT)
BEGIN
    SELECT s.name, s.year FROM movies as s
    WHERE s.year BETWEEN startYear AND  endYear;
    ORDER BY s.year, title;
END $$
DELIMITER ;

CALL getMoviesByYear(1986,2001);
