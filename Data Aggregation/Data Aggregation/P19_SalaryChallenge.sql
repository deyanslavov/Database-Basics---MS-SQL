SELECT TOP 10 e.FirstName, e.LastName, e.DepartmentID 
	     FROM Employees AS e, (
	   						SELECT DepartmentId AS DepAvgSalaryId, 
	   						       AVG(Salary) AS AvgSalary
	   						FROM Employees
	   						GROUP BY DepartmentID) AS a
	    WHERE e.Salary > a.AvgSalary
	      AND a.DepAvgSalaryId = e.DepartmentID
	 ORDER BY e.DepartmentID