SELECT a.AccountId,
	   a.Email,
	   a.CountryCode,
	   a.Trips	
  FROM
(SELECT a.Id AS AccountId,
	   a.Email,
	   c.CountryCode,
	   COUNT(t.Id) AS Trips,
	   DENSE_RANK() OVER (PARTITION BY c.CountryCode ORDER BY COUNT(t.Id) DESC, a.Id ASC) AS Ranke
  FROM Accounts AS a
  JOIN AccountsTrips AS at
    ON at.AccountId = a.Id
  JOIN Trips AS t
    ON t.Id = at.TripId
  JOIN Rooms AS r
    ON r.Id = t.RoomId
  JOIN Hotels AS h
    ON h.Id = r.HotelId
  JOIN Cities AS c
    ON c.Id = h.CityId
GROUP BY a.Id, a.Email, c.CountryCode
--HAVING DENSE_RANK() OVER (PARTITION BY c.CountryCode ORDER BY COUNT(t.Id) DESC) = 1
) AS a
WHERE a.Ranke= 1
ORDER BY a.Trips DESC, a.AccountId