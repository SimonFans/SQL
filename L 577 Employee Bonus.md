Select all employee's name and bonus whose bonus is < 1000.

Table:Employee

		+-------+--------+-----------+--------+
		| empId |  name  | supervisor| salary |
		+-------+--------+-----------+--------+
		|   1   | John   |  3        | 1000   |
		|   2   | Dan    |  3        | 2000   |
		|   3   | Brad   |  null     | 4000   |
		|   4   | Thomas |  3        | 4000   |
		+-------+--------+-----------+--------+
empId is the primary key column for this table.
Table: Bonus

		+-------+-------+
		| empId | bonus |
		+-------+-------+
		| 2     | 500   |
		| 4     | 2000  |
		+-------+-------+
empId is the primary key column for this table.
Example ouput:

		+-------+-------+
		| name  | bonus |
		+-------+-------+
		| John  | null  |
		| Dan   | 500   |
		| Brad  | null  |
		+-------+-------+
		
- solution:

		select t1.name, 
		t2.bonus
		from Employee t1 left join 
		Bonus t2 
		on t1.empId=t2.empId
		where t2.bonus<1000 or t2.bonus is null