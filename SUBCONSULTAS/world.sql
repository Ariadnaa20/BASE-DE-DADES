
--1- Mostra totes les regions del planeta i el nombre d'idiomes que es parlen a cada una d'elles ordenat alfabèticament pel nom de la regió. (group by i join)
SELECT c.Region, COUNT(cl.Language) as Num_Idiomes 
FROM Country as c JOIN CountryLanguage as cl
ON c.Code= cl.CountryCode
GROUP BY c.Region  /*per algo*/
ORDER BY c.Region ASC ;


--2- Mostrar el districte de la ciutat amb més població. (subquery) /*el que mes o el que menys sempre amb subquery*/
SELECT c1.District, c1.Name FROM City as c1
WHERE c1.Population= (SELECT MAX(c2.Population) FROM City as c2)

--3- Mostrar codi, nom i continent del país de mida més petita. (subquery)

SELECT c1.Code, c1.Name, c1.Continent FROM Country as c1
WHERE c1.SurfaceArea= (SELECT MIN(c2.SurfaceArea) FROM Country as c2 ) /*si es un igual (=) sera subconsulta simple i*/

--4- Calcula l'idioma més parlat a cada país. Mostra nom de país i idioma ordenat per país i idioma. (group by i join entre countrylanguage i country)

SELECT c.Name, cl.Language FROM Country as c JOIN countrylanguage as cl
ON c.Code = cl.CountryCode AND
WHERE cl.Percentage = 
(SELECT MAX(cl2.Language) FROM CountryLanguage as cl2 WHERE c2.CountryCode=cl.CountryCode )
GROUP BY c.Name, cl.Language
ORDER BY c.name, cl.Language


--5- Mostra el nom del país on hi ha la ciutat amb menys població. (subquery) /*em torna 5*/

SELECT c.Name FROM Country as c, city AS ci WHERE c.code =ci.CountryCode 
AND ci.population = (SELECT MIN(ci2.Population) FROM Country as ci2)

SELECT c.name FROM country as c, city as ci WHERE c.code = ci.CountryCode 
AND ci.population <= ALL (SELECT ci2.population FROM city as ci2)


--6- Mostra el nom (o noms) del país (o països) on es parlen el més idiomes. (group by per tal de contar el nombre d'idiomes diferents que es parlen per país i subquery per trobar el nom del país)



--7- Mostra els idiomes que es parlen en el país amb més superfície de terreny. (subquery)

--8- Mostra el districte de ciutat on es parlen més idiomes. (subquery)

--9- Mostra el nom del país (o països) on es parlen més idiomes oficials. (subquery i join)

--10- Mostra el nom de totes les ciutats del país (o països) que es va independitzar fa més temps. (subquery)

--11- El districte amb més ciutats (subquery)

--12- Els paisos on totes les seves ciutats (de la nostra BBDD) tinguin mes de 200.000 habitants.

--13- Totes les ciutats del Carib (tot i que e spot fer sense subconsulta, pensa una forma de fer-ho amb subquerys).

--14- La suma de població per continent (group by).

--15- La ciutat més gran d'Europa.

--16- El continent amb més població i el seu número.

--17- El continent amb més ciutats  i el seu número.

--18- La regió amb un AVG d'habitants per país més gran.