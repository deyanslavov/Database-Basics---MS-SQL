SELECT a.CountryName,
	   a.DistributorName
  FROM Countries AS c
  JOIN
(SELECT c.Name AS CountryName,
	   d.Name AS DistributorName,
	   DENSE_RANK() OVER (PARTITION BY d.Name ORDER BY COUNT(*) DESC) AS [Rank]
  FROM Ingredients AS i
 RIGHT JOIN Distributors AS d
    ON d.Id = i.DistributorId
 LEFT JOIN Countries AS c
    ON c.Id = d.CountryId
WHERE d.Name IS NOT NULL
GROUP BY c.Name, d.Name) AS a ON a.CountryName = c.Name
WHERE a.Rank = 1
ORDER BY a.CountryName, a.DistributorName

SELECT * FROM Countries AS c
JOIN Ingredients AS i ON i.OriginCountryId = c.Id
WHERE c.Name = 'Andorra'


SELECT c.Name AS CountryName,
	   d.Name AS DistributorName,
	   DENSE_RANK() OVER (PARTITION BY d.Name ORDER BY COUNT(i.Id) DESC) AS [Rank]
  FROM Ingredients AS i
  JOIN Distributors AS d
    ON d.Id = i.DistributorId
  JOIN Countries AS c
    ON c.Id = d.CountryId
WHERE d.Name IS NOT NULL
GROUP BY c.Name, d.Name


