CREATE DATABASE IF NOT EXISTS shop;

CREATE TABLE IF NOT EXISTS Suppliers(
    SupplierID INT AUTO_INCREMENT, 
    CompanyName VARCHAR(20),
    ContactName VARCHAR(20),
    ContactTitle VARCHAR(20),
    Addres VARCHAR(50),
    City VARCHAR(30),
    Region VARCHAR(50),
    PostalCode VARCHAR(10),
    Country VARCHAR(40),
    Phone VARCHAR(20),
    HomePage VARCHAR(40)
    PRIMARY KEY(SupplierID)
    
);

CREATE TABLE IF NOT EXISTS Products(
    ProductID INT AUTO_INCREMENT,
    ProductName VARCHAR(40),
    SupplierID INT AUTO_INCREMENT,
    CategoryID INT AUTO_INCREMENT,
    QuantityPerUnit INT, 
    UnitPrice DECIMAL (8,2),
    UnitsinStock INT, 
    UnitOnOrder INT,
    ReorderLevel INT,
    Discontinued BOOLEAN
    PRIMARY KEY(ProductID)
);

ALTER TABLE Products
ADD CONSTRAINT fk_products_suppliers
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

CREATE TABLE ID NOT EXISTS OrderDetails(
    OrderID INT AUTO_INCREMENT,
    ProductID INT AUTO_INCREMENT,
    UnitPrice DECIMAL (5,2),
    Quantity INT, 
    Discount INT
    PRIMARY KEY(OrderID, ProductID)
);

ALTER TABLE OrderDetails
ADD CONSTRAINT fk_orderdetails_orders
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
ADD CONSTRAINT fk_orderdetails_products
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

CREATE TABLE IF NOT EXISTS Categories(
    CategoryID INT AUTO_INCREMENT,
    CategoryName VARCHAR(20),
    Description VARCHAR(50),
    Picture VARCHAR(50),
    PRIMARY KEY(CategoryID, CategoryName)

);

CREATE TABLE IF NOT EXISTS CustomerDemographics(
    CostumerTypeID INT AUTO_INCREMENT,
    CostumerDesc VARCHAR(50),
    PRIMARY KEY(CoustumerTypeID)
);

CREATE TABLE IF NOT EXISTS Cust_CustDemographics(
    CustomerID INT AUTO_INCREMENT,
    CustomerTypeID INT AUTO_INCREMENT
    PRIMERY KEY(CoustumerID, CoustumerTypeID)
);
ALTER TABLE Cust_CustDemographics
ADD CONSTRAINT fk_custcustdemographics_customers
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
ADD CONSTRAINT fk_custcustdemographics_customerdemographics
FOREIGN KEY (CustomerTypeID) REFERENCES CustomerDemographics(CustomerTypeID);

CREATE TABLE IF NOT EXISTS Orders(
    OrderID INT AUTO_INCREMENT, 
    CustomerID INT AUTO_INCREMENT,
    EmployeeID INT AUTO_INCREMENT, 
    OrderDate DATETIME, 
    RequiredDate DATETIME NOT NULL,
    ShippedDate DATETIME,
    ShipperVia INT AUTO_INCREMENT,
    Freight DECIMAL (8,2),
    ShipName VARCHAR(40),
    ShipAdress VARCHAR(40),
    ShipCity VARCHAR(15),
    ShipRegion VARCHAR(15),
    ShipPostalCode VARCHAR(10),
    ShipCountry VARCHAR(15)
    PRIMARY KEY(OrderID, CustomerID, EmployeeID)
);
ALTER TABLE Orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
ADD CONSTRAINT fk_orders_employees
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
ADD CONSTRAINT fk_orders_shippers
FOREIGN KEY (ShipVia) REFERENCES Shippers(ShipperID);

CREATE TABLE IF NOT EXISTS Customers(
    CustomerID INT AUTO_INCREMENT,
    CompanyName VARCHAR(50), 
    ContactName VARCHAR(50),
    ContactTitle VARCHAR(50),
    Adress VARCHAR(30),
    City VARCHAR(50),
    Region VARCHAR(50)
    PostalCode INT,
    Country VARCHAR(50),
    Phone INT,
    Fax INT
    PRIMARY KEY(CustomerID)
);

CREATE TABLE IF NOT EXISTS Employess(
    EmployeeID INT AUTO_INCREMENT,
    LastName VARCHAR(50),
    FirstName VARCHAR(50),
    Title VARCHAR(50),
    TitleOfCourtesy VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Adress VARCHAR(50),
    City VARCHAR(50),
    Region VARCHAR (50),
    PostalCode INT,
    Country VARCHAR(50),
    HomePage VARCHAR(30),
    Photo VARCHAR(30),
    Notes VARCHAR(50),
    ReportsTo INT,
    PhotoPath VARCHAR(50)
    PRIMARY KEY(EmployeeID)
);

CREATE TABLE IF NOT EXISTS Shippers(
    ShipperID INT AUTO_INCREMENT,
    CompanyName VARCHAR(50),
    Phone INT,
    PRIMARY KEY(ShipperID)
);

CREATE TABLE IF NOT EXISTS EmployeeTerritories(
    EmployeeID INT AUTO_INCREMENT,
    TerritoryID INT AUTO_INCREMENT,
    PRIMARY KEY(EmployeeID, TerritoryID)
)
ALTER TABLE EmployeeTerritories
ADD CONSTRAINT fk_employeeterritories_employees
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
ADD CONSTRAINT fk_employeeterritories_territories
FOREIGN KEY (TerritoryID) REFERENCES Territories(TerritoryID);

CREATE TABLE IF NOT EXISTS Territories(
    TerritoryID INT AUTO_INCREMENT,
    TerritoryDescription VARCHAR(50),
    RegionID INT AUTO_INCREMENT
    PRIMARY KEY(TerritoryID)
)
ALTER TABLE Territories
ADD CONSTRAINT fk_territories_region
FOREIGN KEY (RegionID) REFERENCES Region(RegionID);

CREATE TABLE IF NOT EXISTS Region(
    RegionID INT AUTO_INCREMENT,
    RegionDescription VARCHAR(50),
    PRIMARY KEY(RegionID)
)
