CREATE DATABASE CarRental

USE CarRental

CREATE TABLE Categories(
	Id INT PRIMARY KEY NOT NULL,
	CategoryName VARCHAR(50) UNIQUE NOT NULL,
	DailyRate DECIMAL(4, 2),
	WeeklyRate DECIMAL(4, 2),
	MontlyRate DECIMAL (4, 2),
	WeekendRate DECIMAL (4, 2)
)

CREATE TABLE Cars(
	Id INT PRIMARY KEY NOT NULL,
	PlateNumber NVARCHAR(10) UNIQUE NOT NULL,
	Manufacturer VARCHAR(30) NOT NULL,
	Model VARCHAR(20) NOT NULL,
	CarYear INT,
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
	Doors INT,
	Picture VARCHAR(2000),
	Condition VARCHAR(200),
	Available BIT NOT NULL
)

CREATE TABLE Employees(
	Id INT PRIMARY KEY NOT NULL,
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	Title VARCHAR(3) NOT NULL,
	Notes VARCHAR(200)
)

CREATE TABLE Customers(
	Id INT PRIMARY KEY NOT NULL,
	DriverLicenceNumber INT UNIQUE NOT NULL,
	FullName NVARCHAR(60) NOT NULL,
	[Address] VARCHAR(50),
	City VARCHAR(20),
	ZIPCode VARCHAR(10),
	Notes VARCHAR(200)
)

CREATE TABLE RentalOrders(
	Id INT PRIMARY KEY NOT NULL,
	EmployeeId INT FOREIGN KEY REFERENCES Employees (Id),
	CustomerId INT FOREIGN KEY REFERENCES Customers (Id),
	CarId INT FOREIGN KEY REFERENCES Cars (Id),
	TankLevel INT,
	KilometrageStart INT,
	KilometrageEnd INT,
	TotalKilometrage INT,
	StartDate DATE,
	EndDate DATE,
	TotalDays INT,
	RateApplied DECIMAL (4, 2),
	TaxRate DECIMAL (4, 2),
	OrderStatus BIT NOT NULL,
	Notes VARCHAR(200)
)

INSERT INTO Categories
VALUES (1, 'SportCar', 7.2, 7.1, 6.0, 8.1),
       (2, 'Gazariya', NULL, NULL, NULL, NULL),
	   (3, 'Cabrio', 9.8, 7.9, 8.9, 8.5)
	   
INSERT INTO Cars
VALUES (1, 'UK12421S', 'Porsche', 'Cayen Turbo S', 2016, 1, 2, NULL, 'Perfect', 1),
       (2, 'CLF83129', 'Mercedes', 'SLK 222', 2017, 3, 4, 75, 'Excellent', 1),
	   (3, 'SF43223CL', 'BMW', 'E36', 2010, 2, 4, 173, 'Troshlyak', 0)

INSERT INTO Employees
VALUES (1, 'I am', 'Employee1', 'Mr', NULL),
	   (2, 'Nyama', 'Ime', 'Mrs', 'sexy and blonde'),
	   (3, 'Kiro', 'Kartacha', 'Mr', 'bachka qko')

INSERT INTO Customers
VALUES (1, 1254562, 'Crazy Driver', 'bul. Bulgaria', 'Sofia',1000, NULL),
	   (2, 6542135, 'Marusha Ivanova', 'bul. Dondukov', 'Plovid', 1423, NULL),
	   (3, 9574234, 'Petko Milev', 'bul. Tsarigradsko Shose', 'Varna', 1686, NULL)

INSERT INTO RentalOrders
VALUES (1, 1, 1, 3, 120, 200000, 400000, 999999, GETDATE(), NULL, 100, 7.9, 4.5, 1, 'No notes'),
	   (2, 3, 2, 1, 155, 102300, 500000, 999999, GETDATE(), NULL, 10, 8.1, 5.6, 0, 'Renter is a rich guy'),
	   (3, 2, 3, 2, 164, 353442, 700000, 999999, GETDATE(), NULL, 192, 5.7, 1.9, 1, 'No notes')