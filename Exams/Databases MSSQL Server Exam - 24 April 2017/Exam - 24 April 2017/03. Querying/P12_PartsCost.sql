SELECT ISNULL(SUM(p.Price * op.Quantity), 0) AS Total
  FROM Parts AS p
  JOIN OrderParts AS op
    ON op.PartId = p.PartId
  JOIN Orders AS o
    ON o.OrderId = op.OrderId
WHERE o.IssueDate BETWEEN '2017-04-03' AND '2017-04-24'