Table: Steps

+-------------+------+ 
| Column Name | Type | 
+-------------+------+ 
| user_id     | int  | 
| steps_count | int  |
| steps_date  | date |
+-------------+------+
(user_id, steps_date) is the primary key for this table.
Each row of this table contains user_id, steps_count, and steps_date.
Write a solution to calculate 3-day rolling averages of steps for each user.

We calculate the n-day rolling average this way:

For each day, we calculate the average of n consecutive days of step counts ending on that day if available, otherwise, n-day rolling average is not defined for it.
Output the user_id, steps_date, and rolling average. Round the rolling average to two decimal places.

Return the result table ordered by user_id, steps_date in ascending order.
-------------------------------------------
/* Write your T-SQL query statement below */

Select tmp.*,
 avg(steps_count) over(partition by user_id order by user_id, steps_date rows 3 preceding ) as rolling_avg
from (
select user_id,steps_date, sum(steps_count) as steps_count
from steps
group by user_id,steps_date
) tmp