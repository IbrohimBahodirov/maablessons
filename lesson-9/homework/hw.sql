--Easy-Level Tasks 
--task1

SELECT Products.ProductName, 
       Suppliers.SupplierName
FROM 
    Products
CROSS JOIN 
    Suppliers;

--task2
SELECT Departments.DepartmentName, 
       Employees.Name
FROM 
    Departments
CROSS JOIN 
    Employees;


--task3
SELECT Products.ProductName, 
       Suppliers.SupplierName
FROM 
    Products
Inner Join
    Suppliers on  Products.SupplierID = Suppliers.SupplierID;


--task4
SELECT Customers.FirstName, 
       Orders.OrderID
FROM 
    Orders
Inner Join
   Customers on  Orders.CustomerID = Customers.CustomerID;

--task5
SELECT Courses.CourseName, 
       Students.Name
FROM 
    Courses
CROSS JOIN 
    Students;

--task6
SELECT Products.ProductName, 
       Orders.OrderID
FROM 
    Orders
Inner Join
    Products on  Orders.ProductID = Products.ProductID;

--task7
SELECT Employees.Name, 
       Departments.DepartmentID
FROM 
    Departments
Inner Join
    Employees on  Departments.DepartmentID = Employees.EmployeeID


--task8
SELECT Students.Name, 
       Enrollments.EnrollmentID
FROM 
    Enrollments
Inner Join
    Students on  Enrollments.StudentID = Students.StudentID

--task9
SELECT 
    Orders.OrderID,
    Payments.PaymentID
    
FROM 
    Orders
INNER JOIN 
    Payments ON Orders.OrderID = Payments.OrderID;


--task10
SELECT Products.ProductName, 
       Orders.OrderID,
	   Products.Price
FROM 
    Orders
Inner Join
    Products on  Orders.ProductID = Products.ProductID
	where Products.Price>100;

--Medium-Level Tasks
--task11

SELECT Employees.Name, 
       Departments.DepartmentID
FROM 
    Departments
Inner Join
    Employees on  Departments.DepartmentID = Employees.EmployeeID
	where Employees.DepartmentID!=Departments.DepartmentID 


--task12
SELECT Products.ProductName, 
       Orders.OrderID
FROM 
    Orders
Inner Join
    Products on  Orders.ProductID = Products.ProductID
	where Orders.Quantity>Products.StockQuantity


--task13
SELECT Customers.FirstName, 
       Sales.SaleID
FROM 
    Sales
Inner Join
    Customers on  Sales.CustomerID = Customers.CustomerID
	where Sales.SaleAmount>=500;

--task14
SELECT 
    Students.Name, 
    Courses.CourseName
FROM 
    Enrollments
INNER JOIN 
    Students ON Enrollments.StudentID = Students.StudentID
INNER JOIN 
    Courses ON Enrollments.CourseID = Courses.CourseID;


--task15
SELECT Products.ProductName, 
       Suppliers.SupplierName
FROM 
    Products
Inner Join
    Suppliers on  Products.SupplierID = Suppliers.SupplierID
	where SupplierName like 'Tech%';

--task16
SELECT 
    Orders.OrderID,
    Payments.PaymentID,
    Payments.Amount
FROM 
    Orders
INNER JOIN 
    Payments ON Orders.OrderID = Payments.OrderID
	where Payments.Amount>Orders.TotalAmount

--task17

SELECT 
	M.Name AS ManagerName,
    M.Salary AS ManagerSalary,
    E.Name AS EmployeeName,
    E.Salary AS EmployeeSalary
    
FROM 
    Employees E
JOIN 
    Employees M ON E.ManagerID = M.EmployeeID
WHERE 
    E.Salary > M.Salary;

--task18
select Products.ProductName,
		Categories.CategoryName

from 
	Categories
inner join 
	Products on Categories.CategoryID=Products.ProductID
	where  Categories.CategoryName='Electronics' or Categories.CategoryName='Furniture'

--task19

SELECT Customers.FirstName, 
       Sales.SaleID
	 
FROM 
    Sales
Inner Join
    Customers on  Sales.CustomerID = Customers.CustomerID
	where Customers.Country='USA'

--task20
SELECT Customers.FirstName, 
       Orders.OrderID
FROM 
    Orders
Inner Join
   Customers on  Orders.CustomerID = Customers.CustomerID
   where Customers.Country='Germany' and Orders.Quantity>100

--Hard-Level Tasks
--task21
SELECT 
	F.Name AS first_EmmloyeeName,
    S.Name AS second_EmployeeName
    
    
FROM 
    Employees F
JOIN 
    Employees S ON F.ManagerID = S.EmployeeID
	where F.DepartmentID!=S.DepartmentID

--Task22
SELECT 
    Payments.PaymentID,
    Payments.OrderID,
    Payments.Amount,
    Orders.Quantity,
    Products.Price,
    (Orders.Quantity * Products.Price) AS ExpectedAmount
FROM 
    Payments
JOIN 
    Orders ON Payments.OrderID = Orders.OrderID
JOIN 
    Products ON Orders.ProductID = Products.ProductID
WHERE 
    Payments.Amount <> (Orders.Quantity * Products.Price);

--Task23
SELECT 
    Students.Name, 
    Courses.CourseName
FROM 
    Enrollments
INNER JOIN 
    Students ON Enrollments.StudentID = Students.StudentID
INNER JOIN 
    Courses ON Enrollments.CourseID = Courses.CourseID
	where Enrollments.CourseID is null;

--Task24
SELECT 
	M.Name AS ManagerName,
    M.Salary AS ManagerSalary,
    E.Name AS EmployeeName,
    E.Salary AS EmployeeSalary
    
FROM 
    Employees E
JOIN 
    Employees M ON E.ManagerID = M.EmployeeID
WHERE 
    E.Salary >= M.Salary;

--task25
SELECT 
    Customers.CustomerID,
    Customers.FirstName,
    Orders.OrderID
FROM 
    Orders
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN 
    Payments ON Orders.OrderID = Payments.OrderID
WHERE 
    Payments.OrderID IS NULL;




