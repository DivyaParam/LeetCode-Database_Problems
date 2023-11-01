Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
----------------------------------------------------------------------

with cte as
(select requester_id as id from requestaccepted
union all 
select accepter_id as id from requestaccepted)

select id, count(*) as num from cte
group by id
order by num desc
limit 1