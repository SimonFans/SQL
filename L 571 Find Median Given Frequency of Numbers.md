The Numbers table keeps the value of number and its frequency.

		+----------+-------------+
		|  Number  |  Frequency  |
		+----------+-------------|
		|  0       |  7          |
		|  1       |  1          |
		|  2       |  3          |
		|  3       |  1          |
		+----------+-------------+
In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (0 + 0) / 2 = 0.

		+--------+
		| median |
		+--------|
		| 0.0000 |
		+--------+
		
- solution:

		select avg(t3.Number) as median
		from Numbers as t3 
		inner join 
		    (select t1.Number, 
		        abs(sum(case when t1.Number>t2.Number then t2.Frequency else 0 end) -
		            sum(case when t1.Number<t2.Number then t2.Frequency else 0 end)) as count_diff
		    from numbers as t1, numbers as t2
		    group by t1.Number) as t4
		on t3.Number = t4.Number
		where t3.Frequency>=t4.count_diff