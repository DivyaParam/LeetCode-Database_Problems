Table: Student

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| student_name | varchar |
| gender       | varchar |
| dept_id      | int     |
+--------------+---------+
student_id is the primary key (column with unique values) for this table.
dept_id is a foreign key (reference column) to dept_id in the Department tables.
Each row of this table indicates the name of a student, their gender, and the id of their department.
----------------------------------------------------
select d.dept_name, count(student_name) as student_number
from department d
left join student s
on s.dept_id = d.dept_id
group by s.dept_id, d.dept_name
order by student_number desc, dept_name asc
