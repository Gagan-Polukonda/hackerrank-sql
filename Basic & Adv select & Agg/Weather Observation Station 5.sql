SELECT City, Length(City)
FROM (
    SELECT City, Length(City)
    FROM Station
    Order By Length(City), City
    Limit 1
) AS ShortestCity
UNION ALL
SELECT City, Length(City)
FROM (
    SELECT City, Length(City)
    FROM Station
    order by Length(City) desc, City
    limit 1
) AS Longest;
