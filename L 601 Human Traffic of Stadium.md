X city built a new stadium, each day many people visit it and the stats are saved as these columns: id, date, people

Please write a query to display the records which have 3 or more consecutive rows and the amount of people more than 100(inclusive).

For example, the table stadium:

	+------+------------+-----------+
	| id   | date       | people    |
	+------+------------+-----------+
	| 1    | 2017-01-01 | 10        |
	| 2    | 2017-01-02 | 109       |
	| 3    | 2017-01-03 | 150       |
	| 4    | 2017-01-04 | 99        |
	| 5    | 2017-01-05 | 145       |
	| 6    | 2017-01-06 | 1455      |
	| 7    | 2017-01-07 | 199       |
	| 8    | 2017-01-08 | 188       |
	+------+------------+-----------+
For the sample data above, the output is:


	+------+------------+-----------+
	| id   | date       | people    |
	+------+------------+-----------+
	| 5    | 2017-01-05 | 145       |
	| 6    | 2017-01-06 | 1455      |
	| 7    | 2017-01-07 | 199       |
	| 8    | 2017-01-08 | 188       |
	+------+------------+-----------+
	
	
- solution:

		select s1.* 
		from stadium as s1, stadium as s2, 
		stadium as s3
		where ((s1.id+1=s2.id and s1.id+2=s3.id)
		or (s1.id-1=s2.id and s1.id+1=s3.id) or
		(s1.id-2=s2.id and s1.id-1=s3.id)) 
		and s1.people>=100
		and s2.people>=100
		and s3.people>=100
		group by si.id