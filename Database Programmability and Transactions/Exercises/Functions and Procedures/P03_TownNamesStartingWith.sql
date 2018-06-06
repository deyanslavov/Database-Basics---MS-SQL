CREATE PROCEDURE usp_GetTownsStartingWith (@startingString VARCHAR(MAX))
			  AS 
			    SELECT [Name]
				  FROM Towns
				 WHERE LEFT([Name], LEN(@startingString)) = @startingString

EXEC usp_GetTownsStartingWith 'be'