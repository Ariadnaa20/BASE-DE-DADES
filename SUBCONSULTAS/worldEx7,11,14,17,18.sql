
--7- Mostra els idiomes que es parlen en el país amb més superfície de terreny. (subquery)

SELECT COUNT(DISTINCT cl.Language)
FROM CountryLanguage as cl
JOIN Country as c ON cl.CountryCode = c.Code
WHERE c.SurfaceArea = (
    SELECT MAX(c2.SurfaceArea)
    FROM Country as c2
);



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

--14- La suma de població per continent (group by).

SELECT c1.Continent, 
       (SELECT SUM(c2.Population) 
        FROM Country c2 
        WHERE c2.Continent = c1.Continent) as TotalPoblacio
FROM Country as c1
GROUP BY c1.Continent;




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