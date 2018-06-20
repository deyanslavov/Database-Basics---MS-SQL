CREATE PROCEDURE usp_MoveVehicle(@vehicleId INT, @officeId INT)
AS
BEGIN
 BEGIN TRANSACTION
	UPDATE Vehicles
	SET OfficeId = @officeId
	WHERE Id = @vehicleId

	DECLARE @parkingPlaces INT = (SELECT ParkingPlaces FROM Offices WHERE Id = @officeId);
	IF(@parkingPlaces <= (SELECT COUNT(*) FROM Vehicles WHERE OfficeId = @officeId))
	BEGIN
		ROLLBACK;
		RAISERROR('Not enough room in this office!', 15, 1)
		RETURN
	END
 COMMIT
END