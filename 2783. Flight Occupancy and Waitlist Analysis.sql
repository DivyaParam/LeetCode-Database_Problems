Table: Flights

+-------------+------+
| Column Name | Type |
+-------------+------+
| flight_id   | int  |
| capacity    | int  |
+-------------+------+
flight_id is the column with unique values for this table.
Each row of this table contains flight id and its capacity.
Table: Passengers

+--------------+------+
| Column Name  | Type |
+--------------+------+
| passenger_id | int  |
| flight_id    | int  |
+--------------+------+
passenger_id is the column with unique values for this table.
Each row of this table contains passenger id and flight id.

Passengers book tickets for flights in advance. If a passenger books a ticket for a flight and there are still empty seats available on the flight, the passenger ticket will be confirmed. However, the passenger will be on a waitlist if the flight is already at full capacity.

Write a solution to report the number of passengers who successfully booked a flight (got a seat) and the number of passengers who are on the waitlist for each flight.

Return the result table ordered by flight_id in ascending order.
----------------------------------------------------------------------------
select f.flight_id, least (f.capacity, count(p.flight_id)) as booked_cnt, 
if(count(p.flight_id) > f.capacity, count(p.flight_id) - f.capacity, 0) as waitlist_cnt
from Flights f
left join Passengers p
on f.flight_id = p.flight_id
group by f.flight_id
order by f.flight_id


