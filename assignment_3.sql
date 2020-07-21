1. Write a query against the professors table that can output the following
in the result: "Chong works in the Science department"

Answer -
SELECT last_name || 'works in the' || department || 'department'
FROM professors
WHERE last_name = 'Chong'

2. Write a SQL query against the professors table that would return the following
result:

"It is false that professor Chong is highly paid"
"It is true that professor Brown is highly paid"
"It is false that professor Jones is highly paid"
"It is true that professor Wilson is highly paid"
"It is false that professor Miller is highly paid"
"It is true that professor Williams is highly paid"

Answer-
SELECT 'It is'|| (salary > 95000) || 'false that professor' || last_name || 'is highly paid'
FROM professors

NOTE: A professor is highly paid if they make greater than 95000.

3. Write a query that returns all of the records and columns from the professors
table but shortens the department names to only the first three characters in
upper case.
Answer-
SELECT last_name, salary, hire_date, SUBSTRING(UPPER(department), 1, 3)
FROM professors


4. Write a query that returns the highest and lowest salary from the professors
table excluding the professor named 'Wilson'.

Answer-
SELECT max(salary), min(salary)
FROM professors
WHERE last_name != 'Wilson'

5. Write a query that will display the hire date of the professor that has been
teaching the longest.

Answer -
SELECT min(hire_date)
FROM professors
