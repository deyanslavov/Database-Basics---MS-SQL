CREATE PROCEDURE usp_AssignEmployeeToReport(@employeeId INT, @reportId INT)
AS
BEGIN
	BEGIN TRANSACTION
		UPDATE Reports
		SET EmployeeId = @employeeId
		WHERE Id = @reportId

		DECLARE @categoryId INT = (SELECT CategoryId FROM Reports WHERE Id = @reportId);
		DECLARE @categoryDepartmentId INT = (SELECT DepartmentId FROM Categories WHERE Id = @categoryId);
		DECLARE @employeeDepartmentId INT = (SELECT DepartmentId FROM Employees WHERE Id = @employeeId);
		IF(@categoryDepartmentId <> @employeeDepartmentId)
		BEGIN
			ROLLBACK;
			RAISERROR('Employee doesn''t belong to the appropriate department!', 16, 1);
			RETURN;
		END
	COMMIT
END