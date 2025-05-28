SELECT Distinct(company_code)
, company.founder
, count(DISTINCT(lead_manager_code))
, count(DISTINCT(senior_manager_code))
, count(DISTINCT(manager_code))
, count(DISTINCT(employee_code))
FROM employee
    LEFT JOIN company USING(company_code)
GROUP BY 1,2
ORDER BY 1;
