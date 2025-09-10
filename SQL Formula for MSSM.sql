
--******************************************************************************************--
--Create schema (same as database in MySQL)--
CREATE DATABASE EmployeeDatabase;

--Create Database Schema EmployeeDatabase--
use EmployeeDatabase;

--Create Databae Tabale Employee--
--Constraints--PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK, DEFAULT--
--Constraints are rules applied to columns in a database table to enforce data integrity and consistency.--
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY, --auto_increment is used to automatically generate unique values for the primary key column--
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL, --Unique don't allowed to insert dublicate value
    Gender CHAR(1) NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(100) NOT NULL,
    Age INT NOT NULL, --Check (Age >= 18)--
    HireDate DATE NOT NULL,
    JobTitle VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),  --Check (Salary > 0)--
    ManagerID INT NULL, --Status VARCHAR(20) DEFAULT 'Active'--
    CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);
GO

--Check--check is check the validation to some important prospective--
CREATE TABLE VoterPerson (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18),
	Credits INT NOT NULL CHECK (Credits > 0) --check on student table database
);


--GO separates batches in SQL Server Management Studio (SSMS)--
--Select to view data on the table--
Select * from Employees;

--Insert the data into the table--
INSERT INTO Employees 
(FirstName, LastName, Email, Gender, Phone, Address, Age, HireDate, JobTitle, Department, Salary, ManagerID)
VALUES
('John', 'Doe', 'john.doe@example.com', 'M', '123-456-7890', '123 Main St, New York, NY', 30, '2022-01-15', 'Software Engineer', 'IT', 75000.00, NULL),
('Jane', 'Smith', 'jane.smith@example.com', 'F', '987-654-3210', '456 Park Ave, Boston, MA', 35, '2021-05-20', 'HR Manager', 'HR', 82000.00, NULL),
('Alice', 'Johnson', 'alice.j@example.com', 'F', '555-123-4567', '789 Oak St, Chicago, IL', 28, '2023-03-10', 'Business Analyst', 'Finance', 68000.00, 2),
('Bob', 'Williams', 'bob.w@example.com', 'M', '111-222-3333', '321 Pine Rd, Seattle, WA', 40, '2020-08-12', 'Team Lead', 'IT', 90000.00, 1),
('Emma', 'Brown', 'emma.brown@example.com', 'F', '444-555-6666', '654 Cedar Ln, Denver, CO', 32, '2019-11-01', 'Data Analyst', 'Finance', 72000.00, 3);


