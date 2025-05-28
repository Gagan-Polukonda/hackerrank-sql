SELECT DISTINCT(City) FROM Station
WHERE City RLIKE '^[^aeiou]'
    OR City RLIKE '[^aeiou]$';
