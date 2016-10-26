-- 01. Structured Query Language) is a special-purpose programming language designed for managing data
-- held in a relational database management system (RDBMS)
-- DML is abbreviation of Data Manipulation Language. It is used to retrieve, store, 
-- modify, delete, insert and update data in database.
-- Examples: SELECT, UPDATE, INSERT statements
-- DDL is abbreviation of Data Definition Language. It is used to create and modify the structure 
-- of database objects in database.
-- Examples: CREATE, ALTER, DROP statements

-- 02. Transact-SQL (T-SQL) is Microsoft's and Sybase's proprietary extension to SQL. SQL, 
-- the acronym for Structured Query Language, is a standardized computer language that was 
-- originally developed by IBM for querying, altering and defining relational databases, 
-- using declarative statements.

-- Queries can be executed one at the time by selecting the relevant text and pressing F5

USE TelerikAcademy

-- 04.Write a SQL query to find all information about all departments.

SELECT *
FROM Departments

-- 05.Write a SQL query to find all department names.

SELECT Name
FROM Departments

-- 06.Write a SQL query to find the salary of each employee.

SELECT Salary
FROM Employees

-- 07.Write a SQL to find the full name of each employee.

SELECT FirstName + ' ' + LastName AS [FullName]
FROM Employees

-- 08.Write a SQL query to find the email addresses of each employee (by his first and last name).
-- Consider that the mail domain is telerik.com. Emails should look like �John.Doe@telerik.com".
-- The produced column should be named "Full Email Addresses".

SELECT FirstName + '.' + LastName + '@telerik.com' AS [Full Email Addresses]
FROM Employees

-- 09.Write a SQL query to find all different employee salaries.

SELECT DISTINCT Salary
FROM Employees

-- 10.Write a SQL query to find all information about the employees whose job title is �Sales Representative�.

SELECT *
FROM Employees
WHERE JobTitle = 'Sales Representative'

-- 11.Write a SQL query to find the names of all employees whose first name starts with "SA".

SELECT FirstName
FROM Employees
WHERE FirstName LIKE 'SA%'

-- 12.Write a SQL query to find the names of all employees whose last name contains "ei".

SELECT LastName
FROM Employees
WHERE LastName LIKE '%ei%'

-- 13.Write a SQL query to find the salary of all employees whose salary is in the range [20000�30000].

SELECT Salary
FROM Employees
WHERE Salary BETWEEN 20000 AND 30000

-- 14.Write a SQL query to find the names of all employees whose salary is 25000, 14000, 12500 or 23600.

SELECT FirstName + ' ' + LastName AS [FullName], Salary
FROM Employees
WHERE Salary IN (25000, 14000, 12500, 23600)

-- 15.Write a SQL query to find all employees that do not have manager.

SELECT FirstName + ' ' + LastName AS [FullName], ManagerID
FROM Employees
WHERE ManagerID IS NULL

-- 16.Write a SQL query to find all employees that have salary more than 50000. Order them in decreasing order by salary.

SELECT FirstName + ' ' + LastName AS [FullName], Salary
FROM Employees
WHERE Salary > 50000
ORDER BY Salary DESC

-- 17.Write a SQL query to find the top 5 best paid employees.

SELECT TOP 5 FirstName + ' ' + LastName AS [FullName], Salary
FROM Employees
ORDER BY Salary DESC

-- 18.Write a SQL query to find all employees along with their address. Use inner join with ON clause.

SELECT e.FirstName, e.LastName, a.AddressText
FROM Employees e
	INNER JOIN Addresses a
		ON e.AddressID = a.AddressID

-- 19.Write a SQL query to find all employees and their address. Use equijoins (conditions in the WHERE clause).

SELECT e.FirstName, e.LastName, a.AddressText
FROM Employees e, Addresses a
WHERE e.AddressID = a.AddressID

-- 20.Write a SQL query to find all employees along with their manager.

SELECT e.FirstName + ' ' + e.LastName AS [FullName], m.FirstName + ' ' + m.LastName AS [Manager]
FROM Employees e
	LEFT OUTER JOIN Employees m
		ON e.ManagerID = m.EmployeeID

-- 21.Write a SQL query to find all employees, along with their manager and their address. Join the 3 tables: Employees e, Employees m and Addresses a.

SELECT e.FirstName + ' ' + e.LastName AS [Employee],
       m.FirstName + ' ' + m.LastName AS [Manager],
	   a.AddressText AS [Employee Address]
FROM Employees e
	JOIN Employees m
		ON e.ManagerID = m.EmployeeID
			JOIN Addresses a
				ON e.AddressID = a.AddressID

-- 22.Write a SQL query to find all departments and all town names as a single list. Use UNION.

SELECT Name AS [Departments/Towns]
FROM Departments
UNION
SELECT Name AS [Departments/Towns]
From Towns

-- 23.Write a SQL query to find all the employees and the manager for each of them along with the employees that do not have manager.
-- Use right outer join. Rewrite the query to use left outer join.

SELECT m.FirstName + ' ' + m.LastName AS [Manager], e.FirstName + ' ' + e.LastName AS [Employee]
FROM Employees m
	RIGHT OUTER JOIN Employees e
		ON e.ManagerID = m.EmployeeID

-- 24.Write a SQL query to find the names of all employees from the departments "Sales" and "Finance" whose hire year is between 1995 and 2005.

SELECT e.FirstName + ' ' + e.LastName AS [Employee Name], d.Name AS [Department], e.HireDate
FROM Employees e
	JOIN Departments d
		ON e.DepartmentID = d.DepartmentID
WHERE d.Name IN ('Sales', 'Finance')
AND YEAR(e.HireDate) BETWEEN 1995 AND 2005