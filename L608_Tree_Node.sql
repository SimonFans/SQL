Given a table tree, id is identifier of the tree node and p_id is its parent node's id.

+----+------+
| id | p_id |
+----+------+
| 1  | null |
| 2  | 1    |
| 3  | 1    |
| 4  | 2    |
| 5  | 2    |
+----+------+
Each node in the tree can be one of three types:
Leaf: if the node is a leaf node.
Root: if the node is the root of the tree.
Inner: If the node is neither a leaf node nor a root node.
 

Write a query to print the node id and the type of the node. Sort your output by the node id. The result for the above sample is:
 

+----+------+
| id | Type |
+----+------+
| 1  | Root |
| 2  | Inner|
| 3  | Leaf |
| 4  | Leaf |
| 5  | Leaf |
+----+------+


Solution:

select 
    tree.id,
    case when tree.id=(select t1.id from tree t1 where t1.p_id is null)
    then 'Root'
    when tree.id in (select t1.p_id from tree t1)
    then 'Inner'
    else 'Leaf'
    End as Type
from tree

/*
create table tree (id int,p_id int);
insert into tree values (1,null);
insert into tree values (2,1);
insert into tree values (3,1);
insert into tree values (4,2);
insert into tree values (5,2);
*/
