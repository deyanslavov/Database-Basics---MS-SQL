CREATE PROCEDURE usp_PlaceOrder (@jobId INT, @serialNumber VARCHAR(20), @quantity INT)
AS
	DECLARE @partId INT = (SELECT PartId FROM Parts WHERE SerialNumber = @serialNumber);
	DECLARE @jobOrder INT = (SELECT COUNT(*) FROM Orders WHERE JobId = @jobId);

	IF(@jobOrder <> 0)
	BEGIN
		
	END
SELECT * FROM Jobs
SELECT * FROM Orders
SELECT * FROM Parts
SELECT * FROM OrderParts