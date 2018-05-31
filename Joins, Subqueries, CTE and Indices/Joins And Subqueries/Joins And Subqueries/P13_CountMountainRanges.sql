  SELECT mc.CountryCode,
	     COUNT(*) AS MountainRanges
    FROM Mountains AS m
    JOIN MountainsCountries AS mc
      ON mc.MountainId = m.Id
   WHERE mc.CountryCode IN ('BG', 'RU', 'US')
GROUP BY mc.CountryCode