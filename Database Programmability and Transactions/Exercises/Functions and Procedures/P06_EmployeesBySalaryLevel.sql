CREATE PROCEDURE usp_EmployeesBySalaryLevel (@salaryLevel VARCHAR(MAX))
			  AS
				SELECT FirstName,
					   LastName
				  FROM Employees
				 WHERE dbo.ufn_GetSalaryLevel(Salary) = @salaryLevel

EXEC usp_EmployeesBySalaryLevel 'high'