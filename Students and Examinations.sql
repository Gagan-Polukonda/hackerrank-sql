WITH StudentSubject AS (
    SELECT 
        s.student_id,
        s.student_name,
        sub.subject_name
    FROM students s
    CROSS JOIN subjects sub
),
ExamCounts AS (
    SELECT 
        e.student_id,
        e.subject_name,
        COUNT(*) AS attended_exams
    FROM examinations e
    GROUP BY e.student_id, e.subject_name
)
SELECT 
    ss.student_id,
    ss.student_name,
    ss.subject_name,
    COALESCE(ec.attended_exams, 0) AS attended_exams
FROM StudentSubject ss
LEFT JOIN ExamCounts ec
    ON ss.student_id = ec.student_id
    AND ss.subject_name = ec.subject_name
ORDER BY ss.student_id, ss.subject_name;
