CREATE DATABASE Movies

CREATE TABLE Directors(
	Id INT PRIMARY KEY IDENTITY,
	DirectorName VARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Genres(
	Id INT PRIMARY KEY IDENTITY,
	GenreName VARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Categories(
	Id INT PRIMARY KEY IDENTITY,
	CategoryName VARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Movies(
	Id INT PRIMARY KEY IDENTITY,
	Title VARCHAR(50) NOT NULL,
	DirectorId INT FOREIGN KEY REFERENCES Directors(Id),
	CopyrightYear DATE,
	Length INT NOT NULL,
	GenreId INT FOREIGN KEY REFERENCES Genres(Id),
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	Rating DECIMAL(4,2),
	Notes VARCHAR(MAX)
)

INSERT INTO Directors
VALUES ('Max Wilkom', NULL),
	   ('John G', '60KK'),
	   ('Beb4o', 'Where is my baby?'),
	   ('Cool Kid', 'Doesn''t sleep'),
	   ('Rave', 'Mode ON')

INSERT INTO Genres
VALUES ('Comedy', NULL),
	   ('Techno', 'Devil''s music'),
	   ('Drama', 'Queen'),
	   ('Action', NULL),
	   ('Boring Movie', NULL)

INSERT INTO Categories
VALUES ('Cat', 'Majestic'), 
	   ('For kids', 'Only kids'),
	   ('Adults', NULL),
	   ('Family', NULL),
	   ('XXX', '+18')

INSERT INTO Movies
VALUES ('La Que Se Avecina', 5, NULL, 212321, 3, 2, 10.00, 'so fun'),
	   ('Star Wars', 2, GETDATE(), 210, 1, 4, 1.2, 'such a bullshit'),
	   ('Revengers', 3, NULL, 20, 2, 5, 8, 'stava'),
	   ('Scavengers', 4, GETDATE(), 210, 4, 2, 6.5, 'not recommended'),
	   ('Lost', 1, GETDATE(), 280, 2, 1, 8.2, 'worth to see')