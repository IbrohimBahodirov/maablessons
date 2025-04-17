CREATE TABLE InputTbl ( col1 VARCHAR(10), col2 VARCHAR(10) ); 
INSERT INTO InputTbl (col1, col2) VALUES ('a', 'b'), ('a', 'b'), ('b', 'a'), ('c', 'd'), ('c', 'd'), ('m', 'n'), ('n', 'm');


--task1
SELECT 
    MIN(col1) AS col1,
    MAX(col2) AS col2
FROM InputTbl
GROUP BY 
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END;

--task2
select * from TestMultipleZero where A = 1 or B=1 or C=1 or D=1


--task3
create table section1(id int, name varchar(20))


insert into section1 values (1, 'Been'), (2, 'Roma'), 
(3, 'Steven'), (4, 'Paulo'),
 (5, 'Genryh'), (6, 'Bruno'), (7, 'Fred'), (8, 'Andro')

select * from section1 where id%2!=0 

--task4
SELECT Top 10 percent id, name FROM  section1

--task5
SELECT Top 10 percent id, name FROM  section1 order by id desc

--task6
SELECT id, name FROM  section1 where name like 'B%'

--task7
select * from ProductCodes where Code like '%/_%' escape '/'
