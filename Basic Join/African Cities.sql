SELECT ci.name
FROM CITY AS ci
JOIN COUNTRY AS co ON ci.countrycode = co.code
WHERE co.continent = 'Africa'