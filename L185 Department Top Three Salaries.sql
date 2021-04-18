The Employee table holds all employees. Every employee has an Id, and there is also a column for the department Id.

		+----+-------+--------+--------------+
		| Id | Name  | Salary | DepartmentId |
		+----+-------+--------+--------------+
		| 1  | Joe   | 70000  | 1            |
		| 2  | Henry | 80000  | 2            |
		| 3  | Sam   | 60000  | 2            |
		| 4  | Max   | 90000  | 1            |
		| 5  | Janet | 69000  | 1            |
		| 6  | Randy | 85000  | 1            |
		+----+-------+--------+--------------+
The Department table holds all departments of the company.

		+----+----------+
		| Id | Name     |
		+----+----------+
		| 1  | IT       |
		| 2  | Sales    |
		+----+----------+
Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows.

		+------------+----------+--------+
		| Department | Employee | Salary |
		+------------+----------+--------+
		| IT         | Max      | 90000  |
		| IT         | Randy    | 85000  |
		| IT         | Joe      | 70000  |
		| Sales      | Henry    | 80000  |
		| Sales      | Sam      | 60000  |
		+------------+----------+--------+
		
- solution:

<1> Regular method:

select d.Name Department, e1.Name Employee, e1.Salary
from Employee e1 
join Department d
on e1.DepartmentId = d.Id
where (select count(distinct(e2.Salary)) 
                  from Employee e2 
                  where e2.Salary > e1.Salary 
                  and e1.DepartmentId = e2.DepartmentId
                  ) < 3
		    
<1.2> Method without using subquery:
		    
WITH top_three_employees AS (
    SELECT 
        e1.ID
      , e1.Name
      , e1.DepartmentId
      , e1.Salary
      , COUNT(DISTINCT e2.Salary) AS rk
    FROM Employee AS e1
    INNER JOIN Employee AS e2
        ON e1.DepartmentId = e2.DepartmentId AND e1.Salary <= e2.Salary
    GROUP BY e1.ID, e1.Name, e1.DepartmentId, e1.Salary
)
SELECT 
        d.Name AS Department
      , t.Name AS Employee
      , t.Salary AS Salary
FROM Department AS d
LEFT JOIN top_three_employees AS t
    ON d.Id = t.DepartmentId
WHERE t.rk <= 3
		
<2> Analytic function:

		SELECT a.Department, 
		a.Employee, 
		a.Salary 
		FROM
		(Select b.Name as Department,
		a.Name as Employee,
		a.salary As Salary,
		DENSE_RANK() over 
		(PARTITION BY b.Name ORDER BY a.Salary DESC) as dept_sal_Rank
		from Employee a
		INNER JOIN Department b 
		ON a.DepartmentId = b.Id ) a
		where a.dept_sal_Rank <=3;	
