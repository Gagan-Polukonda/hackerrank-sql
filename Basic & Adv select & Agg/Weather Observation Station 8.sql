SELECT distinct(city) FROM Station
WHERE City RLIKE '^[aeiou]' AND City RLIKE '[aeiou]$'
