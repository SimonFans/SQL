Table my_numbers contains many numbers in column num including duplicated ones.
Can you write a SQL query to find the biggest number, which only appears once.

+---+
|num|
+---+
| 8 |
| 8 |
| 3 |
| 3 |
| 1 |
| 4 |
| 5 |
| 6 | 
For the sample data above, your query should return the following result:
+---+
|num|
+---+
| 6 |
Note:
If there is no such number, just output null.


SELECT num
FROM my_numbers
GROUP BY num
having count(*)=1
ORDER BY num DESC LIMIT 1;


/*
create table my_numbers (num int);

insert into my_numbers values (8);
insert into my_numbers values (8);
insert into my_numbers values (3);
insert into my_numbers values (3);
insert into my_numbers values (1);
insert into my_numbers values (4);
insert into my_numbers values (5);
insert into my_numbers values (6);
*/

