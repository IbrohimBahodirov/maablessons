CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees (EmpID, Name, Salary) VALUES (1, 'Alice', 5000.00);
INSERT INTO Employees (EmpID, Name, Salary) 
VALUES 
    (2, 'Bob', 6000.00),
    (3, 'Charlie', 5500.00);


UPDATE Employees SET Salary = 5200.00 WHERE EmpID = 1;


DELETE FROM Employees WHERE EmpID = 2;


CREATE TABLE TestTable (ID INT, Name VARCHAR(50));
INSERT INTO TestTable VALUES (1, 'Test'), (2, 'Sample');


DELETE FROM TestTable WHERE ID = 1;


TRUNCATE TABLE TestTable;


DROP TABLE TestTable;


ALTER TABLE Employees ALTER COLUMN Name VARCHAR(100);

-
ALTER TABLE Employees ADD Department VARCHAR(50);


ALTER TABLE Employees ALTER COLUMN Salary FLOAT;


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


DELETE FROM Employees;

 Insert into Departments using SELECT
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT DeptID, DeptName FROM ExistingDepartments;


UPDATE Employees SET Department = 'Management' WHERE Salary > 5000;


DELETE FROM Employees;


ALTER TABLE Employees DROP COLUMN Department;


EXEC sp_rename 'Employees', 'StaffMembers';


DROP TABLE Departments;


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    CreatedAt DATETIME
);


ALTER TABLE Products 
ADD CONSTRAINT chk_price_positive CHECK (Price > 0);


ALTER TABLE Products 
ADD StockQuantity INT DEFAULT 50;


EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';


INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, CreatedAt)
VALUES 
    (1, 'Laptop', 'Electronics', 1000.00, GETDATE()),
    (2, 'Phone', 'Electronics', 600.00, GETDATE()),
    (3, 'Desk', 'Furniture', 150.00, GETDATE()),
    (4, 'Chair', 'Furniture', 100.00, GETDATE()),
    (5, 'Pen', 'Stationery', 2.50, GETDATE());


SELECT * INTO Products_Backup FROM Products;


EXEC sp_rename 'Products', 'Inventory';


ALTER TABLE Inventory ALTER COLUMN Price FLOAT;


CREATE TABLE Inventory_New (
    ProductCode INT IDENTITY(1000, 5),
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Price FLOAT,
    CreatedAt DATETIME,
    StockQuantity INT DEFAULT 50
);


INSERT INTO Inventory_New (ProductID, ProductName, ProductCategory, Price, CreatedAt, StockQuantity)
SELECT ProductID, ProductName, ProductCategory, Price, CreatedAt, StockQuantity FROM Inventory;


DROP TABLE Inventory;
EXEC sp_rename 'Inventory_New', 'Inventory';






