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

		SELECT d.Name AS Department, 
		e.Name AS Employee, 
		e.Salary FROM Employee e
		JOIN Department d on e.DepartmentId = d.Id
		WHERE (SELECT COUNT(DISTINCT Salary) 
		FROM Employee WHERE Salary > e.Salary
		AND DepartmentId = d.Id) < 3 
		ORDER BY d.Name, e.Salary DESC;
		
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