SELECT * FROM usairlineflights2.flights;

/* 1. Cantidad de registros en la tabla de vuelos*/
SELECT COUNT(*) From usairlineflights2.flights;

/* 2. Retardo Promedio de salida y llegada segun aeropuerto de origen*/
SELECT Origin, AVG (ArrDelay) as Promedio_Llegadas, 
AVG(DepDelay) as Promedio_Partidas
FROM flights GROUP BY (ORIGIN);

/* 3. Retardo promedio de llegada de vuelos, por meses, años y segun aeropuerto de origen */
SELECT Origin, ColYear, ColMonth, AVG (ArrDelay) as Promedio_Llegadas
FROM flights GROUP BY Origin, ColYear, colMonth
ORDER BY Origin, colYear, colMonth ASC;

/*4. Retardo promedio de llegada de vuelos, por meses, años y segun ciudad de origen */
SELECT airports.city, airports.iata, ColYear, ColMonth, AVG (ArrDelay) as Promedio_Llegadas
FROM flights
INNER JOIN airports on flights.origin = airports.iata
GROUP BY city, ColYear, colMonth
ORDER BY city, colyear, colmonth;

/* 5. Compañias con más vuelos cancelados*/
SELECT  UniqueCarrier, count(UniqueCarrier) as Total_Cancelled, Colyear	
from flights 
where cancelled = 1 
Group by (UniqueCarrier)
ORDER BY Total_Cancelled Desc;

/* 6. 10 aviones con más recorrido*/
SELECT TailNum, sum(distance) as SumDist
from Flights
Where TailNum <> ''
group by Tailnum
order by sumdist desc
limit 10;

/* 7. Compañias donde su retraso promedio supera a 10min*/
SELECT UniqueCarrier, avg(ArrDelay) as AvgDelay
from Flights
group by UniqueCarrier
Having AvgDelay > 10
order by AvgDelay desc;




