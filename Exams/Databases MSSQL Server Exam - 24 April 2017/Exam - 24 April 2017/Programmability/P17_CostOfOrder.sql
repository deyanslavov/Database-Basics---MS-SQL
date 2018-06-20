CREATE FUNCTION udf_GetCost (@jobId INT)
RETURNS DECIMAL (14, 2)
AS
BEGIN
	DECLARE @result DECIMAL (14 ,2);
	SET @result = (SELECT ISNULL(SUM(p.Price * op.Quantity) ,0) 
					 FROM Jobs AS j
					 JOIN Orders AS o
					   ON o.JobId = j.JobId
					 JOIN OrderParts AS op
					   ON op.OrderId = o.OrderId
					 JOIN Parts AS p
					   ON p.PartId = op.PartId
					WHERE j.JobId = @jobId)

	 RETURN @result
END

SELECT  dbo.udf_GetCost (3)