-- Insert more data into the table--
INSERT INTO Employees 
(FirstName, LastName, Email, Gender, Phone, Address, Age, HireDate, JobTitle, Department, Salary, ManagerID)
VALUES
('Michael', 'Clark', 'michael.clark@example.com', 'M', '222-333-4444', '987 Maple Dr, Austin, TX', 29, '2021-09-10', 'Software Developer', 'IT', 70000.00, 1),
('Sophia', 'Davis', 'sophia.davis@example.com', 'F', '333-444-5555', '123 Birch St, Miami, FL', 27, '2022-11-05', 'Recruiter', 'HR', 60000.00, 2),
('David', 'Miller', 'david.miller@example.com', 'M', '444-666-8888', '456 Elm St, San Diego, CA', 38, '2018-04-12', 'Finance Manager', 'Finance', 95000.00, NULL),
('Olivia', 'Garcia', 'olivia.garcia@example.com', 'F', '555-111-9999', '789 Walnut Ave, Dallas, TX', 26, '2023-06-01', 'Marketing Specialist', 'Marketing', 58000.00, NULL),
('James', 'Martinez', 'james.martinez@example.com', 'M', '666-777-0000', '321 Spruce Rd, Orlando, FL', 31, '2020-07-15', 'Sales Executive', 'Sales', 64000.00, NULL),
('Isabella', 'Lopez', 'isabella.lopez@example.com', 'F', '777-888-1111', '147 Willow St, Phoenix, AZ', 29, '2022-02-20', 'UX Designer', 'IT', 72000.00, 1),
('Ethan', 'Hernandez', 'ethan.hernandez@example.com', 'M', '888-999-2222', '258 Chestnut Dr, Portland, OR', 34, '2019-03-18', 'Database Administrator', 'IT', 85000.00, 4),
('Mia', 'Gonzalez', 'mia.gonzalez@example.com', 'F', '999-000-3333', '369 Aspen Rd, Atlanta, GA', 25, '2023-07-22', 'HR Assistant', 'HR', 50000.00, 2),
('Alexander', 'Wilson', 'alex.wilson@example.com', 'M', '111-222-4444', '741 Fir St, Houston, TX', 36, '2017-12-01', 'Project Manager', 'IT', 98000.00, 4),
('Charlotte', 'Anderson', 'charlotte.anderson@example.com', 'F', '222-333-5555', '852 Magnolia Ave, Los Angeles, CA', 33, '2019-09-14', 'Marketing Manager', 'Marketing', 87000.00, 4),
('Benjamin', 'Thomas', 'benjamin.thomas@example.com', 'M', '333-444-6666', '963 Poplar Dr, San Jose, CA', 41, '2016-05-20', 'Finance Analyst', 'Finance', 69000.00, 3),
('Amelia', 'Taylor', 'amelia.taylor@example.com', 'F', '444-555-7777', '159 Redwood Ln, Tampa, FL', 28, '2021-01-25', 'Sales Manager', 'Sales', 88000.00, 5),
('Daniel', 'Moore', 'daniel.moore@example.com', 'M', '555-666-8888', '753 Sycamore Rd, Raleigh, NC', 37, '2015-10-30', 'Senior Developer', 'IT', 93000.00, 4),
('Harper', 'Jackson', 'harper.jackson@example.com', 'F', '666-777-9999', '456 Juniper St, Salt Lake City, UT', 32, '2018-08-12', 'HR Specialist', 'HR', 62000.00, 2),
('Logan', 'White', 'logan.white@example.com', 'M', '777-888-0000', '357 Dogwood Dr, Columbus, OH', 35, '2020-03-17', 'System Analyst', 'IT', 76000.00, 1);

--Insert dublicate value but change the email domain to avoid unique constraint violation---constraint on email is unique so we cannot insert dublicate value on email column--
INSERT INTO Employees 
(FirstName, LastName, Email, Gender, Phone, Address, Age, HireDate, JobTitle, Department, Salary, ManagerID)
VALUES
('Michael', 'Clark', 'michael.clark@gmail.com', 'M', '222-333-4444', '987 Maple Dr, Austin, TX', 29, '2021-09-10', 'Software Developer', 'IT', 70000.00, 1),
('Sophia', 'Davis', 'sophia.davis@yahoo.com', 'F', '333-444-5555', '123 Birch St, Miami, FL', 27, '2022-11-05', 'Recruiter', 'HR', 60000.00, 2),
('David', 'Miller', 'david.miller@hotmail.com', 'M', '444-666-8888', '456 Elm St, San Diego, CA', 38, '2018-04-12', 'Finance Manager', 'Finance', 95000.00, NULL),
('Olivia', 'Garcia', 'olivia.garcia@gmail.com', 'F', '555-111-9999', '789 Walnut Ave, Dallas, TX', 26, '2023-06-01', 'Marketing Specialist', 'Marketing', 58000.00, NULL),
('James', 'Martinez', 'james.martinez@hotmail.com', 'M', '666-777-0000', '321 Spruce Rd, Orlando, FL', 31, '2020-07-15', 'Sales Executive', 'Sales', 64000.00, NULL),
('Isabella', 'Lopez', 'isabella.lopez@express.com', 'F', '777-888-1111', '147 Willow St, Phoenix, AZ', 29, '2022-02-20', 'UX Designer', 'IT', 72000.00, 1),
('Ethan', 'Hernandez', 'ethan.hernandez@cloud.com', 'M', '888-999-2222', '258 Chestnut Dr, Portland, OR', 34, '2019-03-18', 'Database Administrator', 'IT', 85000.00, 4),
('Mia', 'Gonzalez', 'mia.gonzalez@gmail.com', 'F', '999-000-3333', '369 Aspen Rd, Atlanta, GA', 25, '2023-07-22', 'HR Assistant', 'HR', 50000.00, 2);


