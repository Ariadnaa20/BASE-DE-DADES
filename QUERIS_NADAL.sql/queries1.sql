--Trobar els clients de barcelona
SELECT * FROM Customers WHERE City LIKE 'Barcelona';


--Empleats que saben de gestió (manage)
SELECT * FROM Employees WHERE Notes LIKE '%manage%' ;


--Trobeu els productes de la categoria 2 i que el preu sigui entre 20 i 50

SELECT * FROM Products WHERE CategoryID = 2 AND Price BETWEEN 20 AND 50; 

--Quins clients es diuen Elizabeth?

SELECT * FROM Customers WHERE ContactName LIKE '%Elizabeth%';


--Quines ordres ha fet l'empleat 4 durant el desembre del 1996?

SELECT * FROM Orders WHERE EmployeeID = 4 AND YEAR(OrderDate) = 1996 AND MONTH(OrderDate)= 12;

--Les diferents ciutats dels clients

SELECT DISTINCT City FROM Customers;

--Buscar quin es el supplier (nom i telefon) que ens ven el producte més barat. (2 selects)

SELECT ContactName, Phone FROM Suppliers WHERE Products 
SELECT 
