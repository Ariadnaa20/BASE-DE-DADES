-- 1. Fes una query(fer un select) en SQL que mostri totes les columnes de tots els productes per pantalla. És a dir retorna totes les columnes i totes les files de la taula Products.

SELECT * FROM Products   -- que vull i on esta

-- 2. Mostra només la columna descripció de la taula Categories.

SELECT `Description` FROM Categories --aixo es per les paraules reservades

-- 3. Retorna la informació de tots els clients per pantalla usant la taula Customers.

SELECT * FROM Customers   -- el que et mostri tot 

-- 4. Mostra ara les columnes CategoryName i Description de la taula Categories.

SELECT CategoryName, `Description` FROM Categories

-- 5. Mostra ara només la columna descripció de la taula Categories i només per la fila on CategoryName = “Grains/Cereals”.

SELECT Description FROM Categories WHERE CategoryName = 'Grains/Cereals'  --fer filtres. el = pot subtirtuirse per LIKE

-- 6. Desenvolupa una consulta que retorni tota la informació relativa a tots els productes de la taula Products que tenen categoria = 1.

SELECT * FROM Products WHERE CategoryID = 1   -- nomes un producte no tot lo de la fila 

-- 7. Retorna el ProductID del producte que té “FiloMix” per nom.

SELECT ProductID FROM Products WHERE ProductName = 'FiloMix'

-- 8. Mostra tota la info de tots els productes del SupplierID número 3. Usa la taula Products.

SELECT * FROM Products WHERE SupplierID = 3

-- 9. Retorna tots els productes de la categoria 2 que tenen un preu > 20.

SELECT * FROM Products WHERE CategoryID = 2 AND UnitPrice > 20

-- 10. Fes una query que retorni les dades de tots els clients alemanys.

SELECT * FROM Customers WHERE Country = 'Germany'

-- 11.Retorna el nom i la data de naixement de l’empleat Steven Buchanan usant la taula Employees.

SELECT FirstName, LastName, BirthDate FROM Employees WHERE FirstName = 'Steven' AND LastName = 'Buchanan'

-- 12.Volem un llistat dels noms de tots els proveïdors japonesos. Usa la taula Suppliers.

SELECT CompanyName FROM Suppliers WHERE Country = 'Japan'

--13.Volem ara un llistat de les persones de contacte dels proveïdors britànics i el seu telèfon. Usa la taula Suppliers.

SELECT ContactName FROM Suppliers WHERE Country = "UK" -- que vull on esta i amb quins filtres. 
                                              -- !=   si es diferent 
                                              -- NOT LIKE "%UK"

--14.Troba el nom de l’empresa d’enviaments que té el telèfon = (503) 555-3199. Usa  la taula Shippers.
SELECT CompanyName FROM Shippers WHERE Phone = "(503) 555-3199" -- en cometes quan es lletra


--15.Mostra el preu i el pes del ProductID = 69.
SELECT UnitPrice, QuantityPerUnit FROM Products WHERE ProductID= '69'


--16.Retorna un llistat de tota la informació de tots els clients ordenats pel país de procedència alfabèticament.
SELECT * FROM Customers ORDER BY Country ASC;


--17.Fes el recompte de quants productes hi ha de la categoria 2 que tenen un preu > 20.
SELECT COUNT (ProductID) FROM Products 
   WHERE categoryID = 2 AND UnitPrice > 20;

--18.Fes una query que retorni la xifra del producte més car de la taula Products.

SELECT MAX(UnitPrice) FROM Products;

--19.Retorna el preu mig de la taula Products.
SELECT AVG(UnitPrice) AS PrecioMedio FROM Products;

--20.Mostra la data de la primera l’ordre creada. Usa la taula Orders.
SELECT MIN(OrderDate)  FROM Orders;

--21.Mostra el preu de la Order 10255 (Price x quantitat de tots els productes).
SELECT SUM(UnitPrice * Quantity) AS PrecioOrder10255 FROM OrderDetails WHERE OrderID = 10255;

SELECT COUNT(ProductID), OrderID
       FROM OrderDetails 
       GROUP BY OrderID


--22.Mostra el numero de productes de cada Order. group by + having sempre. ja que hem de agrupar primer i despres  contar.
SELECT COUNT(ProductID), OrderID FROM OrderDetails
       GROUP BY OrderID 
       HAVING COUNT(ProductID) > 3;



--23.Mostra el numero de productes de cada Order sempre que siguin mes de 3.
SELECT OrderID, COUNT(*) AS NumeroProductos FROM OrderDetails GROUP BY OrderID HAVING COUNT(*) > 3;


--24.Mostra els suppliers de les Ciutats que comencen per B que tenen productes amb un preu major a 50.
SELECT DISTINCT SupplierID, CompanyName, City FROM Suppliers WHERE City LIKE 'B%' AND SupplierID IN (SELECT SupplierID FROM Products WHERE UnitPrice > 50);


--25.Mostra els clients d’un país amb més de 7 lletres.
SELECT * FROM Customers WHERE LENGTH(Country) > 7;

--26.Mostra les ordres d’avui.
SELECT * FROM Orders WHERE OrderDate = CURDATE();

--27.Mostra les ordres de febrer del 1997 del empleat 2.
SELECT * FROM Orders WHERE MONTH(OrderDate) = 2 AND YEAR(OrderDate) = 1997 AND EmployeeID = 2;


--28.Mostra la mitja de ordres per any.
SELECT YEAR(OrderDate) AS Ano, AVG(OrderID) AS MediaOrdenes FROM Orders GROUP BY YEAR(OrderDate);


--29.Mostra el seu preu del producte més barat i el més car (2 Selects separats). UNION per unir resultats
SELECT MIN(UnitPrice) FROM Products;
SELECT MAX(UnitPrice) FROM Products;

--30.Les ID’s de les Ordres de 4 productes diferents o més indicant també el nom del client.
SELECT OrderID, COUNT(DISTINCT ProductID) AS ProductosDiferentes, CustomerID FROM OrderDetails GROUP BY OrderID HAVING ProductosDiferentes >= 4;

--31.Mostra l’ordre amb més quantitat de productes.
SELECT OrderID, SUM(Quantity) AS CantidadProductos FROM OrderDetails GROUP BY OrderID ORDER BY CantidadProductos DESC LIMIT 1;

--32.Mostra l’empleat més gran i el més petit (2 Selects separats).
SELECT * FROM Employees ORDER BY BirthDate DESC LIMIT 1; -- El mes gran
SELECT * FROM Employees ORDER BY BirthDate ASC LIMIT 1;  -- El mes petit

--33.Retorna l’adreça, ciutat, codi postal i país de tots els clients (tot junts amb un camp)
SELECT CONCAT(Address, ', ', City, ', ', PostalCode, ', ', Country) AS Direccion


-- MINUS: son els valors unics de A.