ROLLBACK Transaction; --Rollback the last insert statement to avoid duplicate data in the table--
Begin Transaction; --Start the transaction to avoid duplicate data in the table--
INSERT INTO Employees;

-- Select - Retrieve data from table using Where clause--
select * from Employees;
Select Top 10 * from Employees;
select * from Employees where gender='M';  
Select * from Employees where age = 41;
select * from Employees where Department='IT';
Select * from Employees where age > all(select age from Employees where age<40);
select * from Employees where FirstName in ('Jane');
Select * from Employees where ManagerID is NULL;

--Select-Retrive data using order by
Select * from Employees order by EmployeeID desc;
Select * from Employees order by EmployeeID asc;

--select -- and, or, in, not in--
SELECT *FROM Employees;
select * from Employees where FirstName in('David'); --only show first name 
select * from Employees where LastName not in('Miller'); --except last name
select * from Employees where gender='M' or age=42;
select * from Employees where gender='M' and age=41;
select * from Employees where EmployeeID = 4 and age= 27 or Department ='Finance';
Select * from Employees where not age>30;
Select * from Employees where FirstName between 'Bob' and 'James' order by Employees;
SELECT FirstName FROM Employees WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE Age < 30);
SELECT FirstName FROM Employees WHERE EmployeeID IN ( SELECT EmployeeID FROM Department WHERE Age = 30);

--use the Like operator and wildcards--
SELECT *FROM Employees;
Select FirstName from Employees where FirstName like 'A%'; --First name starting from A
Select LastName from Employees where LastName like 'W%';
Select FirstName from Employees where FirstName like'%E'; --First name E at the end
Select LastName from Employees where LastName like '%s';
select Department from Employees where Department like 'F__anc_';  --Cound charecter and match spaces--Finance

-- Select - min and max value, avg, sum, count, diff--
SELECT *FROM Employees;
select Min(age) as yougest_age from Employees; --yogest_age is alise(temporary name)
select 'The younger age in the group is :- ' + cast(Min(age) as varchar) as yougest_Age from Employees;
select Max(age) as oldest_Age from Employees;
select 'Total employee is :- ' + cast(count(EmployeeID) as varchar) from Employees;
select avg(age) from Employees;
select count(EmployeeID) from Employees;
SELECT COUNT(*) AS Total_Employees FROM Employees; --count all the record
SELECT COUNT(Department) AS Total_Departments FROM Employees; --count only department record
SELECT COUNT(DISTINCT Department) AS Unique_Departments FROM Employees; --count only different
Select SUM(Salary) from Employees;
select max(salary) as Highest_Salary, min(salary) as Lowest_Salary from Employees;
SELECT MAX(salary) - MIN(salary) AS Salary_Difference FROM Employees;--Different between two salary

--Filter using distint, use to different value not dublicate--
select Distinct Department from Employees;
Select distinct age from Employees;  --no dublicate/same value
select distinct LastName from Employees;
select distinct (address) from Employees;

--Select any or all--
select FirstName from Employees where EmployeeID =any (select EmployeeID from LastName where age<30);
Select FirstName from Employees where EmployeeID=all (select EmployeeID from Department where age = 30); 



--case-----------
SELECT *FROM Employees;
select Age,
case
when Age >40 then 'The age is older than 40 years.'
when Age = 40 then 'The age is exactly same age.'
else 'The age is younger then 40 years.'
end as Age from Employees;

--CASE with multiple conditions--
SELECT firstName, LastName, age,
CASE 
    WHEN age<=27 THEN   'Youre a young employee.'
    WHEN age BETWEEN 28 AND 35 THEN 'You are a mid-age employee.'
    WHEN age >35 THEN 'You are an experienced employee.'
    ELSE 'Age not specified.'
END AS AgeGroup FROM Employees;

--Case with multiple conditions--
SELECT *FROM Employees;
SELECT FirstName, Department, Salary,
CASE Department
    WHEN 'IT' THEN Salary * 1.10
    WHEN 'HR' THEN Salary * 1.05
    WHEN 'Finance' THEN Salary * 1.07
    ELSE Salary * 1.03
END AS Bonus_On_Salary FROM Employees;

