SELECT c.Name,
	   cc.CatCounter
  FROM Categories AS c
  JOIN (SELECT CategoryId,
	   COUNT(CategoryId) AS CatCounter 
  FROM Reports
GROUP BY CategoryId) AS cc
    ON cc.CategoryId = c.Id
ORDER BY cc.CatCounter DESC, c.Name ASC