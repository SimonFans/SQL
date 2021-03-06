Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.

		+----+-------+
		| Id | Score |
		+----+-------+
		| 1  | 3.50  |
		| 2  | 3.65  |
		| 3  | 4.00  |
		| 4  | 3.85  |
		| 5  | 4.00  |
		| 6  | 3.65  |
		+----+-------+
For example, given the above Scores table, your query should generate the following report (order by highest score):

		+-------+------+
		| Score | Rank |
		+-------+------+
		| 4.00  | 1    |
		| 4.00  | 1    |
		| 3.85  | 2    |
		| 3.65  | 3    |
		| 3.65  | 3    |
		| 3.50  | 4    |
		+-------+------+
		
- solution:  

(MySQL)

SELECT tb1.Score as Score, (SELECT COUNT(DISTINCT tb2.Score)
                           FROM scores as tb2
                           WHERE tb2.Score> tb1.Score) +1 as 'rank' 
FROM scores as tb1
ORDER BY tb1.Score DESC


(MSQL Server)

Idea: using analytic function dense_rank() 

select Score, dense_rank() over (order by Score desc) as Rank
from Scores



create table if not exists scores(Id integer, Score double);

insert into scores(Id,Score) values (1,3.50);
insert into scores(Id,Score) values (2,3.65);
insert into scores(Id,Score) values (3,4.00);
insert into scores(Id,Score) values (4,3.85);
insert into scores(Id,Score) values (5,4.00);
insert into scores(Id,Score) values (6,3.65);
