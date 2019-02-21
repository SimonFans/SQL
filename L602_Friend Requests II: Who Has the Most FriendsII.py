Table request_accepted holds the data of friend acceptance, while requester_id and accepter_id both are the id of a person.

 

| requester_id | accepter_id | accept_date|
|--------------|-------------|------------|
| 1            | 2           | 2016_06-03 |
| 1            | 3           | 2016-06-08 |
| 2            | 3           | 2016-06-08 |
| 3            | 4           | 2016-06-09 |
Write a query to find the the people who has most friends and the most friends number. For the sample data above, the result is:

| id | num |
|----|-----|
| 3  | 3   |
Note:

It is guaranteed there is only 1 people having the most friends.
The friend request could only been accepted once, which mean there is no multiple records with the same requester_id and accepter_id value.


create table request_accepted1(requester_id integer,accepter_id integer, accept_date date);
insert into request_accepted1(requester_id,accepter_id,accept_date) values (1,2,'2016-06-03');
insert into request_accepted1(requester_id,accepter_id,accept_date) values (1,3,'2016-06-08');
insert into request_accepted1(requester_id,accepter_id,accept_date) values (2,3,'2016-06-03');
insert into request_accepted1(requester_id,accepter_id,accept_date) values (3,4,'2016-06-03');


select t.requester_id, count(*) as friend_nums
from
(
  select requester_id, accepter_id
  from request_accepted1
  
  union all
  
  select accepter_id, requester_id
  from request_accepted
) t
group by 1
order by 2 desc 
limit 1

