WITH salary_comparision AS (
    SELECT f.id, f.friend_id,
    friend_packages.salary as friend_salary, 
    bfriend_packages.salary as bfriend_salary,
    CASE
        WHEN bfriend_packages.salary>friend_packages.salary THEN f.friend_id
        ELSE 'Equal'
    END AS comparision
    FROM friends AS f
    JOIN packages AS friend_packages ON f.id = friend_packages.id
    JOIN packages AS bfriend_packages ON f.friend_id = bfriend_packages.id
)
SELECT s.name
FROM students AS s
JOIN salary_comparision AS sc ON s.id = sc.id
WHERE sc.comparision!='Equal'
ORDER BY sc.bfriend_salary