select age, gender from Employees order by
case when age IS NULL THEN 1 else 0 end,
age, Gender;

SELECT age, gender
FROM Employees
ORDER BY COALESCE(CAST(age AS VARCHAR), gender);

--Delete - used to delete data from table--
SELECT * FROM Employees;
delete from Employees where EmployeeID=11;  
delete from Employees where email like '%gmail%';
delete from employees where age =27 and EmployeeID = 4;
DELETE FROM Employees WHERE EmployeeID>= 1027 AND EmployeeID <= 1034; --delete all the record between 1027 to 1034--
DELETE  FROM employees WHERE EmployeeID> 2027 AND EmployeeID < 2034;
DELETE FROM Employees WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Employees WHERE Age > 30); --delete all the record except age greater than 30-
DELETE FROM Employees WHERE EmployeeID IN (21, 22, 23); 

--Truncate - removal all record from the table--
TRUNCATE TABLE Employees;  
TRUNCATE TABLE VoterPerson;
TRUNCATE TABLE Students;  --Student table from StudentDetails database
TRUNCATE TABLE Courses;   --Course table from StudentDetails database
TRUNCATE TABLE Enrollments; --Enrollments table from StudentDetails database

--Alter - ADD/DROP modify the table structure-------
SELECT * FROM Employees;
ALTER TABLE Employees ADD DateOfBirth DATE;
ALTER TABLE Employees DROP COLUMN DateOfBirth;
ALTER TABLE Employees ADD MiddleName VARCHAR(50);
ALTER TABLE Employees DROP COLUMN MiddleName;

--constraint-- rule of the sql--cannot “directly update” a constraint--usually have to modify it by dropping and recreating it or altering the table--
ALTER TABLE Employees DROP CONSTRAINT UQ_Email;
ALTER TABLE Employees ADD CONSTRAINT UQ_Email UNIQUE (Email, Department);
ALTER TABLE Employees DROP CONSTRAINT DF_Status; -- if you named it DF_Status
ALTER TABLE Employees ADD CONSTRAINT DF_Status DEFAULT 'Onboarding' FOR Status;
ALTER TABLE Employees DROP CONSTRAINT FK_Manager;
ALTER TABLE Employees ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID);
ALTER TABLE Employees DROP CONSTRAINT CHK_Age CHECK (Age >= 18);    
ALTER TABLE Employees ADD CONSTRAINT CHK_Age CHECK (Age >= 21);

--move/replace data from an old column into a new column
--step 1: add the new column to the table
ALTER TABLE Employees ADD FullName VARCHAR(100);    
--stp 2: update the new column with data from the old column
UPDATE Employees SET FullName = FirstName + ' ' + LastName;
--step 3: drop the old column if no longer needed
ALTER TABLE Employees DROP COLUMN FirstName and COLUMN LastName;    

--Continue after resetting / reseeding the identity column to start from a specific value-
DECLARE @maxid INT;
SELECT @maxid = ISNULL(MAX(EmployeeID), 0) FROM Employees;
DBCC CHECKIDENT ('Employees', RESEED, @maxid);
-- Force ID to continue from MAX(ID)
DBCC CHECKIDENT ('Employees', RESEED, (SELECT ISNULL(MAX(EmployeeID),0) FROM Employees));


--Drop - delete the table from database--
drop table Employees;
drop database StudentDetails;
drop database AdventureWorks2022;

--Backup Database to the folder--
Backup database EmployeeDatabase to disk = 'C:\Users\ranak\OneDrive\Desktop\IntelliJ_Java\PowerBI & SQL Developer\NewFolder';

--Where clause--
SELECT * FROM Employees WHERE Age > 30;

--Comparison Operator--= , != , < , > , <= , >= , BETWEEN , LIKE , IN--
SELECT *FROM Employees;
SELECT * FROM Employees WHERE Department IN ('IT','HR');
SELECT * FROM Employees WHERE Salary BETWEEN 60000 AND 80000;
SELECT * FROM Employees WHERE FirstName LIKE 'J%';  
SELECT * FROM Employees WHERE LastName LIKE '%son';

