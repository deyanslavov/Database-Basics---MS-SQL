SELECT t.Id,
       ac.[Full Name],
	   ac.HomeTown AS [From],
	   c.Name AS [To],
	   Duration =
	    CASE
		 WHEN t.CancelDate IS NOT NULL THEN 'Canceled'
		 ELSE CAST(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate) AS VARCHAR) + ' days'
		END
  FROM Trips AS t
  JOIN Rooms AS r
    ON r.Id = t.RoomId
  JOIN Hotels AS h
    ON h.Id = r.HotelId
  JOIN Cities AS c
    ON c.Id = h.CityId
 RIGHT JOIN AccountsTrips AS at
    ON at.TripId = t.Id
   JOIN (SELECT CASE
		WHEN MiddleName IS NULL THEN CONCAT(a.FirstName, ' ',a.LastName)
		ELSE CONCAT(a.FirstName, ' ', a.MiddleName, ' ', a.LastName)
	   END AS [Full Name],
	   c.Name AS HomeTown,
	   a.Id AS AccId
  FROM Accounts AS a
  JOIN Cities AS c
    ON c.Id = a.CityId) AS ac
	ON ac.AccId = at.AccountId
ORDER BY [Full Name], t.Id