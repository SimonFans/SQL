Round() and isnull,  round() can be used directly.
In social network like Facebook or Twitter, people send friend requests and accept others’ requests as well. Now given two tables as below:
Table: friend_request
| sender_id | send_to_id |request_date|
|-----------|------------|------------|
| 1         | 2          | 2016_06-01 |
| 1         | 3          | 2016_06-01 |
| 1         | 4          | 2016_06-01 |
| 2         | 3          | 2016_06-02 |
| 3         | 4          | 2016-06-09 |

Table: request_accepted
| requester_id | accepter_id |accept_date |
|--------------|-------------|------------|
| 1            | 2           | 2016_06-03 |
| 1            | 3           | 2016-06-08 |
| 2            | 3           | 2016-06-08 |
| 3            | 4           | 2016-06-09 |
| 3            | 4           | 2016-06-10 |
Write a query to find the overall acceptance rate of requests rounded to 2 decimals, which is the number of acceptance divide the number of requests.
For the sample data above, your query should return the following result.
|accept_rate|
|-----------|
|       0.80|
--------------------- 


-- solution 1:

select 
round(
    ifnull(
    (select count(*) from (select distinct requester_id, accepter_id from request_accepted) a) 
/ 
    (select count(*) from (select distinct sender_id, send_to_id from friend_request) b ),0),2) as accept_rate

-- solution 2:

select coalesce(round
(count(distinct requester_id, accepter_id)
/
count(distinct sender_id, send_to_id),2),
0) 
as accept_rate
from friend_request, request_accepted

Follow up:
Can you write a query to return the accept rate but for every month?

select t2.request_month, t1.accept_total / t2.request_total as accept_rate_by_month from 
(select month(accept_date) as accept_month, count(distinct requester_id,accepter_id) as accept_total
from request_accepted
group by month(accept_date)) as t1 
join 
(select month(request_date) as request_month, count(distinct sender_id,send_to_id) as request_total
from friend_request
group by month(request_date)) as t2
on t1.accept_month=t2.request_month;

