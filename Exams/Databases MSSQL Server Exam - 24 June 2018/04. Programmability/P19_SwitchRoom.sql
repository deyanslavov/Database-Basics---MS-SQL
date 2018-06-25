CREATE PROCEDURE usp_SwitchRoom(@TripId INT, @TargetRoomId INT)
AS
BEGIN
	DECLARE @tripHotelId INT = (SELECT h.Id 
									  FROM Trips AS t
									  JOIN Rooms AS r
									    ON r.Id = t.RoomId
									  JOIN Hotels AS h
									    ON h.Id= r.HotelId
									 WHERE t.Id = @TripId)

		DECLARE @targetRoomHotelId INT = (SELECT TOP 1 h.Id 
										    FROM Trips AS t
										    JOIN Rooms AS r
										      ON r.Id = t.RoomId
										    JOIN Hotels AS h
										      ON h.Id= r.HotelId
										   WHERE r.Id = @TargetRoomId)
		IF(@targetRoomHotelId <> @tripHotelId)
		BEGIN
			RAISERROR('Target room is in another hotel!', 16, 1)
			RETURN
		END

		DECLARE @targetRoomBeds INT = (SELECT Beds FROM Rooms WHERE Id = @TargetRoomId)

		DECLARE @currentTripBeds INT = (SELECT r.Beds
		                                  FROM Trips AS t
		                                  JOIN Rooms AS r
		                                    ON r.Id = t.RoomId
		                                 WHERE t.Id = @TripId)

       IF(@currentTripBeds < @targetRoomBeds)
	   BEGIN
			RAISERROR('Not enough beds in target room!', 16, 1)
			RETURN
	   END

		UPDATE Trips
		SET RoomId = @TargetRoomId
		WHERE Id = @TripId
END