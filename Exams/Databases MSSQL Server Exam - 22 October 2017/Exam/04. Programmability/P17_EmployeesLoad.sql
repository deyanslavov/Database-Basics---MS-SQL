CREATE FUNCTION udf_GetReportsCount (@employeeId INT, @statusId INT) 
RETURNS INT
AS
BEGIN
	DECLARE @result INT = (SELECT COUNT(*)
							 FROM Reports
						    WHERE StatusId = @statusId AND EmployeeId = @employeeId)

	RETURN @result;
END