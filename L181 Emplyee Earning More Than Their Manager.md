The Employee table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

		+----+-------+--------+-----------+
		| Id | Name  | Salary | ManagerId |
		+----+-------+--------+-----------+
		| 1  | Joe   | 70000  | 3         |
		| 2  | Henry | 80000  | 4         |
		| 3  | Sam   | 60000  | NULL      |
		| 4  | Max   | 90000  | NULL      |
		+----+-------+--------+-----------+
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.

		+----------+
		| Employee |
		+----------+
		| Joe      |
		+----------+
		
- solution:

		select e1.Name as Employee
		from Employee e1
		join Employee e2 on e1.ManagerId=e2.Id
		where e1.Salary > e2.Salary