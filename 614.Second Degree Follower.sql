Table: Follow

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| followee    | varchar |
| follower    | varchar |
+-------------+---------+
(followee, follower) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates that the user follower follows the user followee on a social network.
There will not be a user following themself.
--------------------------------------------------
# Write your MySQL query statement below
select followee as follower, count(*) as num
from follow
where followee in (select follower from follow)
group by followee
order by followee asc

