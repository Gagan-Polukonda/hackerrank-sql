SELECT current_day.id as Id
FROM Weather AS current_day
WHERE EXISTS (
    SELECT *
    FROM Weather AS yesterday
    WHERE current_day.temperature > yesterday.temperature
    AND current_day.recordDate = yesterday.recordDate + 1
)
