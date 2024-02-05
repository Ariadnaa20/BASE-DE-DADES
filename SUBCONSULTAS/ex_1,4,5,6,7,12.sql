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



