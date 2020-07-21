Q - Total count of employees working in each department.
A - SELECT COUNT(employee_id), department
    FROM employees
    WHERE 1 = 1
    GROUP BY department

Q - Max for each department.

    SELECT tmp.max_salary, employees.department
    FROM (SELECT department, max(salary) as max_salary
    	  FROM employees
    	  GROUP BY department
    	 ) tmp JOIN employees ON employees.department = tmp.department AND employees.salary = tmp.max_salary

  Q - How many employees have the same first_name?

  A-  SELECT count(*), first_name
      FROM employees
      WHERE 1 = 1
      GROUP BY first_name
      HAVING count(*) > 1

  Q - Unique department names without using distinct.

  A - SELECT department
      FROM employees
      GROUP BY department
  Q- Unique domain name and how many employees have those domain name.

  A- SELECT substring(email, position('@' IN email) + 1) as domain_name, count(*)
    FROM employees
    WHERE email IS NOT NULL
    GROUP BY domain_name
	  ORDER BY count(*) desc

    Q - Min, max and avg salary broken by region and gender

    SELECT region_id,
          gender,
          min(salary) as min_salary,
          max(salary) as max_salary,
          avg(salary) as avg_salary
    FROM employees
    GROUP BY region_id, gender
    ORDER BY gender DESC, region_id
