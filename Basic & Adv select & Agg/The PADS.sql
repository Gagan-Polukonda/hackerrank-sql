SELECT(
    CASE
        WHEN Occupation = 'Doctor' THEN CONCAT(name, '(D)')
        WHEN Occupation = 'Professor' THEN CONCAT(name, '(P)')
        WHEN Occupation = 'Singer' THEN CONCAT(name, '(S)')
        WHEN Occupation = 'Actor' THEN CONCAT(name, '(A)')
    END) AS formatted_name
FROM Occupations
WHERE Occupation IN ('Doctor', 'Professor', 'Singer', 'Actor')
ORDER BY Name;

SELECT
    CONCAT_WS(' ', 'There are a total of', COUNT(*), concat(lower(Occupation), 's.')) AS occupation_count
FROM Occupations
WHERE Occupation IN ('Doctor', 'Professor', 'Singer', 'Actor')
GROUP BY Occupation
ORDER BY COUNT(*);
