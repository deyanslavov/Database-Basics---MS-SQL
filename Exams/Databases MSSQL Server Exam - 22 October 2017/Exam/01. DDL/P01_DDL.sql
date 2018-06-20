CREATE DATABASE ReportService
GO

USE ReportService
GO

CREATE TABLE Departments(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL
)

CREATE TABLE Employees(
    Id INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(25),
    LastName NVARCHAR(25),
    Gender CHAR(1),
    BirthDate DATETIME,
    Age INT,
    DepartmentId INT NOT NULL FOREIGN KEY REFERENCES Departments(Id),
  
  	CONSTRAINT CHK_Employees_Gender CHECK (Gender IN ('M', 'F'))
)  

CREATE TABLE Users(
    Id INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(30) NOT NULL UNIQUE,
    Password NVARCHAR(50) NOT NULL,
    Name NVARCHAR(50),
    Gender CHAR(1), 
    BirthDate DATETIME,
    Age INT,
    Email NVARCHAR(50) NOT NULL,
  
  	CONSTRAINT CHK_Users_Gender CHECK (Gender IN ('M', 'F'))
)

CREATE TABLE Categories(
    Id INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50) NOT NULL,
    DepartmentId INT FOREIGN KEY REFERENCES Departments(Id)
)

CREATE TABLE Status(
    Id INT PRIMARY KEY IDENTITY,
    Label NVARCHAR(30) NOT NULL
)
  
CREATE TABLE Reports(
    Id INT PRIMARY KEY IDENTITY,
    CategoryId INT NOT NULL FOREIGN KEY REFERENCES Categories(Id),
    StatusId INT NOT NULL FOREIGN KEY REFERENCES Status(Id),
    OpenDate DATETIME NOT NULL,
    CloseDate DATETIME,
    Description NVARCHAR(200),
    UserId INT NOT NULL FOREIGN KEY REFERENCES Users(Id),
    EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
  
  	
)