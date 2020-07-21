-- Are the tables student_enrollment and professors directly related to each
-- other? Why or why not?
select * from student_enrollment
select * from professors

-- Write a query that shows the student's name, the courses the student is
-- taking and the professors that teach that course.

select student_name , se.student_no , course_title , last_name
from students s, student_enrollment se , courses c, teach t
where s.student_no = se.student_no
and se.course_no = c.course_no
and se.course_no = t.course_no
order by student_name

-- If you execute the query from the previous answer, you'll notice the
-- student_name and the course_no is being repeated. Why is this happening?
Because different professors teach same subject

-- In question 3 you discovered why there is repeating data. How can we
-- eliminate this redundancy? Let's say we only care to see a single professor
-- teaching a course and we don't care for all the other professors that teach
-- the particular course. Write a query that will accomplish this so that every
--  record is distinct.

-- HINT: Using the DISTINCT keyword will not help. :-)



-- In the video lectures, we've been discussing the employees table and the
-- departments table. Considering those tables, write a query that returns
-- employees whose salary is above average for their given department.

select *
from employees e
where salary > (select avg(salary) from employees e1 where e.department = e1.department)
order by department

-- Write a query that returns ALL of the students as well as any courses they
-- may or may not be taking. 
select s.student_no, student_name, se.course_no, c.course_no, c.course_title
from students s full outer join student_enrollment se
on s.student_no = se.student_no
full outer join courses c on se.course_no = c.course_no
order by student_no
