Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

		+----+------------------+
		| Id | Email            |
		+----+------------------+
		| 1  | john@example.com |
		| 2  | bob@example.com  |
		| 3  | john@example.com |
		+----+------------------+
Id is the primary key column for this table.
For example, after running your query, the above Person table should have the following rows:

		+----+------------------+
		| Id | Email            |
		+----+------------------+
		| 1  | john@example.com |
		| 2  | bob@example.com  |
		+----+------------------+

- solution:

(1)
		delete from Person
		where Id not in
		(select p.Id 
 		from 
		(select min(Id) as Id from Person
		group by Email) p
 		)
		
		
(2)
		
		DELETE p1
		FROM Person as p1, Person as p2
		WHERE p1.Email=p2.Email and p1.Id>p2.Id;
		
		
		
		
		
