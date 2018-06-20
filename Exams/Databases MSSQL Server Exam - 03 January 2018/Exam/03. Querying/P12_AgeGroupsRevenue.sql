SELECT AgeGroup =
		CASE
			WHEN YEAR(c.BirthDate) BETWEEN 1970 AND 1979 THEN '70''s'
			WHEN YEAR(c.BirthDate) BETWEEN 1980 AND 1989 THEN '80''s'
			WHEN YEAR(c.BirthDate) BETWEEN 1990 AND 1999 THEN '90''s'
			ELSE 'Others'
		END,
	   SUM(o.Bill) AS Revenue,
	   AVG(o.TotalMileage) AS AverageMileage
  FROM Orders AS o
  JOIN Clients AS c
    ON c.Id = o.ClientId
GROUP BY (CASE
			WHEN YEAR(c.BirthDate) BETWEEN 1970 AND 1979 THEN '70''s'
			WHEN YEAR(c.BirthDate) BETWEEN 1980 AND 1989 THEN '80''s'
			WHEN YEAR(c.BirthDate) BETWEEN 1990 AND 1999 THEN '90''s'
			ELSE 'Others'
		END)