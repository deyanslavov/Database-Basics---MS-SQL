SELECT p.PartId,
	   p.Description,
	   pn.Quantity AS [Required],
	   p.StockQty AS [In Stock],
	   CAST(ISNULL(o.Delivered, 0) AS INT) AS Ordered
  FROM Parts AS p
  JOIN PartsNeeded AS pn
	ON pn.PartId = p.PartId
  JOIN Jobs AS j
    ON j.JobId = pn.JobId
 LEFT JOIN Orders AS o
    ON o.JobId = j.JobId
WHERE j.Status <> 'Finished' AND pn.Quantity > (p.StockQty + ISNULL(o.Delivered, 0))
ORDER BY p.PartId ASC