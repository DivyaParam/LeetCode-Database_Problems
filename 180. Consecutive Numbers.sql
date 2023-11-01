#Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
#In SQL, id is the primary key for this table.
#id is an autoincrement column.
 

#Find all numbers that appear at least three times consecutively.

#Return the result table in any order.
--------------------------------------------------
/* Write your T-SQL query statement below */
with cte as
(select num, LEAD (num, 1) Over(order by id)as one_num_forward, LEAD (num, 2) over (order by id) as two_num_forward
from logs)

select distinct num as ConsecutiveNums from cte where num = one_num_forward and num = two_num_forward
