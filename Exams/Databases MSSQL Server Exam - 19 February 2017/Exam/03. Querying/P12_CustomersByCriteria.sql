SELECT c.FirstName,
	   c.Age,
	   c.PhoneNumber
  FROM Customers AS c
  JOIN Countries AS ct
    ON c.CountryId = ct.Id
WHERE c.Age >= 21 AND 
(c.FirstName LIKE '%an%' OR c.PhoneNumber LIKE '%38') AND 
c.Id <> (SELECT Id FROM Countries WHERE Name = 'Greece')
ORDER BY c.FirstName ASC, c.Age DESC