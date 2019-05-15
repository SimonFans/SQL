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


SELECT t1.mysequence, t1.mynumber AS ORIGINAL
, (
    SELECT t2.mynumber
    FROM test t2
    WHERE t2.mysequence = (
        SELECT MAX(t3.mysequence)
        FROM test t3
        WHERE t3.mysequence <= t1.mysequence
        AND mynumber IS NOT NULL
       )
) AS CALCULATED
FROM test t1;
