CREATE TRIGGER T_CloseReport ON Reports 
FOR UPDATE
AS
BEGIN
	UPDATE Reports
	SET StatusId = (SELECT Id FROM Status WHERE Label = 'completed')
	WHERE Id IN (SELECT Id FROM inserted
			     WHERE Id IN (SELECT Id FROM deleted
						      WHERE CloseDate IS NULL)
			           AND CloseDate IS NOT NULL) 
END

DROP TRIGGER tr_ReportsUpdate

UPDATE Reports
SET CloseDate = GETDATE()
WHERE EmployeeId = 25;

SELECT *FROM Reports
