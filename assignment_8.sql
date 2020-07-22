-- Write a query that finds students who do not take CS180.
A - select student_name
    from students s
    where s.student_no in (select student_no from student_enrollment
                              where course_no != 'CS180');

P- SELECT * FROM students
WHERE student_no NOT IN (
    SELECT student_no
    FROM student_enrollment
    WHERE course_no = 'CS180'
    );
    SELECT s.student_no, s.student_name, s.age
    FROM students s LEFT JOIN student_enrollment se
        ON s.student_no = se.student_no
    GROUP BY s.student_no, s.student_name, s.age
    HAVING MAX(CASE WHEN se.course_no = 'CS180'
               THEN 1 ELSE 0 END) = 0

-- Write a query to find students who take CS110 or CS107 but not both.
A- select student_no, student_name
from students s
where s.student_no not in(select student_no
from student_enrollment
where course_no = 'CS110' and course_no ='CS107' )
and course_no in ('CS110', 'CS107');

P- SELECT s.*
FROM students s, student_enrollment se
WHERE s.student_no = se.student_no
AND se.course_no IN ('CS110', 'CS107')
AND s.student_no NOT IN ( SELECT a.student_no
                          FROM student_enrollment a, student_enrollment b
                          WHERE a.student_no = b.student_no
                          AND a.course_no = 'CS110'
                          AND b.course_no = 'CS107');

                          SELECT s.student_no, s.student_name, s.age
                          FROM students s, student_enrollment se
                          WHERE s.student_no = se.student_no
                          GROUP BY s.student_no, s.student_name, s.age
                          HAVING SUM(CASE WHEN se.course_no IN ('CS110', 'CS107')
                          THEN 1 ELSE 0 END ) = 1
-- Write a query to find students who take CS220 and no other courses.
A- select student_no, student_name
from students s
where s.student_no in (select student_no
                      from (select student_no, count(course_no)
                      from student_enrollment
                      group by student_no
                      having count(course_no) = 1)foo
                      EXCEPT
                      select student_no
                      from student_enrollment
                      where course_no != 'CS220');
P- SELECT s.*
FROM students s, student_enrollment se1,
     (SELECT student_no FROM student_enrollment
      GROUP BY student_no
      HAVING count(*) = 1) se2
WHERE s.student_no = se1.student_no
AND se1.student_no = se2.student_no
AND se1.course_no = 'CS220'

-- Write a query that finds those students who take at most 2 courses. Your
-- query should exclude students that don't take any courses as well as those
-- that take more than 2 course.
A- select student_no, student_name
from students s
where s.student_no in (select student_no
                      from (select student_no, count(course_no)
                      from student_enrollment
                      group by student_no
                      having count(course_no)> 0 and count(course_no)<=2)foo);

P- SELECT s.student_no, s.student_name, s.age
FROM students s, student_enrollment se
WHERE s.student_no = se.student_no
GROUP BY s.student_no, s.student_name, s.age
HAVING COUNT(*) <= 2;

-- Write a query to find students who are older than at most two other students.
select student_name
from ( select student_name, age, RANK() OVER (order by age) from students ) foo
where rank <= 3

SELECT s1.*
FROM students s1
WHERE 2 >= (SELECT count(*)
            FROM students s2
            WHERE s2.age < s1.age)
