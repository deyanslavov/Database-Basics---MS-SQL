SELECT e.FirstName,
	   e.LastName,
	   r.Description,
	   FORMAT(r.OpenDate, 'yyyy-MM-dd') AS OpenDate
  FROM Employees AS e
  JOIN Reports AS r
    ON r.EmployeeId = e.Id
ORDER BY e.Id ASC, r.OpenDate ASC, r.Id ASC
