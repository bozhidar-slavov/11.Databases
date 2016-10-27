USE TelerikAcademy

-- 01.Write a SQL query to find the names and salaries of the employees that take the minimal salary in the company-- .
-- Use a nested SELECT statement.

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary = (SELECT MIN(Salary) FROM Employees)

-- 02.Write a SQL query to find the names and salaries of the employees
-- that have a salary that is up to 10% higher than the minimal salary for the company.

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary < (SELECT MIN(Salary) * 1.1 FROM Employees)

-- 03.Write a SQL query to find the full name, salary and department of the employees
-- that take the minimal salary in their department. Use a nested SELECT statement.

SELECT e.FirstName + ' ' + e.LastName AS [Full Name], e.Salary, d.Name AS [Department]
FROM Employees e, Departments d
WHERE Salary = (SELECT MIN(Salary) FROM Employees s 
	WHERE s.DepartmentID = d.DepartmentID)
ORDER BY d.DepartmentID

-- 04.Write a SQL query to find the average salary in the department #1.

SELECT AVG(Salary) AS [AverageSalary]
FROM Employees
WHERE DepartmentID = 1

-- 05.Write a SQL query to find the average salary in the "Sales" department.

SELECT AVG(e.Salary) AS [AverageSalary]
FROM Employees e, Departments d
WHERE e.DepartmentID = d.DepartmentID AND d.Name = 'Sales'

-- 06.Write a SQL query to find the number of employees in the "Sales" department.

SELECT COUNT(e.FirstName) AS [SalesEmployeeCount]
FROM Employees e, Departments d
WHERE e.DepartmentID = d.DepartmentID AND d.Name = 'Sales'

-- 07.Write a SQL query to find the number of all employees that have manager.

SELECT COUNT(ManagerID) AS [EmployeesThatHaveManager]
FROM Employees

-- 08.Write a SQL query to find the number of all employees that have no manager.

SELECT COUNT(*) AS [EmployeesThatHaveNoManager]
FROM Employees
WHERE ManagerID IS NULL

-- 09.Write a SQL query to find all departments and the average salary for each of them.

SELECT AVG(e.Salary) AS [AverageSalary], d.Name
FROM Employees e, Departments d
WHERE e.AddressID = d.DepartmentID
GROUP BY d.Name
ORDER BY AverageSalary

-- 10.Write a SQL query to find the count of all employees in each department and for each town.

SELECT COUNT(e.FirstName) AS [EmployeesCount], d.Name AS [Department], t.Name AS [Town]
FROM Employees e, Departments d, Towns t, Addresses a
WHERE  e.DepartmentID = d.DepartmentID
	AND e.AddressID = a.AddressID
	AND a.TownID = t.TownID
GROUP BY   t.Name, d.Name

-- 11.Write a SQL query to find all managers that have exactly 5 employees. Display their first name and last name.

SELECT e.FirstName, e.LastName
FROM Employees e, Employees m
WHERE m.ManagerID = e.EmployeeID
GROUP BY e.FirstName, e.LastName
HAVING COUNT(*) = 5

-- 12.Write a SQL query to find all employees along with their managers.
-- For employees that do not have manager display the value "(no manager)".

SELECT e.FirstName + ' ' + e.LastName AS [Employee], ISNULL(m.FirstName + ' ' + m.LastName, '(no manager)') AS [Manager]
FROM Employees e
LEFT OUTER JOIN Employees m
ON e.ManagerID = m.EmployeeID

-- 13.Write a SQL query to find the names of all employees whose last name is exactly 5 characters long.
-- Use the built-in LEN(str) function.

SELECT LastName
FROM Employees
WHERE LEN(LastName) = 5

-- 14.Write a SQL query to display the current date and time in the following format:
-- "day.month.year hour:minutes:seconds:milliseconds".

SELECT CONVERT(VARCHAR, GETDATE(), 104) + ' ' + CONVERT(VARCHAR, GETDATE(), 114) AS [CurrentTime]

-- 15.Write a SQL statement to create a table Users. Users should have username, password, full name and last login time.
-- Choose appropriate data types for the table fields. Define a primary key column with a primary key constraint.
-- Define the primary key column as identity to facilitate inserting records.
-- Define unique constraint to avoid repeating usernames.
-- Define a check constraint to ensure the password is at least 5 characters long.

