The Employee table holds all employees. The employee table has three columns: Employee Id, Company Name, and Salary.

		+-----+------------+--------+
		|Id   | Company    | Salary |
		+-----+------------+--------+
		|1    | A          | 2341   |
		|2    | A          | 341    |
		|3    | A          | 15     |
		|4    | A          | 15314  |
		|5    | A          | 451    |
		|6    | A          | 513    |
		|7    | B          | 15     |
		|8    | B          | 13     |
		|9    | B          | 1154   |
		|10   | B          | 1345   |
		|11   | B          | 1221   |
		|12   | B          | 234    |
		|13   | C          | 2345   |
		|14   | C          | 2645   |
		|15   | C          | 2645   |
		|16   | C          | 2652   |
		|17   | C          | 65     |
		+-----+------------+--------+
Write a SQL query to find the median salary of each company. Bonus points if you can solve it without using any built-in SQL functions.

		+-----+------------+--------+
		|Id   | Company    | Salary |
		+-----+------------+--------+
		|5    | A          | 451    |
		|6    | A          | 513    |
		|12   | B          | 234    |
		|9    | B          | 1154   |
		|14   | C          | 2645   |
		+-----+------------+--------+

- solution: 

<* not use built in function>

		SELECT tb1.Id,tb1.Company,tb1.Salary
		FROM Employee as tb1
		LEFT JOIN Employee as tb2
		on tb1.Company=tb2.Company
		GROUP BY tb1.Company,tb1.Salary
		Having SUM(CASE WHEN tb1.Salary=tb2.Salary THEN 1 ELSE 0 END)>= ABS(SUM(CASE WHEN tb1.Salary>tb2.Salary then 1 when 		tb1.Salary<tb2.Salary then -1 else 0 end))
		ORDER BY tb1.Id;

[1,2,3,4,5,6]  => median number is 3 and 4
3 appears one time, 4 appears one time
greater than 3 has 3 numbers sum()=>3 smaller than 3 has 2 numbers sum()=> -2  total =1  thus 1>=abs(1)
greater than 4 has 2 numbers sum()=>2 smaller than 4 has 3 numbers sum()=> -3  total =1  thus 1>=abs(1)


<1>

		select t.Id as Id, 
		t.Company as Company, 
		t.Salary as Salary 
		from (
		select Id, 
		Company, 
		Salary,
		median(Salary) over (partition by Company order by Salary) as Median_Salary
		from employee) t
		where t.Salary = t.Median_Salary;
		
		
<2> 


		with cte as(
		select Id,
		Company,
		Salary 
		,ROW_NUMBER() over(partition by Company order by Salary) as rnk,
		count(*) over(partition by Company) as cnt
		from employees
		) select Id,Company,Salary from cte
		where rnk in (CEILING(cnt/2.0),cnt/2+1) 
