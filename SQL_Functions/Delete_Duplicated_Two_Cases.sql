create table customer
(
  customer_id INT,
  name VARCHAR(50) NOT NULL,
  purchase_year VARCHAR(10),
  purchase_item VARCHAR(30)
);


insert into customer (customer_id, name, purchase_year, purchase_item)
values 
(1,'Simon','2017','ball');

insert into customer (customer_id, name, purchase_year, purchase_item)
values 
(1,'Simon','2017','ball');

insert into customer (customer_id, name, purchase_year, purchase_item)
values 
(2,'Wang','2018','dog');

insert into customer (customer_id, name, purchase_year, purchase_item)
values 
(2,'Wang','2018','dog');

insert into customer (customer_id, name, purchase_year, purchase_item)
values 
(3,'Kate','2017','cup');

+-------------+-------+---------------+---------------+
| customer_id | name  | purchase_year | purchase_item |
+-------------+-------+---------------+---------------+
|           1 | Simon | 2017          | ball          |
|           1 | Simon | 2017          | ball          |
|           2 | Wang  | 2018          | cat           |
|           2 | Wang  | 2018          | cat           |
|           3 | Kate  | 2017          | cup           |
+-------------+-------+---------------+---------------+



select * from customer;


-- (1) delete duplicated rows, only keep one row
select * from
(
select customer_id, name, 
       purchase_year, 
       purchase_item,
       row_number() over (partition by customer_id) as num
from customer
) a
where num=1;

+-------------+-------+---------------+---------------+-----+
| customer_id | name  | purchase_year | purchase_item | num |
+-------------+-------+---------------+---------------+-----+
|           1 | Simon | 2017          | ball          |   1 |
|           2 | Wang  | 2018          | cat           |   1 |
|           3 | Kate  | 2017          | cup           |   1 |
+-------------+-------+---------------+---------------+-----+

-- (2) delete duplicated rows, without keeping any

select a.*
from customer a
join 
(
select customer_id
from customer
group by 1
having count(*)<2
) b
on a.customer_id=b.customer_id

+-------------+------+---------------+---------------+
| customer_id | name | purchase_year | purchase_item |
+-------------+------+---------------+---------------+
|           3 | Kate | 2017          | cup           |
+-------------+------+---------------+---------------+


