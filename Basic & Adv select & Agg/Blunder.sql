WITH NonZero as(
    SELECT ID, Name
            , REPLACE(Salary, '0', '') ErSalary
    FROM Employees
)

SELECT CEIL(AVG(Salary) - AVG(NonZero.ersalary)) as Averga
FROM EMPLOYEES
    LEFT JOIN NonZero ON employees.id = nonzero.id;
