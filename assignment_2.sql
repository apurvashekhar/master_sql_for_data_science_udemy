Q- Write a query to display the names of those students that are between
the ages of 18 and 20.
A - SELECT student_name
    FROM Students
    WHERE age >= 18 AND age <=20

Q -Write a query to display all of those students that contain the letters
"ch" in their name or their name ends with the letters  "nd".
A - SELECT student_name
    FROM Students
    WHERE student_name LIKE '%ch%' OR '%nd'

Q -Write a query to display the name of those students that have the letters
"ae" or "ph" in their name and are NOT 19 years old.
A - SELECT *
    FROM Students
    WHERE student_name LIKE '%ae%' OR '%ph%' AND (age != 19)

Q -Write a query that lists the names of students sorted by their age from
largest to smallest.
A - SELECT student_name
    FROM Students
    WHERE 1 = 1
    ORDER BY age DESC

Q -Write a query that displays the names and ages of the top 4 oldest students.
A - SELECT student_name, age
    FROM Students
    WHERE 1 = 1
    ORDER BY age DESC
    LIMIT 4

Q -Write a query that returns students based on the following criteria:

The student must not be older than age 20 if their student_no is either
between 3 and 5 or their student_no is 7. Your query should also return students
older than age 20 but in that case they must have a student_no that is at least
4.

A - SELECT *
    FROM Students
    WHERE (age > 20 AND (student_no BETWEEN 3 AND 5 OR student_no == 7))
    OR (age < 20 AND student_no >=4)
