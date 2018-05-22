USE Minions

CREATE TABLE Users(
	Id INT IDENTITY,
	Username VARCHAR(30) UNIQUE NOT NULL,
	Password VARCHAR(26) NOT NULL,
	ProfilePicture VARCHAR(200),
	LastLoginTime DATE,
	IsDeleted BIT NOT NULL
)

INSERT INTO Users
VALUES ('Coolest Username', 's3cr3tPW', NULL, GETDATE(), 0),
	   ('Ebasi Usera', 'myPassword', 90, GETDATE(), 1),
	   ('Ninja', 'WOOOOOOOOW', NULL, GETDATE(), 0),
	   ('CDew', 'snoopDoggyDog', 1, GETDATE(), 1),
	   ('Charles', 'nadenichka', 200, GETDATE(), 0)

ALTER TABLE USERS  
ADD CONSTRAINT PK_User PRIMARY KEY (Id, Username);

ALTER TABLE Users
ADD CONSTRAINT CHK_PasswordLength CHECK (DATALENGTH(Password) >= 5)

ALTER TABLE Users
ADD DEFAULT GETDATE() FOR LastLoginTime

ALTER TABLE USERS  
DROP CONSTRAINT PK_User

ALTER TABLE USERS  
ADD CONSTRAINT PK_Id PRIMARY KEY (Id);

ALTER TABLE USERS  
ADD CONSTRAINT UNQ_Username UNIQUE (Username);

ALTER TABLE Users
ADD CONSTRAINT CHK_UsernameLength CHECK (DATALENGTH(Username) >= 3)