Given a table customer holding customers information and the referee.

+------+------+-----------+
| id   | name | referee_id|
+------+------+-----------+
|    1 | Will |      NULL |
|    2 | Jane |      NULL |
|    3 | Alex |         2 |
|    4 | Bill |      NULL |
|    5 | Zack |         1 |
|    6 | Mark |         2 |
+------+------+-----------+
Write a query to return the list of customers NOT referred by the person with id '2'.

For the sample data above, the result is:

+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+

Solution: 子query先找到referee_id=2的对应的id,然后从主句中选择id不等于这个id的

SELECT tb1.name
FROM customer tb1
WHERE tb1.id not in
(
SELECT id
FROM customer
WHERE referee_id=2
);


/*
create table customer (id int, name varchar(20), referee_id int);

insert into customer values (1,'Will',NULL);
insert into customer values (2,'Jane',NULL);
insert into customer values (3,'Alex',2);
insert into customer values (4,'Bill',NULL);
insert into customer values (5,'Zack',1);
insert into customer values (6,'Mark',2);
*/



