WITH numbered AS (
    SELECT x, y,
    ROW_NUMBER() OVER () AS row_id
    FROM functions
),
comparison AS (
    SELECT f1.x, f1.y
    FROM numbered AS f1
    JOIN numbered AS f2
        ON f1.x = f2.y AND f1.y = f2.x
        AND f1.row_id <> f2.row_id
)

SELECT DISTINCT x, y
FROM comparison
WHERE x <= y
ORDER BY x
