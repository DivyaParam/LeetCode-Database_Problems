Table: Insurance

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| pid         | int   |
| tiv_2015    | float |
| tiv_2016    | float |
| lat         | float |
| lon         | float |
+-------------+-------+
pid is the primary key (column with unique values) for this table.
Each row of this table contains information about one policy where:
pid is the policyholder's policy ID.
tiv_2015 is the total investment value in 2015 and tiv_2016 is the total investment value in 2016.
lat is the latitude of the policy holder's city. It's guaranteed that lat is not NULL.
lon is the longitude of the policy holder's city. It's guaranteed that lon is not NULL.
------------------------------------------------------

# Write your MySQL query statement below
select round(sum(tiv_2016),2) as tiv_2016 from insurance where tiv_2015 in 
(select tiv_2015 from insurance group by tiv_2015 having count(*) >1)
and (lat, lon) in
(select lat, lon from insurance group by lat, lon having count(*)=1)