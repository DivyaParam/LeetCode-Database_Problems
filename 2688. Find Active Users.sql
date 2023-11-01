Table: Users

+-------------+----------+ 
| Column Name | Type     | 
+-------------+----------+ 
| user_id     | int      | 
| item        | varchar  |
| created_at  | datetime |
| amount      | int      |
+-------------+----------+
This table may contain duplicate records. 
Each row includes the user ID, the purchased item, the date of purchase, and the purchase amount.
Write a solution to identify active users. An active user is a user that has made a second purchase within 7 days of any other of their purchases.

For example, if the ending date is May 31, 2023. So any date between May 31, 2023, and June 7, 2023 (inclusive) would be considered "within 7 days" of May 31, 2023.

Return a list of user_id which denotes the list of active users in any order.
-------------------------------------------------------------------------------------
Select distinct u1.user_id
from users u1 inner join users u2
on u1.user_id = u2.user_id
and abs(datediff(u1.created_at, u2.created_at))<=7
and u1.item != u2.item