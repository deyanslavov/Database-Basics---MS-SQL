SELECT DISTINCT c.Name
  FROM Reports AS r
  JOIN Categories AS c
    ON r.CategoryId = c.Id
  JOIN Users AS u
    On u.Id = r.UserId
WHERE DATEPART(DAY,r.OpenDate) = DATEPART(DAY,u.BirthDate) AND DATEPART(MONTH, r.OpenDate) = DATEPART(MONTH, u.BirthDate)
ORDER BY c.Name ASC