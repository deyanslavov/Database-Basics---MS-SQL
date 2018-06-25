SELECT t.Id,
	   h.Name AS HotelName,
	   r.Type AS RoomType,
	   h.BaseRate + r.Price AS Revenue
  FROM Trips AS t
  JOIN Rooms AS r
    ON r.Id = t.RoomId
  JOIN Hotels AS h
    ON h.Id = r.HotelId
GROUP BY t.Id, h.Name, r.Type, h.BaseRate, r.Price
ORDER BY RoomType ASC, t.Id ASC, h.Name DESC