SELECT c.Name,
	   ISNULL(q.Hotels, 0) AS Hotels
  FROM Cities AS c
 LEFT JOIN
(SELECT c.Name AS City,
	   COUNT(c.Id) AS Hotels
  FROM Cities AS c
  JOIN Hotels AS h
    ON h.CityId = c.Id
GROUP BY c.Name) AS q
   ON q.City = c.Name
ORDER BY Hotels DESC, c.Name