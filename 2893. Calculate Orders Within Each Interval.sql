Table: Orders

+-------------+------+ 
| Column Name | Type | 
+-------------+------+ 
| minute      | int  | 
| order_count | int  |
+-------------+------+
minute is the primary key for this table.
Each row of this table contains the minute and number of orders received during that specific minute. The total number of rows will be a multiple of 6.
Write a query to calculate total orders within each interval. Each interval is defined as a combination of 6 minutes.

Minutes 1 to 6 fall within interval 1, while minutes 7 to 12 belong to interval 2, and so forth.
Return the result table ordered by interval_no in ascending order.
---------------------------------
elect ceil(minute/6) as interval_no, sum(order_count) as total_orders
from orders
group by ceil(minute/6) 
order by ceil(minute/6) asc