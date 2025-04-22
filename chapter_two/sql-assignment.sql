-- sql--
-- 1 Top highest rated driver in nigeria -- 

SELECT DriverID, Name , Rating 
FROM Driver d
ORDER BY  d.Rating DESC
LIMIT 5;