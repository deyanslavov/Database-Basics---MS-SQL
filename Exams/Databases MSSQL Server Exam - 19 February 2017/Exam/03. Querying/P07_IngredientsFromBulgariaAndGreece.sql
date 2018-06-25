SELECT TOP 15  i.Name,
	    	   i.Description,
	    	   c.Name
	      FROM Ingredients AS i
	      JOIN Countries AS c
	        ON c.Id = i.OriginCountryId
	    WHERE i.OriginCountryId IN (SELECT Id FROM Countries WHERE Name IN ('Bulgaria', 'Greece'))
	    ORDER BY i.Name ASC, c.Name ASC