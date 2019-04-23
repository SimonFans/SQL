Table point holds the x coordinate of some points on x-axis in a plane, which are all integers.

Write a query to find the shortest distance between two points in these points.

x
-1
0
2
The shortest distance is ‘1’ obviously, which is from point ‘-1’ to ‘0’. So the output is as below:

shortest
1
Note: Every point is unique, which means there is no duplicates in table point.

#idea: 先找到两者间的不同，然后用后面的减去前面的，取模找最小

SELECT MIN(ABS(p2.x - p1.x)) AS shortest FROM point AS p1, point AS p2 WHERE p1.x <> p2.x;

