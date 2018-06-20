SELECT t.Name,
	   o.OfficesCount 
  FROM Towns AS t
  JOIN (SELECT TownId, COUNT(*) AS OfficesCount FROM Offices
		GROUP BY TownId) AS o
    ON t.Id = o.TownId
ORDER BY o.OfficesCount DESC, t.Name ASC

	