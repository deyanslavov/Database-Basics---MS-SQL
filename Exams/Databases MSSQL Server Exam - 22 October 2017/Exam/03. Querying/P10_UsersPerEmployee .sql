SELECT e.FirstName + ' ' + e.LastName AS Name,
	   COUNT(UserId) AS [Users Number]
  FROM Employees AS e
 LEFT JOIN Reports AS r
    On r.EmployeeId = e.Id
GROUP BY e.FirstName + ' ' + e.LastName
ORDER BY [Users Number] DESC, Name ASC