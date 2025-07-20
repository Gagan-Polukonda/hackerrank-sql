WITH tasks AS (
  SELECT Task_ID, Start_Date, End_Date,
    CASE WHEN DATEDIFF(End_Date, LAG(End_Date) OVER (ORDER BY End_Date)) = 1
    THEN 0
    ELSE 1
    END AS new_project
  FROM Projects
),
summation AS (
  SELECT *,
     SUM(new_project) OVER (ORDER BY End_Date) AS project_count
  FROM tasks
),
projects AS (
  SELECT
    project_count,
    MIN(Start_Date) AS project_start_date,
    MAX(End_Date)   AS project_end_date
  FROM summation
  GROUP BY project_count
)

SELECT project_start_date, project_end_date
FROM projects
ORDER BY DATEDIFF(project_end_date, project_start_date) ASC, project_start_date ASC

