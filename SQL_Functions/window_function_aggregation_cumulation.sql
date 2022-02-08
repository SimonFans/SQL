+------------+------------+----------+--------+
| account_id | day        | type     | amount |
+------------+------------+----------+--------+
|          1 | 2021-11-07 | Deposit  |   2000 |
|          1 | 2021-11-09 | Withdraw |   1000 |
|          1 | 2021-11-11 | Deposit  |   3000 |
|          2 | 2021-12-07 | Deposit  |   7000 |
|          2 | 2021-12-12 | Withdraw |   7000 |
+------------+------------+----------+--------+

(1) aggregation function with partition by only 

select 
  account_id,
  sum(amount) over (partition by account_id) as total_sum
from transactions_2066

+------------+-----------+
| account_id | total_sum |
+------------+-----------+
|          1 |      6000 |
|          1 |      6000 |
|          1 |      6000 |
|          2 |     14000 |
|          2 |     14000 |
+------------+-----------+

(2) aggregation function with over() without parameters

select 
  account_id,
  sum(amount) over () as total_sum
from transactions_2066

+------------+-----------+
| account_id | total_sum |
+------------+-----------+
|          1 |     20000 |
|          1 |     20000 |
|          1 |     20000 |
|          2 |     20000 |
|          2 |     20000 |
+------------+-----------+

(3) aggregation function with partition by and order by 

select 
  account_id,
  sum(amount) over (partition by account_id order by day) as cumulative_sum
from transactions_2066

+------------+----------------+
| account_id | cumulative_sum |
+------------+----------------+
|          1 |           2000 |
|          1 |           3000 |
|          1 |           6000 |
|          2 |           7000 |
|          2 |          14000 |
+------------+----------------+

