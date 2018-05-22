USE Minions

CREATE TABLE People(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(200) NOT NULL,
	Picture VARCHAR(2000),
	Height DECIMAL(5, 2),
	Weight DECIMAL(10, 2),
	Gender CHAR(1) NOT NULL,
	Birthday DATE NOT NULL,
	Biography NVARCHAR(MAX)
)

INSERT INTO People
VALUES ('Deyan', NULL, 170.6, 68.2, 'M', '1997/04/07', 'I want to become a programmer'),
	   ('Beb4o', 670, 180, 88.12, 'M', '1987/08/27', 'Cutest baby'),
	   ('Ice Cube', 1999, 181.6, 91.02, 'M', '1983/10/21', 'Gangsta Rap Made Me Do It'),
	   ('Boryana', NULL, 160.8, 48.1, 'F', '1990/01/29', 'Based in Miami, Florida'),
	   ('Richie Hawtin', 20, 182.67, 54, 'M', '1965/02/02', 'Techno veteran')
