SELECT 
    machine_id,
    ROUND(CAST(AVG(end_time - start_time) AS numeric), 3) AS processing_time
FROM (
    SELECT 
        machine_id, 
        process_id, 
        MAX(CASE WHEN activity_type = 'end' THEN timestamp ELSE NULL END) AS end_time,
        MIN(CASE WHEN activity_type = 'start' THEN timestamp ELSE NULL END) AS start_time
    FROM Activity
    GROUP BY machine_id, process_id
) AS process_times
GROUP BY machine_id
