SELECT a.Name, 
		MalePercentage =
					CASE
					 WHEN m.Males = a.AllPeople THEN 100
					 ELSE (m.Males * 100 / a.AllPeople * 100) / 100
					END,
				FemalePercentage =
					CASE
					 WHEN b.Females = a.AllPeople THEN 100
					 ELSE (b.Females * 100 / a.AllPeople * 100) / 100
					END
FROM (SELECT o.TownId,
	   t.Name,
	   COUNT(c.Gender) AS [AllPeople]
  FROM Orders AS o
  JOIN Towns AS t
    ON t.Id = o.TownId
  JOIN Clients AS c
    ON c.Id = o.ClientId AND c.Id IN (SELECT ClientId FROM Orders)
GROUP BY o.TownId, t.Name) AS a
LEFT JOIN (SELECT o.TownId,
		   t.Name,
		   COUNT(c.Gender) AS Females
	  FROM Orders AS o
	  JOIN Towns AS t
	    ON t.Id = o.TownId
	  JOIN Clients AS c
	    ON c.Id = o.ClientId
	WHERE c.Gender = 'f' AND c.Id IN (SELECT ClientId FROM Orders)
	GROUP BY o.TownId, t.Name) AS b
	ON b.Name = a.Name
LEFT JOIN (SELECT o.TownId,
		 			   t.Name,
		 			   COUNT(c.Gender) AS Males
		 		  FROM Orders AS o
		 		  JOIN Towns AS t
		 		    ON t.Id = o.TownId
		 		  JOIN Clients AS c
		 		    ON c.Id = o.ClientId
		 		WHERE c.Gender = 'm' AND c.Id IN (SELECT ClientId FROM Orders)
		 		GROUP BY o.TownId, t.Name) AS m
 ON m.Name = a.Name
 ORDER BY a.Name ASC, a.TownId ASC