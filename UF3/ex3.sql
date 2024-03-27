--COPIAR NORTHWIND BKP
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
