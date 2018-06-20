SELECT *
  FROM Reports

  SELECT * FROM Categories

UPDATE Reports
SET StatusId = 2
WHERE StatusId = 1 AND CategoryId = 4