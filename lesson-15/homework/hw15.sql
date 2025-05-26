CREATE TABLE Employees ( EmployeeID INT PRIMARY KEY, DepartmentID INT, FirstName VARCHAR(50), LastName VARCHAR(50), Salary DECIMAL(10, 2) );
INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES (1, 1, 'John', 'Doe', 60000.00), (2, 1, 'Jane', 'Smith', 65000.00), (3, 2, 'James', 'Brown', 70000.00), (4, 3, 'Mary', 'Johnson', 75000.00), (5, 4, 'Linda', 'Williams', 80000.00), (6, 2, 'Michael', 'Jones', 85000.00), (7, 1, 'Robert', 'Miller', 55000.00), (8, 3, 'Patricia', 'Davis', 72000.00), (9, 4, 'Jennifer', 'García', 77000.00), (10, 1, 'William', 'Martínez', 69000.00);

CREATE TABLE Departments ( DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50) );
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'HR'), (2, 'Sales'), (3, 'Marketing'), (4, 'Finance'), (5, 'IT'), (6, 'Operations'), (7, 'Customer Service'), (8, 'R&D'), (9, 'Legal'), (10, 'Logistics');

CREATE TABLE Sales ( SalesID INT PRIMARY KEY, EmployeeID INT, ProductID INT, SalesAmount DECIMAL(10, 2), SaleDate DATE );
INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES (1, 1, 1, 1500.00, '2025-01-01'), (2, 2, 2, 2000.00, '2025-01-02'), (3, 3, 3, 1200.00, '2025-01-03'), (4, 4, 4, 1800.00, '2025-01-04'), (5, 5, 5, 2200.00, '2025-01-05'), (6, 6, 6, 1400.00, '2025-01-06'), (7, 7, 1, 2500.00, '2025-01-07'), (8, 8, 2, 1700.00, '2025-01-08'), (9, 9, 3, 1600.00, '2025-01-09'), (10, 10, 4, 1900.00, '2025-01-10'), (11, 1, 5, 2100.00, '2025-01-11'), (12, 2, 6, 1300.00, '2025-01-12'), (13, 3, 1, 2000.00, '2025-01-13'), (14, 4, 2, 1800.00, '2025-01-14'), (15, 5, 3, 1500.00, '2025-01-15'), (16, 6, 4, 2200.00, '2025-01-16'), (17, 7, 5, 1700.00, '2025-01-17'), (18, 8, 6, 1600.00, '2025-01-18'), (19, 9, 1, 2500.00, '2025-01-19'), (20, 10, 2, 1800.00, '2025-01-20'), (21, 1, 3, 1400.00, '2025-01-21'), (22, 2, 4, 1900.00, '2025-01-22'), (23, 3, 5, 2100.00, '2025-01-23'), (24, 4, 6, 1600.00, '2025-01-24'), (25, 5, 1, 1500.00, '2025-01-25'), (26, 6, 2, 2000.00, '2025-01-26'), (27, 7, 3, 2200.00, '2025-01-27'), (28, 8, 4, 1300.00, '2025-01-28'), (29, 9, 5, 2500.00, '2025-01-29'), (30, 10, 6, 1800.00, '2025-01-30'), (31, 1, 1, 2100.00, '2025-02-01'), (32, 2, 2, 1700.00, '2025-02-02'), (33, 3, 3, 1600.00, '2025-02-03'), (34, 4, 4, 1900.00, '2025-02-04'), (35, 5, 5, 2000.00, '2025-02-05'), (36, 6, 6, 2200.00, '2025-02-06'), (37, 7, 1, 2300.00, '2025-02-07'), (38, 8, 2, 1750.00, '2025-02-08'), (39, 9, 3, 1650.00, '2025-02-09'), (40, 10, 4, 1950.00, '2025-02-10');

CREATE TABLE Products ( ProductID INT PRIMARY KEY, CategoryID INT, ProductName VARCHAR(100), Price DECIMAL(10, 2) );
INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES (1, 1, 'Laptop', 1000.00), (2, 1, 'Smartphone', 800.00), (3, 2, 'Tablet', 500.00), (4, 2, 'Monitor', 300.00), (5, 3, 'Headphones', 150.00), (6, 3, 'Mouse', 25.00), (7, 4, 'Keyboard', 50.00), (8, 4, 'Speaker', 200.00), (9, 5, 'Smartwatch', 250.00), (10, 5, 'Camera', 700.00);



--task1
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--task2
WITH DuplicateSalaries AS (
  SELECT
    salary
  FROM employees
  GROUP BY salary
  HAVING COUNT(*) > 1

)SELECT
  e.*
FROM employees AS e
JOIN DuplicateSalaries AS d
  ON e.salary = d.salary
ORDER BY e.salary, e.EmployeeID;

--task3
WITH DeptCounts AS (
  SELECT
    DepartmentID,
    COUNT(*) AS employee_count
  FROM employees
  GROUP BY DepartmentID
)
SELECT
  d.DepartmentID,
  d.employee_count
FROM DeptCounts AS d
ORDER BY d.DepartmentID;

--task4
SELECT e.*
FROM employees AS e
JOIN (
    SELECT AVG(salary) AS avg_salary
    FROM employees
) AS avg_tbl
  ON e.salary < avg_tbl.avg_salary
ORDER BY e.salary;

--task5
WITH SoldTwice AS (
  SELECT
    ProductID
  FROM sales
  GROUP BY ProductID
  HAVING COUNT(*) >= 2
)
SELECT
  p.ProductID,
  p.ProductName
FROM products AS p
JOIN SoldTwice AS s
  ON p.ProductID = s.ProductID
