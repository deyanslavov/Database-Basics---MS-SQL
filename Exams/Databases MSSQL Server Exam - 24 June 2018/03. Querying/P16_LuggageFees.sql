SELECT TripId,
	   SUM(Luggage) AS Luggage,
	   Fee = 
	    CASE
			WHEN SUM(Luggage) <= 5 THEN '$0'
			ELSE '$' + CAST(SUM(Luggage) * 5 AS VARCHAR(MAX))
		END
  FROM AccountsTrips
WHERE Luggage > 0
GROUP BY TripId
ORDER BY Luggage DESC