Table: Candidate

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| name        | varchar  |
+-------------+----------+
id is the column with unique values for this table.
Each row of this table contains information about the id and the name of a candidate.
----------------------------------------------------------------------------------------------
with cte as
(select count(c.id) as votes, name
from candidate c
left join vote v 
on c.id = v.candidateid
group by c.name)

select top 1 name from cte
order by votes desc
