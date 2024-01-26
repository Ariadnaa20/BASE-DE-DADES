1-33
--1. Fes una query en SQL que mostri totes les columnes de tots els productes per pantalla. És a dir retorna totes les columnes i totes les files de la taula Products.
SELECT * FROM Products;

--2. Mostra només la columna descripció de la taula Categories.
SELECT Descripcion FROM Categories;

--3. Retorna la informació de tots els clients per pantalla usant la taula Customers.
SELECT * FROM Customers;

--4. Mostra ara les columnes CategoryName i Description de la taula Categories.
SELECT CategoryName, Description FROM Categories

--5. Mostra ara només la columna descripció de la taula Categories i només per la fila on CategoryName = “Grains/Cereals”.
SELECT Description FROM Categories 
WHERE CategoryName = 'Grains/Cereals';

--6. Desenvolupa una consulta que retorni tota la informació relativa a tots els productes de la taula Products que tenen categoria = 1.
SELECT * FROM Products 
WHERE CategoryID = 1;

--7. Retorna el ProductID del producte que té “Filo Mix” per nom.
SELECT ProductID FROM Products 
WHERE ProductName = 'Filo Mix';

--8. Mostra tota la info de tots els productes del SupplierID número 3. Usa la taula Products.
SELECT * FROM Products 
WHERE SupplierID= 3;

--9. Retorna tots els productes de la categoria 2 que tenen un preu > 20.
SELECT * FROM Products 
WHERE CategoryID = 2 AND Price > 20;

--10.Fes una query que retorni les dades de tots els clients alemanys.
SELECT * FROM Customers 
WHERE Country = 'Germany';

--11.Retorna el nom i la data de naixement de l’empleat Steven Buchanan usant la taula Employees.
SELECT FirstName AS Nombre, BirthDate AS Cumpleaños FROM Employees 
WHERE FirstName = 'Steven' AND LastName = 'Buchanan';


--12.Volem un llistat dels noms de tots els proveïdors japonesos. Usa la taula Suppliers.

SELECT SupplierName AS Nombre FROM Suppliers
WHERE Country= 'Japan';

--13.Volem ara un llistat de les persones de contacte dels proveïdors britànics i el seu telèfon. Usa la taula Suppliers.

SELECT ContactName AS Nombre_contacto, Phone AS Telefono FROM Suppliers
WHERE Country = 'USA'

--14.Troba el nom de l’empresa d’enviaments que té el telèfon = (503) 555-3199. Usa la taula Shippers.
SELECT * FROM Shippers
WHERE ShipperName = '(503) 555-3199 '; 

--15.Mostra el preu i el pes del ProductID = 69
SELECT Price AS Preu, Unit AS Pes FROM Products
WHERE ProductID = 69;

--16.Retorna un llistat de tota la informació de tots els clients ordenats pel país de procedència alfabèticament.

SELECT * FROM Customers 
WHERE 
ORDER BY Country ASC;

--16.2 Retorna un llistat de tota la informació de tots els clients ordenats pel país de procedència alfabèticament i ha ha de ser del 1-10.

SELECT * FROM Customers 
WHERE CustomerID BETWEEN 1 AND 10
ORDER BY Country ASC;

--17.Fes el recompte de quants productes hi ha de la categoria 2 que tenen un preu > 20.

SELECT COUNT(ProductId) FROM Products 
  WHERE categoryID = 2 AND UnitPrice > 20;

MAL: SELECT COUNT(ProductName) FROM Products
GROUP BY CategoryID= 2
LIKE Price > 20

// no t esta dient que els agrupis nomes que el recompte amb condicio de categoria 2 i preu mes gran a 20

--18.Fes una query que retorni la xifra del producte més car de la taula Products.

SELECT ProductName, MAX(Price) FROM Products

SELECT UnitPrice FROM Products 
  ORDER BY UnitPrice DESC LIMIT 1;


--19.Retorna el preu mig de la taula Products.
SELECT AVG(Price) as Precio_Medio FROM Products;

