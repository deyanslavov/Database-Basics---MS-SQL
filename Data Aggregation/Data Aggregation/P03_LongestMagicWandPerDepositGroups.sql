SELECT * FROM WizzardDeposits

SELECT DepositGroup, 
	   MAX(MagicWandSize) AS LongestMagicWand
  FROM WizzardDeposits 
GROUP BY DepositGroup