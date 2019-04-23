A pupil Tim gets homework to identify whether three line segments could possibly form a triangle.

Could you help Tim by writing a query to judge whether these three sides can form a triangle, assuming table triangle holds the length of the three sides x, y and z.
 

| x  | y  | z  |
|----|----|----|
| 13 | 15 | 30 |
| 10 | 20 | 15 |

For the sample data above, your query should return the follow result:

| x  | y  | z  | triangle |
|----|----|----|----------|
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |

Solution:  
idea: # apply case when actually to add one more column to indicate 'yes' or 'no'

SELECT x,
y,
z,
CASE WHEN x+y>z and x+z>y and y+z>x
THEN 'YES' ELSE 'NO'
END AS triangle
FROM triangle;

/*
create table triangle (x int, y int, z int);

insert into triangle values (13,15,30);
insert into triangle values (10,20,15);
*/
