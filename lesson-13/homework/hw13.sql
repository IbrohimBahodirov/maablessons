--task1
SELECT LEFT('DATABASE', 4);

--task2
SELECT CHARINDEX('SQL', 'I love SQL Server');

--task3
SELECT REPLACE('Hello World', 'World', 'SQL');

--task4
SELECT LEN('Microsoft SQL Server');

--task5
SELECT RIGHT('Database', 3);

--task6
SELECT 
  LEN('apple') - LEN(REPLACE('apple', 'a', '')) AS AppleCount,
  LEN('banana') - LEN(REPLACE('banana', 'a', '')) AS BananaCount,
  LEN('grape') - LEN(REPLACE('grape', 'a', '')) AS GrapeCount;

--task7
SELECT SUBSTRING('abcdefg', 6, LEN('abcdefg'));

--task8
SELECT 
  PARSENAME(REPLACE('SQL is powerful', ' ', '.'), 2) AS Word1,
  PARSENAME(REPLACE('I love databases', ' ', '.'), 2) AS Word2;

--task9
SELECT ROUND(15.6789, 2);

--task10
SELECT ABS(-345.67);

--task11
SELECT SUBSTRING('ABCDEFGHI', 4, 3);

--task12
SELECT 'XXX' + SUBSTRING('Microsoft', 4, LEN('Microsoft'));

--task13
SELECT CHARINDEX(' ', 'SQL Server 2025');

--task14
DECLARE @FirstName NVARCHAR(50) = 'John', @LastName NVARCHAR(50) = 'Doe';
SELECT @FirstName + ', ' + @LastName;

--task15
SELECT PARSENAME(REPLACE('The database is very efficient', ' ', '.'), 3);

--task16
SELECT 
  SUBSTRING('INV1234', PATINDEX('%[0-9]%', 'INV1234'), LEN('INV1234')),
  SUBSTRING('ORD5678', PATINDEX('%[0-9]%', 'ORD5678'), LEN('ORD5678'));

--task17
SELECT ROUND(99.5, 0);

--task18
SELECT DATEDIFF(DAY, '2025-01-01', '2025-03-15');

--task19
SELECT DATENAME(MONTH, '2025-06-10');

--task20
SELECT DATEPART(WEEK, '2025-04-22');

--task21
SELECT 
  RIGHT('user1@gmail.com', LEN('user1@gmail.com') - CHARINDEX('@', 'user1@gmail.com')),
  RIGHT('admin@company.org', LEN('admin@company.org') - CHARINDEX('@', 'admin@company.org'));

--task22
SELECT LEN('experience') - CHARINDEX('e', REVERSE('experience')) + 1;

--task23
SELECT FLOOR(RAND() * (500 - 100 + 1)) + 100;

--task24
SELECT FORMAT(9876543, 'N0');

--task25
DECLARE @FullName1 NVARCHAR(100) = 'John Doe', @FullName2 NVARCHAR(100) = 'Jane Smith';
SELECT 
  LEFT(@FullName1, CHARINDEX(' ', @FullName1) - 1),
  LEFT(@FullName2, CHARINDEX(' ', @FullName2) - 1);

--task26
SELECT REPLACE('SQL Server is great', ' ', '-');

--task27
SELECT RIGHT('00000' + CAST(42 AS VARCHAR), 5);

--task28
DECLARE @str NVARCHAR(100) = 'SQL is fast and efficient';
WITH Words AS (
    SELECT value FROM STRING_SPLIT(@str, ' ')
)
SELECT MAX(LEN(value)) FROM Words;

--task29
SELECT STUFF('Error: Connection failed', 1, CHARINDEX(' ', 'Error: Connection failed'), '');

--task30
SELECT DATEDIFF(MINUTE, '08:15:00', '09:45:00');
