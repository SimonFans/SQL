Find in Feb, (a->b,b->a) count 1, calculate count(shipmentID) happened.

+------------+-----------+------------+--------------+---------------+
| shipmentID | shipperID | date_time  | pickup_state | dropoff_state |
+------------+-----------+------------+--------------+---------------+
|          1 | A3        | 2019-02-01 | A            | B             |
|          2 | B3        | 2019-02-01 | B            | A             |
|          3 | A5        | 2019-02-01 | A            | C             |
|          4 | A6        | 2019-02-02 | C            | D             |
|          5 | A7        | 2019-02-03 | D            | C             |
|          6 | C3        | 2019-03-01 | A            | E             |
+------------+-----------+------------+--------------+---------------+

Result:
+-------+------+-----------------+
| month | lane | num_of_shipment |
+-------+------+-----------------+
|     2 | A-B  |               2 |
|     2 | A-C  |               1 |
|     2 | C-D  |               2 |
+-------+------+-----------------+


/*drop table shipments;

create table shipments (shipmentID int, shipperID Varchar(10), date_time date, pickup_state varchar(10), dropoff_state varchar(10));

insert into shipments values(1,'A3','2019-02-01','A','B');
insert into shipments values(2,'B3','2019-02-01','B','A');
insert into shipments values(3,'A5','2019-02-01','A','C');
insert into shipments values(4,'A6','2019-02-02','C','D');
insert into shipments values(5,'A7','2019-02-03','D','C');
insert into shipments values(6,'C3','2019-03-01','A','E');
*/

select * from shipments;


select month,concat(lane1,"-",lane2) as lane, num_of_shipment
from
(
select month(date_time) as month, 
case when tb1.pickup_state<tb1.dropoff_state then tb1.pickup_state else tb1.dropoff_state end as 'lane1',
case when tb1.pickup_state<tb1.dropoff_state then tb1.dropoff_state else tb1.pickup_state end as 'lane2',
count(tb1.shipmentID) as num_of_shipment
from
(
select shipmentID, date_time, pickup_state, dropoff_state 
from shipments
where month(date_time)=2
) tb1 
group by month(date_time),lane1,lane2
) tb2;





