SELECT d.Name,
	   a.IngredientName,
	   a.ProductName,
	   a.AvgRate
  FROM Distributors AS d
  JOIN (SELECT i.Name AS IngredientName,
	   i.DistributorId,
	   p.Name AS ProductName,
	   AVG(f.Rate) AS AvgRate
  FROM Feedbacks AS f
  JOIN Products AS p
    ON p.Id = f.ProductId
  JOIN ProductsIngredients AS pi
    ON pi.ProductId = p.Id
  JOIN Ingredients AS i
    ON i.Id = pi.IngredientId
GROUP BY i.Name, i.DistributorId, p.Name
HAVING AVG(f.Rate) BETWEEN 5 AND 8) AS a
   ON a.DistributorId = d.Id
ORDER BY d.Name ASC, a.IngredientName ASC, a.ProductName ASC

	SELECT * 
	  FROM Products
	  SELECT *
	  FROM Feedbacks