CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber (@border DECIMAL(18, 4))
			  AS
			    SELECT FirstName,
					   LastName
				  FROM Employees
				 WHERE Salary >= @border

EXEC usp_GetEmployeesSalaryAboveNumber 20000