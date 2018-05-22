CREATE DATABASE Hotel

USE Hotel

CREATE TABLE Employees(
	Id INT PRIMARY KEY NOT NULL,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	Title VARCHAR(5),
	Notes VARCHAR(200)
)

CREATE TABLE Customers(
	AccountNumber INT PRIMARY KEY NOT NULL,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	PhoneNumber INT,
	EmergencyName VARCHAR(20),
	EmergencyNumber INT,
	Notes VARCHAR(200)
)

CREATE TABLE RoomStatus(
	RoomStatus VARCHAR(50) NOT NULL,
	Notes VARCHAR(200)
)

CREATE TABLE RoomTypes(
	RoomType VARCHAR(50) NOT NULL,
	Notes VARCHAR(200)
)

CREATE TABLE BedTypes(
	BedType VARCHAR(50) NOT NULL,
	Notes VARCHAR(200)
)

CREATE TABLE Rooms(
	RoomNumber INT PRIMARY KEY NOT NULL,
	RoomType VARCHAR(50) NOT NULL,
	BedType VARCHAR(50) NOT NULL,
	Rate DECIMAL (4, 2),
	RoomStatus VARCHAR(50) NOT NULL,
	Notes VARCHAR(200)
)

CREATE TABLE Payments(
	Id INT PRIMARY KEY NOT NULL,
	EmployeeId INT FOREIGN KEY REFERENCES Employees (Id),
	PaymentDate DATE DEFAULT GETDATE(),
	AccountNumber INT FOREIGN KEY REFERENCES Customers (AccountNumber),
	FirstDateOccupied DATE DEFAULT GETDATE(),
	LastDateOccupied DATE,
	TotalDays INT NOT NULL,
	AmountCharged DECIMAL (15, 2) NOT NULL,
	TaxRate DECIMAL (4, 2) NOT NULL,
	TaxAmount DECIMAL (15, 2) NOT NULL,
	PaymentTotal DECIMAL (15, 2) NOT NULL,
	Notes VARCHAR(200)
)

CREATE TABLE Occupancies (
	Id INT PRIMARY KEY NOT NULL,
	EmployeeId INT FOREIGN KEY REFERENCES Employees (Id),
	DateOccupied DATE NOT NULL,
	AccountNumber INT FOREIGN KEY REFERENCES Customers (AccountNumber),
	RoomNumber INT FOREIGN KEY REFERENCES Rooms (RoomNumber),
	RateApplied DECIMAL (4, 2),
	PhoneCharge DECIMAL (15, 2),
	Notes VARCHAR(200)
)

INSERT INTO Employees
VALUES (1, 'Lara', 'Snejeva', 'Mrs.', 'Employee of the month - March 2018'),
	   (2, 'Jeko', 'Snejev', 'Mr.', 'Very lazy'),
	   (3, 'Mitko', 'Gospodinov', 'Ms.', NULL)

INSERT INTO Customers
VALUES (1, 'Atanaska', 'Tusheva', 088123433, 'Naska', 112, 'Dirty'),
	   (2, 'Stela', 'Miteva', 08931273, 'Stelka', 654, 'Loyal Customer'),
	   (3, 'Boris', 'Dimitrov', 01553444, 'Borischo', 123, 'First time in the hotel')

INSERT INTO RoomStatus
VALUES ('Vacant', 'The rooms is ready for the guests.'),
	   ('Unavailable', 'The rooms has to be cleaned.'),
	   ('Taken', 'The rooms is occupied.')

INSERT INTO RoomTypes
VALUES ('Studio', 'Last floor'),
       ('Apartment', '55 sq.m.'),
	   ('Single Room', NULL)

INSERT INTO BedTypes
VALUES ('Single', NULL),
	   ('Double', NULL),
	   ('King', NULL)

INSERT INTO Rooms
VALUES (1, 'Studio', 'Double', 7.8, 'Taken', NULL),
	   (2, 'Apartment', 'King', 9.8, 'Vacant', NULL),
	   (3, 'Single Room', 'Single', 8.1, 'Unavailable', NULL)

INSERT INTO Payments
VALUES (1, 2, '2018-03-28', 3, '2018-05-21', '2018-05-31', 10, 354.54, 2.3, 30, 374.54, NULL),
	   (2, 1, '2018-07-05', 1, '2018-07-08', '2018-07-12', 4, 154.54, 2.3, 30, 374.54, NULL),
	   (3, 3, '2018-01-01', 2, '2018-03-11', '2018-03-15', 4,  283.54, 2.3, 30, 374.54, NULL)

INSERT INTO Occupancies
VALUES (1, 2, GETDATE(), 3, 2, 7.9, 5, NULL),
	   (2, 1, GETDATE(), 2, 3, 6.9, 5.78, NULL),
	   (3, 3, GETDATE(), 1, 1, 7.2, 4.23, NULL)