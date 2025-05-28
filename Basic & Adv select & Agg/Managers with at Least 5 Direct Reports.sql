select a.name
from employee a
    left join employee b on a.id = b.managerId
GROUP BY a.id, a.name
HAVING COUNT(b.managerid) >= 5;
