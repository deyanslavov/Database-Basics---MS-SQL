SELECT t.Name AS TownName,
	   o.Name AS OfficeName,
	   o.ParkingPlaces
  FROM Offices AS o
  JOIN Towns AS t
    On t.Id = o.TownId
WHERE o.ParkingPlaces > 25
ORDER BY t.Name ASC, o.Id ASC