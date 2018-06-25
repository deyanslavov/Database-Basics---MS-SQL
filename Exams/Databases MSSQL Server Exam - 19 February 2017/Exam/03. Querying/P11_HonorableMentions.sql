SELECT f.ProductId AS ProductId,
	   CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
	   f.Description	 
  FROM Feedbacks AS f
  JOIN Customers AS c
    ON c.Id = f.CustomerId
  JOIN (SELECT c.Id AS CustomerId,
			   COUNT(f.Id) AS FeedbacksCount 
		  FROM Feedbacks AS f
		  JOIN Customers AS c
		    ON c.Id = f.CustomerId
		GROUP BY c.Id
		HAVING COUNT(f.Id) >= 3) AS fc
	ON fc.CustomerId = c.Id
ORDER BY ProductId ASC, CustomerName ASC, f.Id