--Update Data---
SELECT * FROM Employees;
UPDATE Employees SET Salary = 80000 WHERE EmployeeID = 1;
UPDATE Employees SET Department = 'Finance' WHERE EmployeeID = 3;
UPDATE Employees SET ManagerID = 2 WHERE EmployeeID = 3;
UPDATE Employees SET JobTitle = 'Senior Software Engineer' WHERE EmployeeID = 1;
UPDATE Employees SET Phone = '555-555-5555' WHERE EmployeeID = 4;
UPDATE Employees SET Address = '123 New Address, New City, NY' WHERE EmployeeID = 5;
UPDATE Employees SET Age = 29 WHERE EmployeeID = 6;
Update Employees set DateOfBirth=07-23-1989 where EmployeeID=1;

--Gropu By----
SELECT * FROM Employees;
SELECT Department, SUM(Salary) AS TotalSalary FROM Employees GROUP BY Department;
SELECT age, COUNT(age) AS AgeCount FROM Employees GROUP BY age;
SELECT age, COUNT(age) AS AgeCount FROM Employees GROUP BY age ORDER BY AgeCount DESC;
SELECT age, COUNT(age) FROM Employees GROUP BY age HAVING COUNT(age) >=2;   

--Having----The HAVING clause is used to filter records that work on aggregated data, similar to the WHERE clause but for groups.--
SELECT Department, COUNT(EmployeeID) AS EmployeeCount FROM Employees GROUP BY Department HAVING COUNT(EmployeeID) > 2;
SELECT Department, SUM(Salary) AS TotalSalary FROM Employees GROUP BY Department HAVING SUM(Salary) > 150000;
SELECT Department, COUNT(EmployeeID) AS EmployeeCount FROM Employees GROUP BY Department HAVING COUNT(EmployeeID) >= 3;
SELECT Department, MAX(Salary) AS HighestSalary FROM Employees GROUP BY Department HAVING MAX(Salary) > 80000;
SELECT Department, MIN(Salary) AS LowestSalary FROM Employees GROUP BY Department HAVING MIN(Salary) < 60000;
SELECT Department, COUNT(EmployeeID) AS EmployeeCount FROM Employees GROUP BY Department HAVING COUNT(EmployeeID) BETWEEN 2 AND 5;
SELECT Department, SUM(Salary) AS TotalSalary FROM Employees GROUP BY Department HAVING SUM(Salary) BETWEEN 100000 AND 200000;
SELECT Department, AVG(Salary) AS AverageSalary FROM Employees GROUP BY Department HAVING AVG(Salary) > 70000;
SELECT Department, COUNT(EmployeeID) AS EmployeeCount FROM Employees GROUP BY Department HAVING COUNT(EmployeeID) = (SELECT MAX(EmployeeCount) FROM (SELECT Department, COUNT(EmployeeID) AS EmployeeCount FROM Employees GROUP BY Department) AS DeptCounts);
SELECT Department, AVG(Salary) FROM Employees GROUP BY Department HAVING AVG(Salary) > 60000;


--Joins--SELECT � FROM A INNER/LEFT/RIGHT JOIN B ON A.col = B.col;
SELECT E.FirstName, M.FirstName AS Manager FROM Employees E LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID;

--Alias--SELECT col AS alias FROM Table;
SELECT FirstName AS Employee_First_Name FROM Employees; 
SELECT LastName AS Employee_Last_Name FROM Employees;
SELECT FirstName + ' ' + LastName AS Full_Name FROM Employees;
SELECT Salary * 1.10 AS Increased_Salary FROM Employees;

--Default Values--
HireDate DATE DEFAULT GETDATE(); --Current date and time--

--String Function--LEN(), UPPER(), LOWER(), SUBSTRING(), REPLACE()
SELECT UPPER(FirstName), LEN(LastName) FROM Employees;
SELECT SUBSTRING(Email, 1, CHARINDEX('@', Email) - 1) AS Username FROM Employees;
SELECT REPLACE(Address, 'St', 'Street') AS FullAddress FROM Employees;  

--Date Function--GETDATE(), YEAR(), MONTH(), DAY(), DATEADD(), DATEDIFF()
SELECT FirstName, DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsWorked FROM Employees;
SELECT FirstName, DATEADD(YEAR, 1, HireDate) AS NextYearHireDate FROM Employees;
SELECT FirstName, YEAR(HireDate) AS HireYear, MONTH(HireDate) AS HireMonth, DAY(HireDate) AS HireDay FROM Employees;

