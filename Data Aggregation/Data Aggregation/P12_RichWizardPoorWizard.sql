SELECT SUM([Output].[WizzardDepositDifference]) AS 'SumDifference'
FROM (SELECT [DepositAmount] - (SELECT [DepositAmount]
                                  FROM [WizzardDeposits]
                                 WHERE [Id] = [OddIdWizzardDeposit].[Id] + 1) AS [WizzardDepositDifference]
FROM WizzardDeposits AS [OddIdWizzardDeposit]) AS [Output]