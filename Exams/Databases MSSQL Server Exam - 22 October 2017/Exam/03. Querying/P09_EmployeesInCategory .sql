SELECT c.Name,
	   COUNT(c.DepartmentId) AS [Employees Number]
  FROM Employees AS e
  JOIN Categories AS c
    ON c.DepartmentId = e.DepartmentId
GROUP BY c.Name
ORDER BY c.Name ASC