BONUS TRACK
--	Selecciona les coleccions amb un nom d’una allargada menor a 10 caràcters.

SELECT Nom_Coleccio FROM Coleccio 
WHERE Nom_Coleccio < 10;   LENGTH(nom_coleccio) > 10; 


--	Retorna la data i hora actuals.

SELECT Data_Entrega  FROM Regal                         tambe SELECT NOW();  SELECT CONCAT('la data d'entrega es: ), NOW();
                                                            SELECT ROUND((100.564), 2)
WHERE CURRENT_DATE(Data_Entrega)

--	Retorna totes les entregues on la seva data sigui en el futur (més gran que l’actual).

SELECT * FROM Entrega 
WHERE Data_Entrega > CURRENT_DATE();

--	Tenim una taula de nom cercles amb i un atribut radi. Calcula per cada un el perímetre de la circumferència (2*Pi*r).

SELECT 2*PI()*radi FROM Cercles;


--	Tenim una taula de productes amb el preu del producte i l’impost a aplicar. Retorna tots els preus amb l’impost corresponent aplicat.

SELECT preu+(preu*impost) FROM productes


--	Retorna elsregals que no tinguis pes assignat.

SELECT * FROM Regals 
WHERE Pes IS NULL;

--	Retorna una llista amb es mails vàlids ( format: NOM@DOMINI.ALGO )

SELECT * mails
WHERE LIKE '_%@_%._%'


--	Retorna les entregues que tinguin entre 50 i 60 pàgines.

SELECT * FROM Entregues 
WHERE pagines BETWEEN 50 AND 60


--	Crea una vista amb el resultat d’un select dels DNI i targeta dels subscriptors associats d’aquest document.

CREATE VIEW targeta_dni AS 
SELECT dni , num_targeta FROM usuari as u, subscriptor as s 
WHERE u.ID_Usuari = s.id_usuari AND s.associat IS TRUE;


SELECT dni, num_targeta
WHERE id_usuari IN (SELECT id_usuari FROM subscriptor WHERE associat= 1);



