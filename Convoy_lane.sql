Find in each month, how many lanes are there like (a-b,b-a) then count one.
+-------+--------+---------+
| Month | Pickup | Dropoff |
+-------+--------+---------+
|     1 | A      | B       |
|     1 | B      | A       |
|     1 | A      | C       |
|     2 | A      | C       |
|     2 | A      | D       |
|     2 | C      | A       |
+-------+--------+---------+

Result:
+-------+------+
| Month | lane |
+-------+------+
|     1 |    1 |
|     2 |    1 |
+-------+------+


/*
create table df (Month int, Pickup Varchar(10), Dropoff varchar(10));

insert into df values(1,'A','B');
insert into df values(1,'B','A');
insert into df values(1,'A','C');
insert into df values(2,'A','C');
insert into df values(2,'A','D');
insert into df values(2,'C','A');
*/

select * from df;


select *
from df tb1
join df tb2
on tb1.pickup=tb2.dropoff and tb1.dropoff=tb2.pickup
where tb1.Month=tb2.Month;


select tb1.Month as Month, floor(count(*)/2) as 'lane'
from df tb1
join df tb2
on tb1.pickup=tb2.dropoff and tb1.dropoff=tb2.pickup
where tb1.Month=tb2.Month
group by Month





