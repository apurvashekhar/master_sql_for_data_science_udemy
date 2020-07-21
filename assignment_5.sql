Q -Is the students table directly related to the courses table? Why or why not?

A-  No, because they don not have any common columns.

Q -Using subqueries only, write a SQL statement that returns the names of those
students that are taking the courses Physics and US History.

NOTE: Do not jump ahead and use joins. I want you to solve this problem using
only what you have learned in this section.

A -
SELECT student_name
FROM students
WHERE student_no IN (SELECT student_no FROM (SELECT student_no , course_no
					           FROM student_enrollment
					           WHERE course_no IN (SELECT course_no
                                          FROM Courses
                                          WHERE course_title
                                          IN ('Physics', 'US History'))) base_table)




Q -Using subqueries only, write a query that returns the name of the student
that is taking the highest number of courses.

NOTE: Do not jump ahead and use joins. I want you to solve this problem using
only what you have learned in this section.

 A -
SELECT student_name
FROM students
WHERE student_no IN (SELECT student_no
FROM student_enrollment
GROUP BY student_no
ORDER BY count(*) desc
LIMIT 1)


Q -Answer TRUE or FALSE for the following statement:

Subqueries can be used in the FROM clause and the WHERE clause but cannot be
used in the SELECT Clause.

A - FALSE

Q -Write a query to find the student that is the oldest. You are not allowed to
use LIMIT or the ORDER BY clause to solve this problem.

A -
SELECT student_name , age
FROM students
WHERE age IN (SELECT max(age) FROM students) 