--Math Function--ROUND(), CEILING(), FLOOR(), ABS()
SELECT ROUND(Salary,0) AS RoundedSalary FROM Employees;
SELECT CEILING(Salary) AS CeilingSalary FROM Employees;
SELECT FLOOR(Salary) AS FloorSalary FROM Employees; 

--Case/If-Else--CASE WHEN condition THEN result ELSE result END
SELECT FirstName, 
CASE WHEN Salary > 70000 THEN 'High' ELSE 'Low' END AS SalaryLevel FROM Employees;

--Highest--using the Rank() and without Rank()---
SELECT Salary, RANK() OVER (ORDER BY Salary DESC) AS rnk FROM Employees;
SELECT Salary FROM (SELECT salary, Rank() OVER (ORDER BY Salary DESC) AS rnk FROM Employees) AS RankedSalaries WHERE rnk = 5; --with using rank 5th highest salary or top 5
SELECT Salary FROM (SELECT salary, Rank() OVER (ORDER BY Salary DESC) AS rnk FROM Employees) AS RankedSalaries WHERE rnk = 1; --with using rank max salary or top 1
SELECT MAX(Salary) AS HighestSalary FROM Employees; --Without using rank top 1 salary
SELECT MAX(age) AS HighestAge FROM Employees; --Without using rank top 1 age
SELECT age FROM Employees WHERE age = (SELECT MAX(age) FROM Employees); --Without using rank top 1 age
SELECT age FROM (SELECT age, RANK() OVER (ORDER BY age DESC) AS rnk FROM Employees) AS RankedAges WHERE rnk = 1; --with using rank top 1 age
SELECT MIN(Salary) AS LowestSalary FROM Employees; --Without using rank lowest salary
SELECT * FROM(SELECT records.*, RANK() OVER (ORDER BY Salary ASC) AS rnk FROM Employees records) AS RankedSalaries WHERE rnk = 1; --with using rank lowest salary
SELECT * FROM(SELECT records.*, RANK() OVER (ORDER BY Salary ASC) AS rnk FROM Employees records) AS RankedSalaries WHERE rnk = 5; --with using rank lowest 5th salary

--dense_rank() is similar to rank() but it does not skip the rank number in case of ties. For example, 
--if two employees have the same salary and are ranked 1, the next employee will be ranked 2 in dense_rank(), whereas in rank() they would be ranked 3.
SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS dense_rnk FROM Employees;    
SELECT Age, DENSE_RANK() OVER (ORDER BY Age ASC) AS dense_rnk FROM Employees;
SELECT Salary FROM (SELECT salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS dense_rnk FROM Employees) AS DenseRankedSalaries WHERE dense_rnk = 5; --with using dense rank 5th highest salary 
SELECT Salary FROM (SELECT salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS dense_rnk FROM Employees) AS DenseRankedSalaries WHERE dense_rnk = 1; --with using dense rank max salary


--Subquery--SELECT col FROM Table WHERE col = (SELECT �);
SELECT FirstName FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees); 

--Union--SELECT col FROM Table1 UNION SELECT col FROM Table2;
--Removes duplicate rows (performs an implicit DISTINCT).--unique results
SELECT FirstName FROM Employees WHERE Department='IT' UNION SELECT FirstName FROM Employees WHERE Department='HR';      

--Union All--SELECT col FROM Table1 UNION ALL SELECT col FROM Table2;
--Keeps duplicates (does not perform DISTINCT).--duplicates are acceptable/important for the result set
SELECT FirstName FROM Employees WHERE Department='IT' UNION ALL SELECT FirstName FROM Employees WHERE Department='HR';  