CREATE TABLE Users
(
	[Id] INT NOT NULL IDENTITY PRIMARY KEY,
	[Username] VARCHAR(50) NOT NULL UNIQUE,
	[Password] NVARCHAR(50) NOT NULL,
	[FullName] NVARCHAR(150) NOT NULL,
	[LastLogin] DATETIME NOT NULL,
	CONSTRAINT [Password] CHECK (LEN(Password) >= 5)
)
GO

-- 16.Write a SQL statement to create a view that displays the users from the Users table that have been in the system today.
-- Test if the view works correctly.

CREATE VIEW [Visitors Today] AS 
SELECT Username 
FROM Users 
WHERE CONVERT(date, LastLogin) = CONVERT(DATE, GETDATE())
GO

-- 17.Write a SQL statement to create a table Groups. Groups should have unique name (use unique constraint).
-- Define primary key and identity column.

CREATE TABLE Groups
 (
	GroupId INT IDENTITY,
	Name NVARCHAR(50) UNIQUE NOT NULL,
	CONSTRAINT PK_Groups PRIMARY KEY(GroupId)
)
GO

-- 18.Write a SQL statement to add a column GroupID to the table Users.
-- Fill some data in this new column and as well in the `Groups table.
-- Write a SQL statement to add a foreign key constraint between tables Users and Groups tables.

ALTER TABLE Users
ADD GroupId INT
GO

ALTER TABLE Users
ADD CONSTRAINT FK_Users_Groups
FOREIGN KEY (GroupId)
REFERENCES Groups(Id)
GO

-- 19.Write SQL statements to insert several records in the Users and Groups tables.

INSERT INTO Groups
VALUES 
(1),
(2),
(3)
GO

INSERT INTO Users
VALUES
('kiro-therock', 'skalatakiro', 'Kiril Valchev', GetDate(), 1),
('pishtova', 'manekenkiii', 'Dimitar Marinov', GetDate(), 2),
('radkoo', '123456789', 'Rado Prashkata', GetDate(), 3)
GO

-- 20.Write SQL statements to update some of the records in the Users and Groups tables.

UPDATE Users
SET FullName = 'Hugh Hefner'
WHERE Id = 2;

-- 21.Write SQL statements to delete some of the records from the Users and Groups tables.

DELETE Users
WHERE Username = 'pishtova'
GO

DELETE Groups
WHERE GroupId = 3
GO

-- 22.Write SQL statements to insert in the Users table the names of all employees from the Employees table.
-- Combine the first and last names as a full name.
-- For username use the first letter of the first name + the last name (in lowercase).
-- Use the same for the password, and NULL for last login time.

INSERT INTO  Users
([FullName], [Username], [Password], [LastLogin])
SELECT e.FirstName + e.LastName, 
e.FirstName + LEFT(e.LastName, 1) + CONVERT(VARCHAR, e.HireDate), 
e.LastName + 'DB4Evaaaa',
GETDATE()
FROM Employees e
GO

-- 23.Write a SQL statement that changes the password to NULL for all users that have not been in the system since 10.03.2010.

UPDATE Users
SET [Password] = 'NULL'
WHERE LastLogin < CONVERT(DATETIME, '2010-03-10')

-- 24.Write a SQL statement that deletes all users without passwords (NULL password).

DELETE FROM Users
WHERE [Password] = 'NULL'

-- 25.Write a SQL query to display the average employee salary by department and job title.

SELECT AVG(e.Salary) AS [AverageSalary], d.Name AS [Department], e.JobTitle
FROM Employees e
	JOIN Departments d
		ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name, e.JobTitle

-- 26.Write a SQL query to display the minimal employee salary by department
-- and job title along with the name of some of the employees that take it.

SELECT MIN(e.Salary) AS [MinimalSalary], d.Name AS [Department], e.JobTitle
FROM Employees e
	JOIN Departments d
		ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name, e.JobTitle

-- 27.Write a SQL query to display the town where maximal number of employees work.

SELECT TOP 1 t.Name AS [Town], COUNT(*) AS [NumberOfEmployees]
FROM Employees e
	JOIN Addresses a
		ON e.AddressID = a.AddressID
	JOIN Towns t
		ON a.TownID = t.TownID
GROUP BY t.Name
ORDER BY COUNT(*) DESC

-- 28.Write a SQL query to display the number of managers from each town.

SELECT t.Name AS [Town], COUNT(DISTINCT e.ManagerID) AS [NumberOfManagers]
FROM Employees e
	JOIN Employees m
		ON e.ManagerID = m.ManagerID
	JOIN Addresses a
		ON m.AddressID = a.AddressID
	JOIN Towns t
		ON a.TownID = t.TownID
GROUP BY t.Name