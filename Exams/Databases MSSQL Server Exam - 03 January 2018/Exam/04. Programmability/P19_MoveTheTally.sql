CREATE TRIGGER tr_AddMileage ON Orders
AFTER UPDATE
AS
	DECLARE @totalMileageBeforeUpdate INT = (SELECT TotalMileage FROM deleted);
	DECLARE @id INT = (SELECT VehicleId FROM inserted);

	IF(@totalMileageBeforeUpdate IS NULL)
	BEGIN
		DECLARE @totalMileageAfterUpdate INT = (SELECT TotalMileage FROM inserted)

		UPDATE Vehicles
		SET Mileage+= @totalMileageAfterUpdate
		WHERE Id = @id
	END