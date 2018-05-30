SELECT DISTINCT s.DepartmentId, 
                s.Salary
   FROM (SELECT e.DepartmentId,
                e.Salary,
                DENSE_RANK()
           OVER (PARTITION BY e.DepartmentID
                     ORDER BY e.Salary DESC) AS SalaryRank
                         FROM [dbo].[Employees] AS e) AS s
  WHERE s.SalaryRank = 3