--20.Mostra la data de la primera l’ordre creada. Usa la taula Orders.

SELECT MIN(OrderDate) as fecha_antigua FROM Orders;

--21.Mostra el preu de la Order 10255 (Price x quantitat de tots els productes).
SELECT SUM(UnitPrice * Quantity) FROM OrderDetails
WHERE OrderID= 10255;

--22.Mostra el numero de productes de cada Order.
MAL:
SELECT OrderID, COUNT(ProductID) FROM Products, Orders
GROUP BY OrderID

SELECT COUNT(ProductID), OrderID FROM OrderDetails
GROUP BY OrderID;

--23.Mostra el numero de productes de cada Order sempre que siguin mes de 3.
SELECT OrderID, COUNT(ProductID) FROM OrderDetails
GROUP BY OrderID
HAVING COUNT(ProductID) > 3;

--24.Mostra els suppliers de les Ciutats que comencen per B que tenen productes amb un preu major a 50.
SELECT * FROM Suppliers AS s, Products As p  // seleccioname todo lo que tenga q ver con estas tablas 
WHERE s.SupplierID = p.SupplierID AND City LIKE 'B%' AND UnitPrice > 50; // estamos relacionando tablas diciendole q el campo suplier esta en S i en P .solo selecionara las filas de p que sean supplierid i las igualara a las filas de s que sean suplierid

--25.Mostra els clients d’un país amb més de 7 lletres.

SELECT * FROM Customers
WHERE LENGTH(Country) > 7;

--26.Mostra les ordres d’avui.

SELECT * FROM Orders
WHERE OrderDate = CURRENT_DATE() ;


--27.Mostra les ordres de febrer del 1997 del empleat 2.

SELECT * FROM Orders 
WHERE YEAR(OrderDate) = 1997  AND MONTH(OrderDate)= 2 AND Employees = 2;


--28.Mostra la mitja de ordres per any.
SELECT YEAR(OrderDate) AS Año, AVG(OrderID) AS Media FROM Orders
GROUP BY YEAR(OrderDate);



--29.Mostra el seu preu del producte més barat i el més car (2 Selects separats).

SELECT ProductName, MAX(UnitPrice) FROM Products


SELECT ProductName, MIN(UnitPrice) FROM Products


--30.Les ID’s de les Ordres de 4 productes diferents o més indicant també el nom del client.

SELECT ProductName, OrderID FROM OrderDetails as od, Orders as o, Customers as c 
WHERE od.OrderID = o.OrderID  //le decimos que el orderID es el mismo en orderdetails i en orders
AND c.CustomerID= o.CustomerID  // le estamos diciendo que customerID es el mismo en custormers i en orders
GROUP BY OrderID
HAVING COUNT(ProductName) > 4;


--31.Mostra l’ordre amb més quantitat de productes. preguntar al profe

SELECT o.* FROM Order as o, OrderDetails as od, Products as p
WHERE o.OrderID= od.OrderID AND p.ProductID = od.ProductID
GROUP BY OrderID
ORDER BY COUNT(ProductID) DESC
LIMIT 1;

--32.Mostra l’empleat més gran i el més petit (2 Selects separats).

SELECT * FROM Employees
ORDER BY BirthDate DESC //mes gran
LIMIT 1

SELECT * FROM Employees
ORDER BY BirthDate ASC  //mes petit
LIMIT 2




--33.Retorna l’adreça, ciutat, codi postal i país de tots els clients (tot junts amb un camp)

SELECT Adress, City, 
      PostalCode, Country 
  FROM Customers;


--Enunciado 1: Pedidos con más de 2 productos y mostrar el nombre del cliente:

--Enunciado 2: Mostrar productos con precio superior a 100

--Selecciona el nombre del producto, la cantidad en stock y el nombre de la categoría para todos los productos.

--Selecciona el ID del pedido, el nombre del producto y la cantidad pedida, junto con el nombre del cliente que realizó el pedido

--Selecciona el ID del pedido, la fecha del pedido y el nombre del empleado para todos los pedidos realizados por un empleado específico. 

