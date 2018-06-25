SELECT TOP 10 c.Id,
	   c.Name,
	   SUM(h.BaseRate + r.Price) AS [Total Revenue],
	   COUNT(*) AS Trips
  FROM Cities AS c
  JOIN Hotels AS h
    ON h.CityId = c.Id
  JOIN Rooms AS r
    ON r.HotelId = h.Id
  JOIN Trips AS t
    ON t.RoomId = r.Id
WHERE YEAR(t.BookDate) = 2016
GROUP BY c.Id, c.Name
ORDER BY [Total Revenue] DESC, Trips DESC