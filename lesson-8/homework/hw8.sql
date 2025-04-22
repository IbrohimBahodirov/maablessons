--Easy-Level Tasks 
--task1
select category ,COUNT(*) count_of_Products from Products
group by category

--task2
select Category, AVG(Price) avgPriceELectr  from Products where Category='Electronics' group by Category

--task3
select City, count(*) avgPriceELectr  from Customers
where City like 'L%' group by City

--task4
select ProductName from Products where ProductName  like '%er'

--task5
select * from Customers where City like '%a'

--task6
select max(Price) from Products

--task7
SELECT 
    ProductID,
    ProductName,
    StockQuantity,
    IIF(StockQuantity < 30, 'Low Stock', 'Sufficient') AS StockStatus
FROM 
    Products;

--task8

select Country, count(*) as countCustomers from Customers group by Country

--task9
select max(Quantity) maxQuantity,min(Quantity) minQuantity from Orders

--Medium-Level Tasks
--task10

SELECT DISTINCT CustomerID
FROM Orders
WHERE YEAR(OrderDate) = 2023
EXCEPT
SELECT DISTINCT CustomerID
FROM Invoices;

--task11
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;

--task12
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

--task13
select Year(OrderDate) Year,Avg(TotalAmount) AVGAmount from Orders group by Year(OrderDate)


--task14
SELECT 
    ProductName,
    CASE 
        WHEN Price < 100 THEN 'Low'
        WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
        ELSE 'High'
    END AS PriceGroup
FROM Products;

--task15
SELECT DISTINCT City
FROM Customers
ORDER BY City;

--task16
SELECT 
    ProductID,
    SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;

--task17
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';

--task18
SELECT ProductID FROM Products
INTERSECT
SELECT ProductID FROM Products_Discounted;

-- ========== HARD LEVEL ==========

--task19
SELECT TOP 3 
    CustomerID,
    SUM(InvoiceAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;
--  task20

FROM Products
WHERE ProductID NOT IN (
    SELECT ProductID FROM Products_Discounted
);

--task21
SELECT 
    p.ProductName,
    COUNT(s.SaleID) AS TimesSold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName;

--task22
SELECT TOP 5 
    ProductID,
    SUM(Quantity) AS TotalOrdered
FROM Orders
GROUP BY ProductID
ORDER BY TotalOrdered DESC;

