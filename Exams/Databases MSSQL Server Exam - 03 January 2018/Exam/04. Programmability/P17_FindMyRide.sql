CREATE FUNCTION udf_CheckForVehicle(@townName VARCHAR(MAX), @seatsNumber INT)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @townId INT = (SELECT Id FROM Towns WHERE Name = @townName);
	
	DECLARE @result VARCHAR(MAX) = (SELECT TOP 1 o.Name + ' - ' + m.Model AS Result  
									  FROM Vehicles AS v
									  JOIN Models AS m
									    ON m.Id = v.ModelId
									  JOIN Offices AS o
									    ON o.Id = v.OfficeId
									 WHERE v.OfficeId IN (SELECT Id FROM Offices WHERE TownId = @townId) AND m.Seats = @seatsNumber
									 ORDER BY o.Name ASC)

	IF(@result IS NULL)
	BEGIN
		RETURN 'NO SUCH VEHICLE FOUND';
	END

	RETURN @result
END