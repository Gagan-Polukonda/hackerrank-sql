WITH challenge_counts AS (
  SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS total_challenges
  FROM hackers AS h
  JOIN challenges AS c ON h.hacker_id = c.hacker_id
  GROUP BY h.hacker_id, h.name
),
julia_record AS (
  SELECT
    hacker_id, name, total_challenges,
    MAX(total_challenges) OVER() AS max_count,
    COUNT(*) OVER(PARTITION BY total_challenges) AS freq
  FROM challenge_counts
)

SELECT hacker_id, name, total_challenges 
FROM julia_record
WHERE total_challenges = max_count OR freq=1
ORDER BY total_challenges DESC, hacker_id