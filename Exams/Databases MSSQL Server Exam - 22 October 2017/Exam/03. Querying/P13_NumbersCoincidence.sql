SELECT DISTINCT u.Username
  FROM Users AS u
  JOIN Reports AS r
    ON r.UserId = u.Id
  JOIN Categories AS c
    ON c.Id = r.CategoryId
WHERE (TRY_CAST(LEFT(u.Username, 1) AS INT) IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 0) AND TRY_CAST(LEFT(u.Username, 1) AS INT) = c.Id)
OR (TRY_CAST(RIGHT(u.Username, 1) AS INT) IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 0) AND TRY_CAST(RIGHT(u.Username, 1) AS INT) = c.Id)
ORDER BY u.Username ASC