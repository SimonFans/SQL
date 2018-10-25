Write a SQL query to find all numbers that appear at least three times consecutively.

		+----+-----+
		| Id | Num |
		+----+-----+
		| 1  |  1  |
		| 2  |  1  |
		| 3  |  1  |
		| 4  |  2  |
		| 5  |  1  |
		| 6  |  2  |
		| 7  |  2  |
		+----+-----+
For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

		+-----------------+
		| ConsecutiveNums |
		+-----------------+
		| 1               |
		+-----------------+

- solution:

<1> Analytic function:

		select distinct Num as ConsecutiveNums
		from
		(select Num, lead(Num,1,null) over (order by Id) as l1,
		lag(Num,1,null) over (order by Id) as l2
		from Logs) t
		where Num=l1 and l1=l2
		
<2> Regular method:

		select distinct l1.Num as ConsecutiveNums
		from logs l1 join 
		logs l2 on l1.Id=l2.Id-1
		join logs l3 on l1.Id=l3.Id-2
		where l1.Num=l2.Num and l2.Num=l3.Num