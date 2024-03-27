
--EXERCICI 1
/*Sin utilizar procedimientos, copia el nombre de las tablas de una base de datos cualquiera (si no 
dispones de ninguna, crea una con al menos 3 tablas, 3 atributos por tabla e inserta 3 filas por tabla) 
en un fichero llamado nombre_tablas.txt: */


SELECT suppliers, employees, employeeterritories -- aixi estaria malament ja que no existeixen. Hauria de ser table_name 
INTO OUTFILE 'C:/Users/aripa/Downloads/UF3-baseDades/nombre_tablas.txt'
LINES TERMINATED BY ';\n'
FROM information_schema.TABLES
WHERE table_schema = 'northwind' 
AND TABLE_TYPE = 'base table'; --para no cojer las vistas en en caso que tenga vistas



--EXERCICI 2 
/*Para la misma base de datos que hayas elegido en el ejercicio anterior, y sin utilizar procedimientos, 
crea una base de datos de backup y desde esta, copia la estructura de las tablas y su información. 
*/

CREATE DATABASE northwind_ariadna
USE northwind_ariadna;


SI VOLEM CREAR TAULA PER TAULA
CREATE TABLE bkp_categories LIKE northwind.categories;
CREATE TABLE bkp_customercustomerdemo LIKE northwind.customercustomerdemo;
CREATE TABLE bkp_customerdemographics LIKE northwind.customerdemographics;
CREATE TABLE bkp_customers LIKE northwind.customers;
CREATE TABLE bkp_employees LIKE northwind.employees;
CREATE TABLE bkp_employeeterritories LIKE northwind.employeeterritories;
CREATE TABLE bkp_orderdetails LIKE northwind.orderdetails;
CREATE TABLE bkp_orders LIKE northwind.orders;
CREATE TABLE bkp_products LIKE northwind.products;
CREATE TABLE bkp_region LIKE northwind.region;
CREATE TABLE bkp_shippers LIKE northwind.shippers;
CREATE TABLE bkp_suppliers LIKE northwind.suppliers;
CREATE TABLE bkp_territories LIKE northwind.territories;

ARA VOLEM COPIAR TOTA LA INFO DE LES TAULES 
INSERT INTO northwind_ariadna.bkp_categories SELECT * FROM northwind.categories;
INSERT INTO northwind_ariadna.bkp_customercustomerdemo SELECT * FROM northwind.customercustomerdemo;
INSERT INTO northwind_ariadna.bkp_customerdemographics SELECT * FROM northwind.customerdemographics;
INSERT INTO northwind_ariadna.bkp_customers SELECT * FROM northwind.customers;
INSERT INTO northwind_ariadna.bkp_employees SELECT * FROM northwind.employees;
INSERT INTO northwind_ariadna.bkp_employeeterritories SELECT * FROM northwind.employeeterritories;
INSERT INTO northwind_ariadna.bkp_orderdetails SELECT * FROM northwind.orderdetails;
INSERT INTO northwind_ariadna.bkp_orders SELECT * FROM northwind.orders;
INSERT INTO northwind_ariadna.bkp_products SELECT * FROM northwind.products;
INSERT INTO northwind_ariadna.bkp_region SELECT * FROM northwind.region;
INSERT INTO northwind_ariadna.bkp_shippers SELECT * FROM northwind.shippers;
INSERT INTO northwind_ariadna.bkp_suppliers SELECT * FROM northwind.suppliers;
INSERT INTO northwind_ariadna.bkp_territories SELECT * FROM northwind.territories;

--EXERCICI 3 
/*Para una base de datos con la tabla de país (id (PK), nombre_pais, y habitantes), devuelve un archivo 
con el nombre de cada país y el porcentaje de habitantes que cada uno tiene sobre el total.*/

SELECT nombre_pais,
       habitantes / (SELECT SUM(ROUND(habitantes) FROM pais) * 100,2) AS porcentaje_habitantes
INTO OUTFILE 'C:/Users/aripa/Downloads/UF3-baseDades/nomPais_PorcentatgeHabitants.txt'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM pais;


--EXERCICI 4
/*Para una base de datos con la tabla de cuentas bancarias (numero_cuenta (PK), saldo) devuelve en 
un archivo aquellos números de cuenta que estén en números rojos junto con su saldo 
correspondiente*/
--CREA LA TAULA I INSERTO INFO 

--ENTRE EL SELECT I EL FROM VA EL FITXER
SELECT c.num_conta, c.Saldo 
INTO OUTFILE 'C:/Users/aripa/Downloads/UF3-baseDades/numConta_Saldo.txt'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM Cuentas as c 
WHERE c.Saldo<0 ;

--EXERCICI 5
/*Crea una tabla para insertar todas las combinaciones posibles de nombre, apellido y segundo 
apellido de la tabla de persona. Utiliza un procedimiento para ello*/

--PART 1
