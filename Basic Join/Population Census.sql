SELECT SUM(ci.population)
FROM CITY AS ci
JOIN COUNTRY AS co ON ci.countrycode = co.code
WHERE co.continent = 'Asia'