Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key (column with unique values) for this table.
departmentId is a foreign key (reference columns) of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
--------------------------------------------------------------------

with max_sal as
(select d.name Department, e.name Employee, e.salary Salary, rank () over(partition by d.id order by e.salary desc) as rank 
from Employee e
join Department d
on e.departmentId = d.id)

select Department, Employee, Salary
from max_sal
where rank = 1

