SELECT TOP 1 WITH TIES ct.Name,
	   AVG(f.Rate) AS FeedbackRate 
  FROM Feedbacks AS f
  JOIN Customers AS c
    ON c.Id = f.CustomerId
  JOIN Countries AS ct
    ON ct.Id = c.CountryId
GROUP BY ct.Name
ORDER BY FeedbackRate DESC