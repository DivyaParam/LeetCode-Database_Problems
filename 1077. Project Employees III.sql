Table: Project

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+
(project_id, employee_id) is the primary key (combination of columns with unique values) of this table.
employee_id is a foreign key (reference column) to Employee table.
Each row of this table indicates that the employee with employee_id is working on the project with project_id.
---------------------------------------------
with cte as 
(select p.project_id, p.employee_id, rank() over(partition by project_id order by e.experience_years desc) as rank
from project p join employee e on p.employee_id = e.employee_id)

select project_id, employee_id
from cte
where rank = 1
