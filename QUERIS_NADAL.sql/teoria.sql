1. ALIAS Serveix per aclaranos en lloc del angles doncs en catala per exemple es per posar noms mes facils les columnes 

Li estem dient que FirstName serà nom i LastName cognom
SELECT FirstName AS Nombre, LastName AS Apellido FROM Employees

*Solo puedo poner alias cuando defino las columnas particulares en el SELECT, no puedo poner alias si hay un *. 

2. ORDER BY  Ens dona filtres per ordenar les respostes de les queris. Per exemple volem ordenar els productes de barato a car
SELECT * FROM Products
ORDER BY Price ASC;

si hay NULLS se ordenan NULLS LAST O NULLS FIRST



- ELEMENTO AUXILIAR
DISTINCT es para seleccionar los valores unicos o millor dit eliminar els repetits (agafa la primera opcio)

SELECT DISTINCT ProductName 
FROM Products
ORDER BY ProductName DESC; o tambe ORDER BY RANDOM(); que es aleatori


3. CONDICIONS: WHERE 

SELECT *
FROM Customers
WHERE Country = 'Spain'
ORDER BY ContactName ASC;

SELECT * FROM Products
WHERE ProductName = 'Chais'

  operadors de comparacio= 
SELECT ProductName FROM Products
WHERE ProductID = 14;  // tofu

SELECT * FROM Products
WHERE Price <= 40 ;

  operadors AND, OR, NOT

SELECT * FROM Products
WHERE Price >= 50 AND Price <= 55;  dentro del rango

SELECT * FROM Employees
WHERE FirstName = 'Nancy' OR FirstName= 'Anne';   una o otra

estos operadores se pueden combinar, 
SELECT* FROM Products
WHERE (Price< 20 OR CategoryID= '8') AND SupplierID = '7'  // si o si ha de cumplir la 7 

SELECT * FROM Products
WHERE NOT Price >= 50 // que no cumpla la conidicion, en este caso devuelve precios menores

SELECT * FROM Customers
WHERE NOT Country = 'USA' AND NOT Country ='Italy'

  operador LIMIT
normalment es posa al final de la sentencia i serveix per limitar la cantitat de resultats que volem obtenir.

SELECT * FROM Products
WHERE NOT CategoryID= 6
AND NOT SupplierID =1
AND Price < 20
ORDER BY RANDOM()
LIMIT 5

   operador DISTINTO DE != es diferente a NOT

   operador BETWEEN

SELECT * FROM Products WHERE Price BETWEEN 20 AND 40 AND CategoryID = 6;
SELECT * FROM Products WHERE Price BETWEEN 20 AND 40 OR  CategoryID = 6;
SELECT * FROM Employees WHERE BirthDate BETWEEN "1960-0-1" AND "1970-0-1";

  operador LIKE
  es per especificar al final es mes o menys el mateix que = pero diferent ja que te comodins


GROUP BY I FUNCIONES DE AGREGACIÓN
el group by ens ajuda a agrupar dades, resumirles i fins i tot fer estadistiques, prmedios, registros, contar toda la tabla...

- funciones de agregacion 
estructura:
SELECT funcion() FROM ..
SELECT COUNT(FirstName) AS Cantitat_de_noms FROM Employees;  // 10 nombres valores de una columna

SELECT SUM(Price) AS Suma_total_precio FROM Products;  //sumar tots els valors d  un camp

SELECT ROUND(AVG(Price), 2) AS Media_total_precio FROM Products;  //mitja de  tots els valors d un camp i me lo redondee
                   es una funcion dentro de otra i el 2 seria redondear 2 decimales

SELECT ProductName, MIN(Price) precio_minimo FROM Products;         // valor minimo      
WHERE ProductName  IS NOT NULL    

SELECT MAX(Price) AS precio_maximo FROM Products;  //valor maximo


SELECT SupplierID, ROUND(AVG(Price)) as promedio FROM Products
GROUP BY SupplierID
ORDER BY promedio DESC