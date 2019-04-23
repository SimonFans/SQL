Table point_2d holds the coordinates (x,y) of some unique points (more than two) in a plane.
 

Write a query to find the shortest distance between these points rounded to 2 decimals.
 

| x  | y  |
|----|----|
| -1 | -1 |
| 0  | 0  |
| -1 | -2 |
 

The shortest distance is 1.00 from point (-1,-1) to (-1,2). So the output should be:
 

| shortest |
|----------|
| 1.00     |



select * from point_2d;

SELECT Round(SQRT(MIN(POW(p1.x-p2.x,2)+POW(p1.y-p2.y,2))),2) as shortest
FROM point_2d as p1
JOIN point_2d as p2
ON p1.x != p2.x OR p1.y != p2.y;


                      
# avoid to calculate the duplicated one
SELECT
    ROUND(SQRT(MIN((POW(p1.x - p2.x, 2) + POW(p1.y - p2.y, 2)))),2) AS shortest
FROM
    point_2d p1
        JOIN
    point_2d p2 ON (p1.x <= p2.x AND p1.y < p2.y)
        OR (p1.x <= p2.x AND p1.y > p2.y)
        OR (p1.x < p2.x AND p1.y = p2.y);
               
               
/*
create table point_2d (x int, y int); 

insert into point_2d values (-1,-1);
insert into point_2d values (0,0);
insert into point_2d values (-1,-2);
*/
