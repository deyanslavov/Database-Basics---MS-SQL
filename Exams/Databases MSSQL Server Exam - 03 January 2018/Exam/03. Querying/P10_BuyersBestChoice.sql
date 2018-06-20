   SELECT m.Manufacturer,
		  m.Model,
		  ISNULL(COUNT(o.VehicleId), 0) AS TimesOrdered
	 FROM Vehicles AS v
FULL JOIN Orders AS o 
	   ON v.Id = o.VehicleId
     JOIN Models AS m 
	   ON m.id = v.ModelId
 GROUP BY m.id,
          m.Model,
          m.Manufacturer
 ORDER BY TimesOrdered DESC,
          m.Manufacturer DESC,
          m.Model;