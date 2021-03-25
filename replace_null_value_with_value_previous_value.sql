+------------+----------+
| mysequence | mynumber |
+------------+----------+
|          1 |        3 |
|          2 |     NULL |
|          3 |        5 |
|          4 |     NULL |
|          5 |     NULL |
|          6 |        2 |
+------------+----------+

Result:

+------------+----------+------------+
| mysequence | ORIGINAL | CALCULATED |
+------------+----------+------------+
|          1 |        3 |          3 |
|          2 |     NULL |          3 |
|          3 |        5 |          5 |
|          4 |     NULL |          5 |
|          5 |     NULL |          5 |
|          6 |        2 |          2 |
+------------+----------+------------+

# Replace NULL value in a row with a value from the previous known value


/*CREATE TABLE test(mysequence INT, mynumber INT);

INSERT INTO test VALUES(1, 3);
INSERT INTO test VALUES(2, NULL);
INSERT INTO test VALUES(3, 5);
INSERT INTO test VALUES(4, NULL);
INSERT INTO test VALUES(5, NULL);
INSERT INTO test VALUES(6, 2);
*/

select * from test;


with cte_step1 as (
  select   mysequence
         , mynumber
         , sum(case when mynumber is NULL then 0 else 1 end) 
           over (order by mysequence) as val
  from test
)
  select   mysequence
         , mynumber
         , first_value(mynumber) 
           over (partition by val order by mysequence) as res
from cte_step1 
