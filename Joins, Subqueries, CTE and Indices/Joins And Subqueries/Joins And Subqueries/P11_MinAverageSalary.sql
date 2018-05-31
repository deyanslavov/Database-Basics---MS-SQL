SELECT MIN(AvgSalary) AS MinAverageSalary
  FROM (
		SELECT DepartmentID, 
			   AVG(Salary) AS AvgSalary 
		  FROM Employees 
	  GROUP BY DepartmentID) AS AverageSalaries