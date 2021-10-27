Given a Weather table, write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.

	+---------+------------------+------------------+
	| Id(INT) | RecordDate(DATE) | Temperature(INT) |
	+---------+------------------+------------------+
	|       1 |       2015-01-01 |               10 |
	|       2 |       2015-01-02 |               25 |
	|       3 |       2015-01-03 |               20 |
	|       4 |       2015-01-04 |               30 |
	+---------+------------------+------------------+
For example, return the following Ids for the above Weather table:

		+----+
		| Id |
		+----+
		|  2 |
		|  4 |
		+----+
		
- solution:

<1> Regular method:
		
		SELECT wt1.Id 
		FROM Weather wt1, Weather wt2
		WHERE wt1.Temperature > wt2.Temperature 
		AND 
		TO_DAYS(wt1.RecordDate)-TO_DAYS(wt2.RecordDate)=1;
		
		
<2> Join & DATEDIFF() <*>

		SELECT tb1.Id as Id
		FROM Weather tb1
		INNER JOIN Weather tb2
		ON tb1.Temperature > tb2.Temperature AND DATEDIFF(tb1.RecordDate,tb2.RecordDate)=1;
	    
<3> Analytic functions:

	select t.Id
	from
	(select Id, Temperature,
	lag(Temperature,1,null) over (order by RecordDate) as previous_temperature,
	RecordDate,
	lag(RecordDate,1,null) over (order by RecordDate) as previous_date,
	DATEDIFF(day, lag(RecordDate,1,null) over (order by RecordDate), RecordDate) as gap
	from Weather) t
	where t.Temperature>t.previous_temperature and 
	t.gap=1 
	
Thank you
