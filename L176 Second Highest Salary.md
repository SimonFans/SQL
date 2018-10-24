Write a SQL query to get the second highest salary from the Employee table.

		+----+--------+
		| Id | Salary |
		+----+--------+
		| 1  | 100    |
		| 2  | 200    |
		| 3  | 300    |
		+----+--------+
For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.

		+---------------------+
		| SecondHighestSalary |
		+---------------------+
		| 200                 |
		+---------------------+
		
- solution:

(1)

select max(Salary) as SecondHighestSalary 
from Employee 
where Salary < (select max(Salary) from Employee); 

(2)

select isnull(
(
select distinct Salary 
from
    (
        select Salary,
        dense_rank() over (order by Salary desc) as r
        from Employee
     ) t
where r=2
    ),null) as SecondHighestSalary
    
(3)

select 
IFNULL(
(select distinct Salary from Employee order by Salary Desc limit 1 offset 1),null)
as SecondHighestSalary