CREATE FUNCTION ufn_GetSalaryLevel (@salary DECIMAL(18,4))
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @result VARCHAR(MAX);
	IF(@salary < 30000)
	BEGIN
		SET @result = 'Low'
	END
	ELSE IF(@salary BETWEEN 30000 AND 50000)
	BEGIN
		SET @result = 'Average'
	END
	ELSE SET @result = 'High'
	RETURN @result;
END
GO