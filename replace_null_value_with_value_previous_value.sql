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
  select   ta.mysequence as ta_seq
         , ta.mynumber as ta_num
         , tb.mysequence as tb_seq
         , tb.mynumber as tb_num
         , max(tb.mynumber) over (partition by ta.mysequence) as mx
  from test as ta
  left join test as tb
  on ta.mysequence >= tb.mysequence 
  and tb.mynumber IS NOT NULL
)
  select   ta_seq
         , COALESCE(ta_num, tb_num) as res
  from cte_step1
  where mx = tb_num
