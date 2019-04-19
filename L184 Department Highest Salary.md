The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.

		+----+-------+--------+--------------+
		| Id | Name  | Salary | DepartmentId |
		+----+-------+--------+--------------+
		| 1  | Joe   | 70000  | 1            |
		| 2  | Henry | 80000  | 2            |
		| 3  | Sam   | 60000  | 2            |
		| 4  | Max   | 90000  | 1            |
		+----+-------+--------+--------------+
The Department table holds all departments of the company.

		+----+----------+
		| Id | Name     |
		+----+----------+
		| 1  | IT       |
		| 2  | Sales    |
		+----+----------+
Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, Max has the highest salary in the IT department and Henry has the highest salary in the Sales department.

		+------------+----------+--------+
		| Department | Employee | Salary |
		+------------+----------+--------+
		| IT         | Max      | 90000  |
		| Sales      | Henry    | 80000  |
		+------------+----------+--------+
		
- solution:

<1> Regular method:

		
		SELECT tb2.Name as Department, tb1.Name as Employee, tb1.Salary as Salary
		FROM Employee as tb1
		LEFT JOIN Department tb2
		ON tb1.DepartmentId=tb2.Id
		WHERE (tb2.Id,tb1.Salary) in (SELECT DepartmentId,max(Salary)
           	FROM Employee
		GROUP BY DepartmentId);

		
<2> Analytic function:

		select t.Department as Department, 
		t.Name as Employee, 
		t.Salary as Salary
		from
		(select d.Name as Department, 
		e.Name as Name, 
		e.Salary as Salary,
		(dense_rank() over 
		(partition by e.DepartmentId order by e.Salary desc) ) as sal_rank
		from Department d join Employee e
		on d.Id=e.DepartmentId) t
		where t.sal_rank <2