--View--CREATE INDEX idx_name ON Table(col)--First Create view and Select the view Data----
--CREATE INDEX idx_department ON Employees(Department);   
SELECT * FROM Employees WHERE Department='IT';
--CREATE VIEW [Department average salary] AS SELECT Department, Salary FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees);
SELECT * FROM [Department average salary];
--CREATE VIEW [Employee Contact Info] AS SELECT FirstName, LastName, Email, Phone FROM Employees;
SELECT * FROM [Employee Contact Info];
--CREATE VIEW [Employee Salary Info] AS SELECT FirstName, LastName, Salary FROM Employees WHERE Salary > 60000;
SELECT * FROM [Employee Salary Info];
--CREATE VIEW [Employee Department Info] AS SELECT FirstName, LastName, Department FROM Employees WHERE Department='Finance';
SELECT * FROM [Employee Department Info];
--CREATE VIEW [Employee Age Info] AS SELECT FirstName, LastName, Age FROM Employees WHERE Age > 30;
SELECT * FROM [Employee Age Info];

--Executive Stored Procedure--
SELECT * FROM Employees;
CREATE PROCEDURE GetEmployeeByDepartment
    @Department VARCHAR(50)         
AS
BEGIN       
    SELECT * FROM Employees WHERE Department = @Department;
END;

--EXISTS
SELECT * FROM Employees;
SELECT * FROM Employees WHERE EXISTS (SELECT 1 FROM Employees WHERE Department = 'IT');
--EXISTS with subquery  
SELECT * FROM Employees WHERE EXISTS (SELECT 1 FROM Employees WHERE Salary > 80000);   
--NOT EXISTS
SELECT * FROM Employees WHERE NOT EXISTS (SELECT 1 FROM Employees WHERE Department = 'IT'); 


----StudentDetails Database for More Practice------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Create Database StudentDetails--
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M','F')),
    DateOfBirth DATE NOT NULL,
    Email NVARCHAR(100) UNIQUE, --Unique not allowed to insert dublicate value
    Phone NVARCHAR(15),
    Address NVARCHAR(255),
    EnrollmentDate DATE NOT NULL
);

--Create Course Table--
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100) NOT NULL,
    Credits INT NOT NULL CHECK (Credits > 0)
);

--Foreign Key--is links between the table which referes the primary key of the table
--Refrences from the StudentDetails Database table--
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert Students
INSERT INTO Students (FirstName, LastName, Gender, DateOfBirth, Email, Phone, Address, EnrollmentDate)
VALUES 
('John', 'Doe', 'M', '2002-05-14', 'johndoe@email.com', '1234567890', '123 Main St', '2021-09-01'),
('Jane', 'Smith', 'F', '2003-07-21', 'janesmith@email.com', '9876543210', '456 Park Ave', '2022-09-01');

-- Insert Courses
INSERT INTO Courses (CourseName, Credits)
VALUES 
('Database Systems', 3),
('Software Engineering', 4),
('Mathematics', 3);

-- Insert Enrollments
INSERT INTO Enrollments (StudentID, CourseID, Grade)
VALUES 
(1, 1, 'A'),
(1, 3, 'B'),
(2, 2, 'A');

-- Select Data from the tables
SELECT * FROM Students;
SELECT * FROM Courses;  
SELECT * FROM Enrollments;

--Inner Join to retrieve student names with their enrolled courses--
--Inner Join and join will give the same result--
SELECT s.FirstName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

SELECT Students.FirstName, Courses.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

SELECT Students.FirstName, Students.LastName, Enrollments.CourseID, Enrollments.Grade
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

--Left Join to retrieve all students with their enrolled courses (if any)--
SELECT Students.FirstName, Students.LastName, Enrollments.CourseID, Enrollments.Grade
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

--Right Join to retrieve all courses with enrolled students (if any)--  
SELECT Students.FirstName, Students.LastName, Enrollments.CourseID, Enrollments.Grade
FROM Students
RIGHT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

--Full Outer Join to retrieve all students and courses, matching where possible--
SELECT Students.FirstName, Students.LastName, Enrollments.CourseID, Enrollments.Grade
FROM Students
FULL JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

--cross join--
SELECT Students.FirstName, Courses.CourseName ALTERFROM Students 
CROSS JOIN Courses Courses;

--Self Join to find students who have the same last name--
SELECT a.FirstName AS Student1, b.FirstName AS Student2
FROM Students a
INNER JOIN Students b ON a.LastName = b.LastName
WHERE a.StudentID <> b.StudentID;       





