USE SoftUni

GO  
BACKUP DATABASE SoftUni  
TO DISK = 'E:\SoftUni.Bak'  
   WITH FORMAT,  
      MEDIANAME = 'P21_BackUp',  
      NAME = 'Full Backup of SoftUni';  
GO

UPDATE Employees
SET Salary += Salary * 0.12
WHERE DepartmentID IN (1, 2, 4, 11) 

SELECT Salary FROM Employees

RESTORE DATABASE SoftUni
FROM DISK = 'E:/SoftUni.Bak'