SELECT H.hacker_id, H.name FROM SUBMISSIONS AS S
LEFT JOIN CHALLENGES AS C ON S.challenge_id = C.challenge_id
LEFT JOIN DIFFICULTY AS D ON C.difficulty_level = D.difficulty_level
LEFT JOIN HACKERS AS H ON S.hacker_id = H.hacker_id
WHERE S.score = D.score
GROUP BY H.hacker_id, H.name
HAVING COUNT(DISTINCT S.challenge_id)>1
ORDER BY COUNT(DISTINCT S.challenge_id) DESC, H.hacker_id ASC
