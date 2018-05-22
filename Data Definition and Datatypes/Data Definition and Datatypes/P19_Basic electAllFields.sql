CREATE DATABASE SoftUni

USE SoftUni

CREATE TABLE Towns(
	Id INT PRIMARY KEY IDENTITY,
	Name VARCHAR(30) NOT NULL
)

CREATE TABLE Addresses(
	Id INT PRIMARY KEY IDENTITY,
	AddressText VARCHAR(MAX) NOT NULL,
	TownId INT FOREIGN KEY REFERENCES Towns (Id)
)

CREATE TABLE Departments(
	Id INT PRIMARY KEY IDENTITY,
	Name VARCHAR(30) NOT NULL
)

CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(20) NOT NULL,
	MiddleName VARCHAR(20),
	LastName VARCHAR(20) NOT NULL,
	JobTitle VARCHAR(100) NOT NULL,
	DepartmentId INT FOREIGN KEY REFERENCES Departments (Id),
	HireDate DATE NOT NULL,
	Salary DECIMAL (15, 2) NOT NULL,
	AddressId INT FOREIGN KEY REFERENCES Addresses (Id)
)
 
GO  
BACKUP DATABASE SoftUni  
TO DISK = 'E:\SoftUni.Bak'  
   WITH FORMAT,  
      MEDIANAME = 'Z_SQLServerBackups',  
      NAME = 'Full Backup of SoftUni';  
GO

DROP DATABASE SoftUni

RESTORE DATABASE SoftUni
FROM DISK = 'E:/SoftUni.Bak'

USE SoftUni

INSERT INTO Towns
VALUES ('Sofia'),
	   ('Plovid'),
	   ('Varna'),
	   ('Burgas')

INSERT INTO Departments
VALUES ('Engineering'),
	   ('Sales'),
	   ('Marketing'),
	   ('Software Development'),
	   ('Quality Assurance')

INSERT INTO Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary)
VALUES ('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '02-01-2013', '3500.00'),
	   ('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '03-02-2004', '4000.00'),
	   ('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '08-28-2016', '525.25'),
	   ('Georgi', 'Teziev', 'Ivanov', 'CEO', 2, '12-09-2007', '3000.00'),
	   ('Peter', 'Pan', 'Pan', 'Intern', 3, '08-28-2016', '599.88')

SELECT * FROM Towns

SELECT * FROM Departments

SELECT * FROM Employees

SELECT * FROM Towns
ORDER BY Name ASC

SELECT * FROM Departments
ORDER BY Name ASC

SELECT * FROM Employees
ORDER BY Salary DESC

SELECT Name FROM Towns
ORDER BY Name ASC

SELECT Name FROM Departments
ORDER BY Name ASC

SELECT FirstName, LastName, JobTitle, Salary FROM Employees
ORDER BY Salary DESC

UPDATE Employees
SET Salary += Salary * 0.10

SELECT Salary FROM Employees

USE Hotel

UPDATE Payments
SET TaxRate -= TaxRate * 0.03

SELECT TaxRate FROM Payments

TRUNCATE TABLE Occupancies