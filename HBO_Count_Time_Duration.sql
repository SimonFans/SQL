
/*
create table event (id int,type varchar(8),stat varchar(6),time_res int);

insert into event values (1,'light','on',100);
insert into event values (1,'light','off',110);
insert into event values (2,'fan','on',80);
insert into event values (2,'fan','off',120);
insert into event values (1,'light','on',150);
insert into event values (1,'light','off',200);
*/


select * from event;

SET @row_number1 = 0;
SET @row_number2 = 0;

SELECT t1.id, t1.type, sum(abs(t1.time_res-t2.time_res)) as time_duration
FROM
(
SELECT tb1.id as id, tb1.type as type, tb1.time_res as time_res,
(@row_number1:=@row_number1 + 1) AS num1
FROM event as tb1
WHERE tb1.stat='ON'
) as t1
JOIN 
(
SELECT tb2.id as id, tb2.type as type, tb2.time_res as time_res,
(@row_number2:=@row_number2 + 1) AS num2
FROM event as tb2
WHERE tb2.stat='OFF'
) as t2
ON t1.num1=t2.num2
GROUP BY t1.id, t1.type


+------+-------+------+----------+
| id   | type  | stat | time_res |
+------+-------+------+----------+
|    1 | light | on   |      100 |
|    1 | light | off  |      110 |
|    2 | fan   | on   |       80 |
|    2 | fan   | off  |      120 |
|    1 | light | on   |      150 |
|    1 | light | off  |      200 |
+------+-------+------+----------+


+------+-------+---------------+
| id   | type  | time_duration |
+------+-------+---------------+
|    1 | light |            60 |
|    2 | fan   |            40 |
+------+-------+---------------+












