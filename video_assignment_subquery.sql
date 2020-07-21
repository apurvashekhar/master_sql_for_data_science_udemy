Q - All employees who work in kids division and whose hire date is greater than
employees working in Maintenance department.
A -SELECT * FROM employees
WHERE department IN (SELECT department from departments WHERE division = 'Kids')
AND hire_date > ALL(SELECT hire_date from employees WHERE department = 'Maintenance')

Q - Salaries that appear most frequently. - Mode salary

A - SELECT count(*), salary
FROM employees
GROUP BY salary
ORDER BY count(*) DESC, salary DESC
LIMIT 1

Subquery way- SELECT salary FROM (SELECT count(*), salary
FROM employees
GROUP BY salary
ORDER BY count(*) DESC, salary DESC
LIMIT 1) as highest_salary

All way -
SELECT salary
FROM employees
GROUP BY salary
HAVING count(*) >= ALL (SELECT count (*) FROM employees GROUP BY salary )
ORDER BY salary DESC
LIMIT 1

Q - average salary after removing minimum salary and maximum salary

A -
SELECT ROUND(AVG(salary))
FROM employees
WHERE salary NOT IN ((SELECT min(salary) FROM employees)
 (SELECT max(salary) FROM employees))
