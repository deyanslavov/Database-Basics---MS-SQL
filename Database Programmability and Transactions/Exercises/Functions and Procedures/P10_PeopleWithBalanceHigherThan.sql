CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan (@amount DECIMAL(14, 2))
		      AS
			    SELECT ah.FirstName,
					   ah.LastName
				  FROM AccountHolders AS ah
				  JOIN (SELECT a.AccountHolderId
					      FROM Accounts AS a
					  GROUP BY a.AccountHolderId
					  HAVING SUM(a.Balance) > @amount) AS ab
							ON ab.AccountHolderId = ah.Id
				ORDER BY ah.LastName ASC, ah.FirstName ASC

EXEC usp_GetHoldersWithBalanceHigherThan 1000000