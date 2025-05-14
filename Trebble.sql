-- Create and select the database
DROP DATABASE IF EXISTS Trebble;
CREATE DATABASE Trebble;
USE Trebble;

-- Create States table
CREATE TABLE States (
    StateCode CHAR(2) NOT NULL,
    StateName VARCHAR(20) NOT NULL,
    PRIMARY KEY (StateCode)
);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    City VARCHAR(20) NOT NULL,
    State CHAR(2) NOT NULL,
    ZipCode CHAR(15) NOT NULL,
    PRIMARY KEY (CustomerID),
    CONSTRAINT FK_Customers_States FOREIGN KEY (State) 
        REFERENCES States (StateCode)
);

-- Create Products table
CREATE TABLE Products (
    ProductCode CHAR(10) NOT NULL,
    Description VARCHAR(50) NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    OnHandQuantity INT NOT NULL,
    PRIMARY KEY (ProductCode)
);

-- Create Invoices table
CREATE TABLE Invoices (
    InvoiceID INT AUTO_INCREMENT NOT NULL,
    CustomerID INT NULL,
    InvoiceDate DATETIME NOT NULL,
    ProductTotal DECIMAL(10, 2) NOT NULL,
    SalesTax DECIMAL(10, 2) NOT NULL,
    Shipping DECIMAL(10, 2) NOT NULL,
    InvoiceTotal DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (InvoiceID),
    CONSTRAINT FK_Invoices_Customers FOREIGN KEY (CustomerID) 
        REFERENCES Customers (CustomerID)
        ON DELETE SET NULL
);

-- Create InvoiceLineItems table
CREATE TABLE InvoiceLineItems (
    InvoiceID INT NOT NULL,
    ProductCode CHAR(10) NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    ItemTotal DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (InvoiceID, ProductCode),
    CONSTRAINT FK_InvoiceLineItems_Invoices FOREIGN KEY (InvoiceID) 
        REFERENCES Invoices (InvoiceID)
        ON DELETE CASCADE,
    CONSTRAINT FK_InvoiceLineItems_Products FOREIGN KEY (ProductCode) 
        REFERENCES Products (ProductCode)
);

-- Create OrderOptions table
CREATE TABLE OrderOptions (
    OptionID INT AUTO_INCREMENT NOT NULL,
    SalesTaxRate DECIMAL(18, 4) NOT NULL,
    FirstBookShipCharge DECIMAL(10, 2) NOT NULL,
    AdditionalBookShipCharge DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (OptionID)
);

-- Insert sample data into States
INSERT INTO States (StateCode, StateName) VALUES
('CA', 'California'),
('NY', 'New York'),
('TX', 'Texas'),
('FL', 'Florida'),
('WA', 'Washington');

-- Insert sample data into Products
INSERT INTO Products (ProductCode, Description, UnitPrice, OnHandQuantity) VALUES
('BOOK1    ', 'C# Programming', 49.99, 100),
('BOOK2    ', 'ASP.NET Core', 54.99, 75),
('BOOK3    ', 'Entity Framework', 44.99, 50),
('BOOK4    ', 'SQL Server', 39.99, 80),
('BOOK5    ', 'Azure Cloud', 59.99, 45);

-- Insert sample data into OrderOptions
INSERT INTO OrderOptions (SalesTaxRate, FirstBookShipCharge, AdditionalBookShipCharge) VALUES
(0.0825, 4.99, 2.50);

-- Insert sample customers (NOT REAL PEOPLE)
INSERT INTO Customers (Name, Address, City, State, ZipCode) VALUES
('John Smith', '123 Main St', 'San Francisco', 'CA', '94105        '),
('Sarah Johnson', '456 Oak Ave', 'New York', 'NY', '10001        '),
('Michael Brown', '789 Pine Rd', 'Austin', 'TX', '78701        ');

-- Insert sample invoices
INSERT INTO Invoices (CustomerID, InvoiceDate, ProductTotal, SalesTax, Shipping, InvoiceTotal) VALUES
(1, '2025-04-01 10:30:00', 99.98, 8.25, 7.49, 115.72),
(2, '2025-04-02 14:15:00', 54.99, 4.54, 4.99, 64.52),
(3, '2025-04-03 09:45:00', 144.97, 11.96, 9.99, 166.92);

-- Insert sample invoice line items
INSERT INTO InvoiceLineItems (InvoiceID, ProductCode, Quantity, UnitPrice, ItemTotal) VALUES
(1, 'BOOK1    ', 1, 49.99, 49.99),
(1, 'BOOK2    ', 1, 49.99, 49.99),
(2, 'BOOK3    ', 1, 54.99, 54.99),
(3, 'BOOK1    ', 1, 49.99, 49.99),
(3, 'BOOK4    ', 1, 39.99, 39.99),
(3, 'BOOK5    ', 1, 54.99, 54.99);