Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
This table may contain duplicates rows. 
customer_id is not NULL.
product_key is a foreign key (reference column) to Product table.
-------------------------------------------------------------------------
with cnt as (select count(distinct product_key) count_prod,customer_id from customer group by customer_id)
select customer_id from cnt where count_prod = (select count(product_key) from product)