--1. Retorna un recompte de quants distribuidors (shippers) hi ha.

SELECT COUNT(ShipperID) as Recompte_Distrivuidors FROM Shippers  o SELECT COUNT(*) FROM Shippers

--2. Calcula quants proveïdors (suppliers) hi ha per ciutat.

SELECT City, COUNT(SupplierID) FROM Suppliers   o  COUNT(*), City
GROUP BY City;

--3. Calcula quants productes són distribuits pel shipper número 3.

SELECT COUNT(ProductID) AS numero_de_productos    millor: SUM(quantity)
FROM Products p, OrderDetails od, Orders o         no cal productes
WHERE p.ProductID = od.ProductID AND od.OrderID = o.OrderID AND o.ShipVia = 3;    
            aixo no cal 

--4. Crea un informe amb el nom del distribuidor, nom del proveidor, nom de la categoria i el recompte de productes que coincideixen.   6 taules
SELECT sh.ShipperID, sh.CompanyName AS Distribuidor, su.CompanyName AS Supplier, p.CategoryID, COUNT(p.ProductID) AS RecompteProductes       sh i s companyname 
FROM Shippers as sh, Orders as o, OrderDetails as od, Products as p, Suppliers as su
WHERE sh.ShipperID = o.ShipVia AND o.OrderID = od.OrderID AND od.ProductID = p.ProductID AND p.SupplierID = su.SupplierID
GROUP BY o.ShipVia, sh.CompanyName, su.CompanyName, p.CategoryID, p.ProductID




sh.companyname, s. companyname, c.categoryname, COUNT(ProductID)


--5. Mostra un informe amb el nom dels clients (customers.companyname)que han rebut més de tres paquets provinents del shipper número 3.

SELECT  c.CosutumerID, c.CompanyName, sh.ShipperID, FROM Customers as c, Shippers as sh, Orders as od    SELECT c.CompanyName FROM customers AS c, Orders as o
WHERE sh.ShipperID = o.ShipVia AND o.CosutumerID = c.CosutumerID AND sh.ShipperID= 3                     WHERE c.CustomerID = o.Customemr AND ShipVia = 3
GROUP BY sh.ShipperID, c.CompanyName, c.CustomerID  nomes el c.CustomerID   normelment sagrupa es per clau primaria 
HAVING COUNT(o.OrderID) > 3  


--6. Mostra un recompte de les ordres que ha rebut cada customer ordenant pel recompte de forma descendent.

SELECT c.CustomerID, o.OrderID, COUNT(o.OrderID) as Recompte FROM Orders as o, Customers as c
WHERE c.CustomerID = o.CustomerID
GROUP BY c.CustomerID         
ORDER BY Recompte DESC


--7. Mostra un recompte de clients (customers) per codi postal sempre i quant n'hi hagi més d'un al mateix codi postal.

SELECT PostalCode, COUNT(CustomerID)  as Recompte_CodiPostal FROM Customers as c 
GROUP BY PostalCode
HAVING COUNT(CustomerID) > 1


--8. Compta quants territoris diferents hi ha per cada regió. Mostra RegionDescription i el recompte.
SELECT RegionDescription, COUNT(t.TerritoryID) as Recompte_Territoris FROM Region as r, Territories as t
WHERE r.RegionID = t.RegionID
GROUP BY r.RegionID, t.RegionID   si agrupa per reginID no cal t.Region


--9. Calcula la mitjana de comandes (orders) servides per cada shipper. 

SELECT sh.ShipperID, ROUND(AVG(o.OrderID), 2) as Mitjana_Comandes FROM Shippers as sh, Orders as o /*he posat round per 2 decimals*/
WHERE sh.ShipperID=o.ShipVia
GROUP BY sh.ShipperID


SELECT ROUND(COUNT(o.orderID))/(SELECT COUNT(o.orderID) FROM orders AS o) * 100, o.shipvia
        n.de orders  dividit      n.de orders total  


--10. Compta quants empleats hi ha per cada territori. Mostra TerritoryDescription i el recompte.
SELECT TerritoryDescription, COUNT(e.EmployeeID) as Recompte_empleats FROM  Employees as e, Territories as t, EmployeeTerritories as et
WHERE t.TerritoryID= et.TerritoryID AND et.EmployeeID = e.EmployeeID
GROUP BY t.TerritoryID, t.TerritoryDescription

--11. Compta quants empleats hi ha per cada regió. Mostra RegionDescription i el recompte.

SELECT r.RegionID, r.RegionDescription, COUNT(e.EmployeeID) FROM Region as r, Territories as t, EmployeeTerritories as et, Employees as e
WHERE r.RegionID= t.RegionID AND t.TerritoryID = et.TerritoryID AND e.EmployeeID = et.EmployeeID
GROUP BY r.RegionID, r.RegionDescription


--12. Retorna només el nom de la regió (region.description) que té més empleats.   DUDAS DE ESTA  having MAX. 
SELECT  COUNT(et.EmployeeID), r.RegionDescription FROM Region as r, Territories as t, EmployeeTerritories as et, Employees as e
WHERE r.RegionID= t.RegionID AND t.TerritoryID = et.TerritoryID AND e.EmployeeID = et.EmployeeID
GROUP BY r.RegionDescription    --empleats per regio no per regioDescripcion ya que no es PK
ORDER BY COUNT(e.EmployeeID) DESC                   HAVING MAX(e.EmployeeID)  --no te sentit comparar id ja que em retorna 1
LIMIT 1

--13. Retorna el recompte de productes per categoria.

SELECT CategoryID, COUNT(ProductID) as Recompte_Productes FROM Products 
GROUP BY CategoryID

--14. Calcula quants productes pot servir cada distribuïdor. Mostra el CompanyName i el recompte de productes.
SELECT sh.CompanyName, COUNT(p.ProductID) FROM Products as p, OrderDetails as od, Orders as o, Shippers as sh
WHERE p.ProductID = od.ProductID AND o.OrderID= od.OrderID AND o.ShipVia= sh.ShipperID
GROUP BY p.ProductID, sh.CompanyName

--15. Calcula quants empleats hi ha per Ciutat contractats a partir de l'any 1993.

SELECT City, COUNT(EmployeeID) as Recompte_empleats FROM Employees
WHERE YEAR(HireDate) >= 1993
GROUP BY City 1                                  /*redomon 4, london 1, seattle 1*/