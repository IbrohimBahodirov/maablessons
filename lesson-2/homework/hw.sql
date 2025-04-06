create database SchoolDB;
use SchoolDB;

create table Students(
    id INT PRIMARY KEY ,
    name VARCHAR(50),
    age TINYINT
);

INSERT INTO Students (StudentID, Name, Age) 
VALUES 
(1, 'Ismoil', 37),
(2, 'Ali', 40),
(3, 'Vali', 8),
(4, 'Jabbor', 78),
(5, 'Javohir', 25);

---DQL---
SELECT * FROM Students;
---DML--
INSERT INTO Students (id, name, age) VALUES (6, 'Sherzod', 23);
---DDL--
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);
---DCL--
GRANT SELECT ON Students TO [username];

---TCL---
BEGIN TRANSACTION;

INSERT INTO Students (id, name, age) VALUES (7, 'Lola', 20);
UPDATE Students SET age = 99 WHERE name = 'Ali';




