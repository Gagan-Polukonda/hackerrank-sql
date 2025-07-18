SELECT ms.hacker_id, ms.name, SUM(ms.max_score) AS total_score
FROM (
    SELECT s.hacker_id, h.name, s.challenge_id, MAX(s.score) AS max_score
    FROM submissions AS s
    JOIN hackers AS h ON h.hacker_id = s.hacker_id
    GROUP BY s.hacker_id, s.challenge_id, h.name
) AS ms
GROUP BY ms.hacker_id, ms.name
HAVING SUM(ms.max_score) > 0
ORDER BY total_score DESC, ms.hacker_id ASC;

/*CTE QUERY: SINCE THE BELOW QUERY IS GETTING REJECTED , USED THE SUB-QUERY METHOD*/
-- WITH maxi_scores AS (
--     SELECT s.hacker_id, h.name, s.challenge_id, MAX(s.score) AS max_score
--     FROM submissions AS s
--     JOIN hackers AS h
--       ON h.hacker_id = s.hacker_id
--     GROUP BY s.hacker_id, s.challenge_id, h.name
-- )

-- SELECT hacker_id, name, SUM(max_score) AS total_score
-- FROM maxi_scores
-- GROUP BY hacker_id, name
-- HAVING total_score > 0
-- ORDER BY total_score DESC, hacker_id ASC;
-- SELECT VERSION(); -- < 5.7.27-0ubuntu0.18.04.1 