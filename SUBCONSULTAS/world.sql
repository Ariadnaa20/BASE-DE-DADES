
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
AND ci.population = (SELECT MI9N(ci2.Population) FROM Country as ci2)

SELECT c.name FROM country as c, city as ci WHERE c.code = ci.CountryCode 
AND ci.population <= ALL (SELECT ci2.population FROM city as ci2);


--6- Mostra el nom (o noms) del país (o països) on es parlen el més idiomes. (group by per tal de contar el nombre d'idiomes diferents que es parlen per país i subquery per trobar el nom del país)


SELECT c.Name FROM Country c
JOIN CountryLanguage cl ON c.Code = cl.CountryCode
GROUP BY c.Code, c.Name
HAVING COUNT(DISTINCT cl.Language) 

/*acabarla*/


--7- Mostra els idiomes que es parlen en el país amb més superfície de terreny. (subquery)

SELECT COUNT(DISTINCT(cl.Language)) FROM CountryLanguage as cl 
JOIN Country as c 
ON cl.CountryCode = c.Code 
WHERE c.SurfaceArea =  (SELECT MAX(c2.SurfaceArea) FROM Country as c2);

--8- Mostra el districte de ciutat on es parlen més idiomes. (subquery)

SELECT c.district FROM City as c
JOIN CountryLanguage as cl ON c.CountryCode = cl.CountryCode
WHERE cl.Language = 
( SELECT Language FROM CountryLanguage as cl2
    GROUP BY Language
    ORDER BY COUNT(DISTINCT CountryCode) DESC
    LIMIT 1
);

--9- Mostra el nom del país (o països) on es parlen més idiomes oficials. (subquery i join)

SELECT c.Name FROM Country as c JOIN CountryLanguage as cl
WHERE cl.Language =  
   (SELECT CountryCode, COUNT(Language) AS OfficialLanguageCount
    FROM CountryLanguage
    WHERE IsOfficial = 'T'
    GROUP BY CountryCode)

--10- Mostra el nom de totes les ciutats del país (o països) que es va independitzar fa més temps. (subquery)
SELECT Name FROM City as ci JOIN Country as c 
ON ci.CountryCode = c.Code
WHERE  c.IndepYear =  
       (SELECT MIN(IndepYear) FROM Country);

--11- El districte amb més ciutats (subquery)

SELECT District
FROM City
WHERE District = (
    SELECT District
    FROM City
    GROUP BY District
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

--12- Els paisos on totes les seves ciutats (de la nostra BBDD) tinguin mes de 200.000 habitants.

SELECT DISTINCT c.Name
FROM Country as c
WHERE 200000 > ALL (
    SELECT Population
    FROM City
    WHERE CountryCode = c.Code
);


--13- Totes les ciutats del Carib (tot i que e spot fer sense subconsulta, pensa una forma de fer-ho amb subquerys).

SELECT ci.Name FROM City AS ci
JOIN Country AS c ON c.Code = ci.CountryCode
WHERE c.Code IN (
    SELECT c2.Code
    FROM Country AS c2
    WHERE c2.Region = 'Caribbean'
);


--14- La suma de població per continent (group by).

SELECT c.Continent, SUM(Population) as TotalPopulation
FROM Country as c
GROUP BY c.Continent;



--15- La ciutat més gran d'Europa.

SELECT ci.Name
FROM City as ci
WHERE Population = (
    SELECT MAX(Population)
    FROM City as ci2
    WHERE CountryCode IN (  --obte els codis dels country de europa i a la externa comprova quin el el codi que te mas població
        SELECT c.Code
        FROM Country as c
        WHERE Continent = 'Europe'
    )
);



--16- El continent amb més població i el seu número. 

SELECT c1.Continent, SUM(c1.Population) as TotalPoblacio
FROM Country as c1
GROUP BY c1.Continent
HAVING SUM(c1.Population) = (SELECT SUM(c2.Population)
    FROM Country c2
    GROUP BY c2.Continent
    ORDER BY SUM(c2.Population)
    LIMIT 1)
ORDER BY TotalPoblacio;

--17- El continent amb més ciutats  i el seu número. lo mismo pero con count

SELECT c1.Continent, COUNT(ci1.Name) as NumeroCiutats
FROM Country as c1
JOIN City as ci1 ON c1.Code = ci1.CountryCode
GROUP BY c1.Continent
HAVING COUNT(ci1.Name) = (SELECT COUNT(ci2.Name)
    FROM Country c2
    JOIN City ci2 ON c2.Code = ci2.CountryCode
    GROUP BY c2.Continent
    ORDER BY COUNT(ci2.Name)DESC
    LIMIT 1)
ORDER BY NumeroCiutats DESC;


--18- La regió amb un AVG d'habitants per país més gran. lo mismo con el AVG

SELECT c1.Region, AVG(c1.Population) as HabitantsPais
FROM Country as c1
GROUP BY c1.Region
HAVING AVG(c1.Population) = (SELECT AVG(c2.Population)
    FROM Country c2
    GROUP BY c2.Region
    ORDER BY AVG(c2.Population) DESC
    LIMIT 1)
ORDER BY HabitantsPais DESC;