--1- Per tal d'identificar els productes que no s'estàn venent gaire i comparar-los amb els que sí que s'estàn venent, necessitem un llistat amb l'informació dels productes dels quals se n'han venut menys de 1000 unitats i també dels que se n'han venut més de 2000.

SELECT ProductID, ProductName, UnitsInStock
FROM Products
WHERE UnitsInStock < 1000 
   OR UnitsInStock > 2000
   OR ProductID IN (
       SELECT ProductID
       FROM OrderDetails
       WHERE Quantity > 0
   );

--2- Volem saber els treballadors que han generat més orders que el treballador número 7.

SELECT EmployeeID, COUNT(*) as TotalOrders
FROM Orders
WHERE EmployeeID <> 7
GROUP BY EmployeeID
HAVING COUNT(*) > (
    SELECT COUNT(*)
    FROM Orders
    WHERE EmployeeID = 7
);

--3- Volem saber si s'han servir més orders amb el shipper "Speedy Express" o amb el shipper "Federal Shipping".
SELECT ShipVia, COUNT(*) AS NumeroOrdres
FROM Orders
WHERE ShipVia = 'Speedy Express' OR ShipVia = 'Federal Shipping'
GROUP BY ShipVia;


--4- Les orders amb més de productes diferents.

SELECT OrderID, UniqueProducts
FROM (
    SELECT OrderID, COUNT(DISTINCT ProductID) as UniqueProducts
    FROM OrderDetails
    GROUP BY OrderID
) AS OrdresProductesDiferents
WHERE UniqueProducts > 5; 


--5- Els empleats amb menys orders procesades.
SELECT EmployeeID, COUNT(*) AS NumeroOrdres
FROM Orders
GROUP BY EmployeeID
HAVING COUNT(*) = (
    SELECT MIN(NumOrdres)
    FROM ( SELECT COUNT(*) AS NumOrdres
        FROM Orders
        GROUP BY EmployeeID
    ) AS MenysOrders
);

--6- Lesorders amb clients de New York y/o Suppliers de New York.
SELECT OrderID, CustomerID, OrderDate
FROM Orders
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Customers
    WHERE City = 'New York'
) OR OrderID IN (
    SELECT OrderID
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
    WHERE Suppliers.City = 'New York'
);


--7- La categoria amb més i la categoria amb menys productes.

SELECT CategoryName, COUNT(ProductID) AS NumberOfProducts
FROM Categories JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryID, CategoryName
HAVING COUNT(ProductID) = ALL (
    SELECT COUNT(ProductID)
    FROM Products
    GROUP BY CategoryID
    ORDER BY COUNT(ProductID) DESC
    LIMIT 1
) OR COUNT(ProductID) = ALL (
    SELECT COUNT(ProductID)
    FROM Products
    GROUP BY CategoryID
    ORDER BY COUNT(ProductID) ASC
    LIMIT 1
);

--8- Busca quines son els territoris dels empleats que han estudiat psicologia (es pot fer sense subconsultes).



--9- Busca els productes de preu inferior a 15 i que pertànyen a la categoria que té el màxim de productes.

--10- Conta quantes ordres diferents existeixen sobre productes amb el màxim de descompte.

--11- Dona el nom dels productes que pertànyen a la categoria del qual el promig del preu dels seus productes és superior a 50.

--12- Retorna el nom de l'empleat que ha fet més orders de tots.

SELECT FirstName, LastName
FROM Employees
WHERE EmployeeID = (
    SELECT EmployeeID
    FROM Orders
    GROUP BY EmployeeID
    ORDER BY COUNT(OrderID) DESC
    LIMIT 1
);
