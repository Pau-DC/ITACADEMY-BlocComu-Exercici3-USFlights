/* 1.	Quantitat de registres de la taula de vols: */
SELECT COUNT(*) FROM FLIGHTS;

/* 2.	Retard promig de sortida i arribada segons l’aeroport origen. */
SELECT Origin, AVG(arrDelay), AVG(DepDelay) 
FROM Flights
GROUP BY ORIGIN

/* 3.	Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen. 
A més, volen que els resultat es mostrin de la següent forma (fixa’t en l’ordre de les files): */
SELECT Origin, colYear, colMonth, avg(arrDelay)
FROM Flights
GROUP BY Origin, colYear, colMonth
ORDER BY Origin, colYear, ColMonth

/* 4.	Retard promig d’arribada dels vols, per mesos, anys i segons l’aeroport origen 
(mateixa consulta que abans i amb el mateix ordre). 
Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat. */
SELECT City, colYear, colMonth, avg(arrDelay)
FROM Flights
JOIN USAirports
	WHERE Flights.Origin = USAirports.IATA 
GROUP BY City, colYear, colMonth
ORDER BY City, colYear, ColMonth

/* 5.	Les companyies amb més vols cancelats, per mesos i any. 
A més, han d’estar ordenades de forma que les companyies amb més 
cancel·lacions apareguin les primeres */
SELECT UniqueCarrier, colYear, colMonth, SUM(cancelled) as totalCancelled
FROM Flights
GROUP BY UniqueCarrier
ORDER BY totalCancelled DESC, colYear, ColMonth


/* 6.	L’identificador dels 10 avions que més distància han recorregut fent vols. */
SELECT TailNum, SUM(Distance) as totalDistance
FROM Flights
WHERE TailNum <> ''
GROUP BY TailNum
ORDER BY totalDistance DESC
LIMIT 10;

/* 7.	Companyies amb el seu retard promig només d’aquelles les quals els seus vols
arriben al seu destí amb un retràs promig major de 10 minuts. */
SELECT UniqueCarrier, avg(arrDelay) as avgDelay
FROM Flights
GROUP BY UniqueCarrier
HAVING avgDelay > 10.000
ORDER BY avgDelay DESC