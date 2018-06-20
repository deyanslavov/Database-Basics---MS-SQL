WITH CTE_ModelsCount 
AS
(SELECT m.ModelId,
	   m.Name,
	   COUNT(j.JobId) AS Count,
	   DENSE_RANK() OVER (ORDER BY COUNT(j.JobId) DESC) AS Rank
  FROM Models AS m
  JOIN Jobs AS j
    ON j.ModelId = m.ModelId
	GROUP BY m.Name, m.ModelId)

SELECT mc.Name,
	   mc.Count AS [Times Serviced],
	   ISNULL(SUM(op.Quantity * p.Price), 0) AS [Parts Total] 
  FROM CTE_ModelsCount AS mc
 LEFT JOIN Jobs AS j
    ON j.ModelId = mc.ModelId
 LEFT JOIN Orders AS o
    ON o.JobId = j.JobId
 LEFT JOIN OrderParts AS op
    ON op.OrderId = o.OrderId
 LEFT JOIN Parts AS p
    ON p.PartId = op.PartId
WHERE mc.Rank = 1
GROUP BY mc.Name, mc.Count