ORDER BY p.ProductID;
select * from Sales
--task6
SELECT e.*
FROM employees AS e
JOIN (
  SELECT
   EmployeeID
  FROM sales
  WHERE SalesAmount > 2000
  GROUP BY  EmployeeID
  HAVING COUNT(*) = 1
) AS big_single_sale
  ON e. EmployeeID = big_single_sale. EmployeeID
ORDER BY e. EmployeeID;

--task7
SELECT p.*
FROM products AS p
JOIN (
    SELECT MAX(price) AS max_price
    FROM products
) AS m
  ON p.price = m.max_price;

--task8
WITH SalesPerEmployee AS (
  SELECT
    EmployeeID,
    SUM(SalesAmount) AS total_sales
  FROM sales
  GROUP BY EmployeeID
)
SELECT
  e.EmployeeID,
  e.FirstName,
  s.total_sales
FROM employees AS e
LEFT JOIN SalesPerEmployee AS s
  ON e.EmployeeID = s.EmployeeID
ORDER BY s.total_sales DESC

select * from Products
select * from Sales
--task9
WITH LaptopSales AS (
    SELECT s.EmployeeID
    FROM Sales s
    JOIN Products p ON s.ProductID = p.ProductID
    WHERE p.ProductName = 'Laptop'
)
SELECT DISTINCT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
JOIN LaptopSales ls ON e.EmployeeID = ls.EmployeeID;

--task10

WITH RankedSalaries AS (
    SELECT 
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        e.Salary,
        e.DepartmentID,
        d.DepartmentName,
        RANK() OVER (PARTITION BY e.DepartmentID ORDER BY e.Salary DESC) AS SalaryRank
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
)
SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    DepartmentID,
    DepartmentName
FROM RankedSalaries
WHERE SalaryRank = 1;

--task11
WITH DepartmentEmployees AS (
    SELECT DepartmentID
    FROM Employees
)
SELECT d.DepartmentID, d.DepartmentName
FROM Departments d
LEFT JOIN DepartmentEmployees de ON d.DepartmentID = de.DepartmentID
WHERE de.DepartmentID IS NULL;
--task12

WITH EmployeeSales AS (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e1.EmployeeID, e1.TotalSales
FROM EmployeeSales e1
JOIN EmployeeSales e2 ON e1.TotalSales = e2.TotalSales AND e1.EmployeeID <> e2.EmployeeID;
--task13

WITH ProductRevenue AS (
    SELECT s.ProductID, SUM(s.SalesAmount) AS TotalRevenue
    FROM Sales s
    GROUP BY s.ProductID
)
SELECT p.CategoryID, SUM(pr.TotalRevenue) AS CategoryRevenue
FROM ProductRevenue pr
JOIN Products p ON pr.ProductID = p.ProductID
GROUP BY p.CategoryID;
--task14

SELECT *
FROM (
    SELECT 
        e.EmployeeID, e.FirstName, e.LastName, e.Salary, e.DepartmentID,
        RANK() OVER (PARTITION BY e.DepartmentID ORDER BY e.Salary DESC) AS RankInDept
    FROM Employees e
) ranked
WHERE RankInDept <= 3;
--task15

SELECT EmployeeID, COUNT(*) AS TransactionCount
FROM Sales
GROUP BY EmployeeID
HAVING COUNT(*) = (
    SELECT MAX(TransactionCount)
    FROM (
        SELECT COUNT(*) AS TransactionCount
        FROM Sales
        GROUP BY EmployeeID
    ) sub
);
--task16


WITH ProductVariety AS (
    SELECT EmployeeID, COUNT(DISTINCT ProductID) AS ProductCount
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.EmployeeID, e.FirstName, e.LastName, pv.ProductCount
FROM ProductVariety pv
JOIN Employees e ON e.EmployeeID = pv.EmployeeID
WHERE pv.ProductCount > 3;
--task17

SELECT DepartmentID, TotalSalary
FROM (
    SELECT DepartmentID, SUM(Salary) AS TotalSalary
    FROM Employees
    GROUP BY DepartmentID
) dept_salaries
WHERE TotalSalary = (
    SELECT MAX(TotalSalary)
    FROM (
        SELECT SUM(Salary) AS TotalSalary
        FROM Employees
        GROUP BY DepartmentID
    ) t
);
--task18

SELECT e.EmployeeID, e.FirstName, e.LastName, s.TotalSales, e.DepartmentID
FROM (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) s
JOIN Employees e ON s.EmployeeID = e.EmployeeID
JOIN (
    SELECT DepartmentID, AVG(SalesAmount) AS AvgDeptSales
    FROM Sales s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
    GROUP BY DepartmentID
) avg_sales ON e.DepartmentID = avg_sales.DepartmentID
WHERE s.TotalSales > avg_sales.AvgDeptSales;
--task19

SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary, s.TotalSales
FROM (
    SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) s
JOIN Employees e ON e.EmployeeID = s.EmployeeID
WHERE s.TotalSales > e.Salary;
--task20

SELECT DepartmentID, TransactionCount
FROM (
    SELECT e.DepartmentID, COUNT(*) AS TransactionCount
    FROM Sales s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
    GROUP BY e.DepartmentID
) dept_sales
WHERE TransactionCount = (
    SELECT MAX(TransactionCount)
    FROM (
        SELECT COUNT(*) AS TransactionCount
        FROM Sales s
        JOIN Employees e ON s.EmployeeID = e.EmployeeID
        GROUP BY e.DepartmentID
    ) sub
);
--task20

SELECT ProductID, EmployeeID, TotalSales
FROM (
    SELECT ProductID, EmployeeID, SUM(SalesAmount) AS TotalSales,
           RANK() OVER (PARTITION BY ProductID ORDER BY SUM(SalesAmount) DESC) AS rnk
    FROM Sales
    GROUP BY ProductID, EmployeeID
) ranked
WHERE rnk = 1;
