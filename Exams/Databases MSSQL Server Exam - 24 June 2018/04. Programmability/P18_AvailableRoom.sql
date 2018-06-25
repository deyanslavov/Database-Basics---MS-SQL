CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT)
RETURNS VARCHAR(MAX)
AS
BEGIN
	IF((SELECT r.Id
	  FROM Rooms AS r
	  JOIN Hotels AS h
	    ON h.Id = r.HotelId
	  JOIN Trips AS t
	    ON t.RoomId = r.Id
	 WHERE h.Id = @HotelId AND r.Beds >= @people AND t.ArrivalDate <= @Date AND t.ReturnDate >= @Date AND t.CancelDate IS NULL) IS NOT NULL)
	 BEGIN
		RETURN 'No rooms available'
	 END
	
	DECLARE @roomId INT = (SELECT a.Id FROM (SELECT r.Id, r.Type, r.Beds,
		   MAX(r.Price) AS Price,
		   DENSE_RANK() OVER (ORDER BY MAX(r.Price) DESC) AS Rank,
		   h.Id AS HotelId,
		   t.ArrivalDate,
		   t.ReturnDate
	  FROM Rooms AS r
	  JOIN Hotels AS h
	    ON h.Id = r.HotelId
	  JOIN Trips AS t
	    ON t.RoomId = r.Id
	 WHERE h.Id = @HotelId AND r.Beds >= @People AND t.ArrivalDate > @Date AND t.ReturnDate > @Date AND t.CancelDate IS NULL
	 GROUP BY r.Id, r.Type, r.Beds, h.Id, t.ArrivalDate, t.ReturnDate) AS a WHERE a.Rank = 1)


	DECLARE @roomPrice DECIMAL (14, 2) = (SELECT a.Price FROM (SELECT r.Id, r.Type, r.Beds,
		   MAX(r.Price) AS Price,
		   DENSE_RANK() OVER (ORDER BY MAX(r.Price) DESC) AS Rank,
		   h.Id AS HotelId,
		   t.ArrivalDate,
		   t.ReturnDate
	  FROM Rooms AS r
	  JOIN Hotels AS h
	    ON h.Id = r.HotelId
	  JOIN Trips AS t
	    ON t.RoomId = r.Id
	 WHERE h.Id = @HotelId AND r.Beds >= @People AND t.ArrivalDate > @Date AND t.ReturnDate > @Date AND t.CancelDate IS NULL
	 GROUP BY r.Id, r.Type, r.Beds, h.Id, t.ArrivalDate, t.ReturnDate) AS a WHERE a.Rank = 1)

	DECLARE @roomType VARCHAR(MAX) = (SELECT a.Type FROM (SELECT r.Id, r.Type, r.Beds,
		   MAX(r.Price) AS Price,
		   DENSE_RANK() OVER (ORDER BY MAX(r.Price) DESC) AS Rank,
		   h.Id AS HotelId,
		   t.ArrivalDate,
		   t.ReturnDate
	  FROM Rooms AS r
	  JOIN Hotels AS h
	    ON h.Id = r.HotelId
	  JOIN Trips AS t
	    ON t.RoomId = r.Id
	 WHERE h.Id = @HotelId AND r.Beds >= @People AND t.ArrivalDate > @Date AND t.ReturnDate > @Date AND t.CancelDate IS NULL
	 GROUP BY r.Id, r.Type, r.Beds, h.Id, t.ArrivalDate, t.ReturnDate) AS a WHERE a.Rank = 1)


	DECLARE @roomBeds INT = (SELECT a.Beds FROM (SELECT r.Id, r.Type, r.Beds,
		   MAX(r.Price) AS Price,
		   DENSE_RANK() OVER (ORDER BY MAX(r.Price) DESC) AS Rank,
		   h.Id AS HotelId,
		   t.ArrivalDate,
		   t.ReturnDate
	  FROM Rooms AS r
	  JOIN Hotels AS h
	    ON h.Id = r.HotelId
	  JOIN Trips AS t
	    ON t.RoomId = r.Id
	 WHERE h.Id = @HotelId AND r.Beds >= @People AND t.ArrivalDate > @Date AND t.ReturnDate > @Date AND t.CancelDate IS NULL
	 GROUP BY r.Id, r.Type, r.Beds, h.Id, t.ArrivalDate, t.ReturnDate) AS a WHERE a.Rank = 1)

	 DECLARE @hotelRate DECIMAL (14, 2) = (SELECT a.BaseRate FROM (SELECT r.Id, r.Type, r.Beds,
		   MAX(r.Price) AS Price,
		   DENSE_RANK() OVER (ORDER BY MAX(r.Price) DESC) AS Rank,
		   h.Id AS HotelId,
		   t.ArrivalDate,
		   t.ReturnDate,
		   h.BaseRate
	  FROM Rooms AS r
	  JOIN Hotels AS h
	    ON h.Id = r.HotelId
	  JOIN Trips AS t
	    ON t.RoomId = r.Id
	 WHERE h.Id = @HotelId AND r.Beds >= @People AND t.ArrivalDate > @Date AND t.ReturnDate > @Date AND t.CancelDate IS NULL
	 GROUP BY r.Id, r.Type, r.Beds, h.Id, t.ArrivalDate, t.ReturnDate, h.BaseRate) AS a WHERE a.Rank = 1)

	IF(@roomId IS NULL)
	BEGIN
	 RETURN 'No rooms available'
	END

	RETURN 'Room ' + CAST(@roomId AS VARCHAR(MAX)) + ': ' + @roomType + ' (' + CAST(@roomBeds AS VARCHAR(MAX)) + ' beds) - $' + CAST((@roomPrice + @hotelRate) * @people AS VARCHAR(MAX))
END