Table: Candidate

	+-----+---------+
	| id  | Name    |
	+-----+---------+
	| 1   | A       |
	| 2   | B       |
	| 3   | C       |
	| 4   | D       |
	| 5   | E       |
	+-----+---------+  
Table: Vote

	+-----+--------------+
	| id  | CandidateId  |
	+-----+--------------+
	| 1   |     2        |
	| 2   |     4        |
	| 3   |     3        |
	| 4   |     2        |
	| 5   |     5        |
	+-----+--------------+
id is the auto-increment primary key,
CandidateId is the id appeared in Candidate table.
Write a sql to find the name of the winning candidate, the above example will return the winner B.

	+------+
	| Name |
	+------+
	| B    |
	+------+
Notes:
You may assume there is no tie, in other words there will be at most one winning candidate.

- solution:

		select name as Name
		from Candidate
		join
		(select CandidateId,
		from Vote
		group by CandidateId
		order by count(*) desc
		limit 1) as winner
		on Candidate.id=Winner.CandidateId