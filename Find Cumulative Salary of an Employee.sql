
The Employee table holds the salary information in a year.

Write a SQL to get the cumulative sum of an employee's salary over a period of 3 months but exclude the most recent month.

The result should be displayed by 'Id' ascending, and then by 'Month' descending.

Example
Input

| Id | Month | Salary |
|----|-------|--------|
| 1  | 1     | 20     |
| 2  | 1     | 20     |
| 1  | 2     | 30     |
| 2  | 2     | 30     |
| 3  | 2     | 40     |
| 1  | 3     | 40     |
| 3  | 3     | 60     |
| 1  | 4     | 60     |
| 3  | 4     | 70     |

Output

| Id | Month | Salary |
|----|-------|--------|
| 1  | 3     | 90     |
| 1  | 2     | 50     |
| 1  | 1     | 20     |
| 2  | 1     | 20     |
| 3  | 3     | 100    |
| 3  | 2     | 40     |


with cumulativeSalary as(
select e1.Id,e1.Month,
ifnull(e1.salary,0)+IfNULL(e2.salary,0)+IfNULL(e3.salary,0) as CumulativeSalary
from employees2 e1 
left join employees2 e2 on e1.Id=e2.Id and e2.Month=e1.Month-1
left join employees2 e3 on e3.Id=e2.Id and e3.Month=e2.Month-1
),MostRecentMonth as
(
select id,max(Month) as MaxMonth from employees2 group by Id having(count(*)>1)
)
select c.Id,c.Month,c.CumulativeSalary from cumulativeSalary c join MostRecentMonth m on c.Id=m.Id and m.MaxMonth>c.Month
order by Id asc, Month desc



###
Create table employees2(Id int, Month int,salary int);

insert into employees2 values(1,1,20);
insert into employees2 values(2,1,20);
insert into employees2 values(1,2,30);
insert into employees2 values(2,2,30);
insert into employees2 values(3,2,40);
insert into employees2 values(1,3,40);
insert into employees2 values(3,3,60);
insert into employees2 values(1,4,60);
insert into employees2 values(3,4,70);
