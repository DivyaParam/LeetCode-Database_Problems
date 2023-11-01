Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the nth highest salary from the Employee table. If there is no nth highest salary, return null.
----------------------------------------------------------------------------------------------------------------------------------
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
Set n = n-1;
  RETURN (
      # Write your MySQL query statement below.
      select distinct salary from Employee 
      order by salary Desc
      Limit 1 OFFSET n
      
  );
END