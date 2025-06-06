SELECT W.ID, WP.AGE, W.COINS_NEEDED, W.POWER
FROM WANDS_PROPERTY AS WP
JOIN WANDS AS W ON WP.CODE=W.CODE
JOIN (
    SELECT W.POWER, WP.AGE, MIN(W.COINS_NEEDED) AS MIN_COINS
    FROM WANDS_PROPERTY AS WP
    JOIN WANDS AS W ON WP.CODE=W.CODE
    WHERE WP.IS_EVIL=0
    GROUP BY W.POWER, WP.AGE
) AS MW ON W.POWER=MW.POWER
AND WP.AGE = MW.AGE
AND W.COINS_NEEDED = MW.MIN_COINS
WHERE WP.IS_EVIL=0
ORDER BY W.POWER DESC, WP.AGE DESC