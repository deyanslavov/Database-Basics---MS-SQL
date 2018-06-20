SELECT d.Name,
	   b.AvgTime
  FROM Reports AS r
  JOIN Categories AS c
    ON c.Id = r.CategoryId
  JOIN Departments AS d
    ON d.Id = c.DepartmentId
  JOIN (SELECT d.Id,
			   ISNULL(CAST(AVG(DATEDIFF(DAY, OpenDate, CloseDate)) AS VARCHAR(MAX)), 'no info') AS AvgTime
		  FROM Reports AS r
		  JOIN Categories AS c
		    On c.Id = r.CategoryId
		  JOIN Departments AS d
		    ON d.Id = c.DepartmentId
		GROUP BY d.Id) AS b
	 ON b.Id = d.Id
GROUP BY d.Name, b.AvgTime
ORDER BY d.Name ASC

