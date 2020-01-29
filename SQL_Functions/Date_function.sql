-- select now(), curdate(), curtime()
/*
+---------------------+------------+-----------+
| now()               | curdate()  | curtime() |
+---------------------+------------+-----------+
| 2019-10-16 21:29:03 | 2019-10-16 | 21:29:03  |
+---------------------+------------+-----------+
*/

-- select date('2019-10-16 21:29:03')
/*
+-----------------------------+
| date('2019-10-16 21:29:03') |
+-----------------------------+
| 2019-10-16                  |
+-----------------------------+
*/

/*
select extract(year from '2014-11-22 13:23:44.657') as OrderYear,
       extract(month from '2014-11-22 13:23:44.657') as OrderMonth,
       extract(day from '2014-11-22 13:23:44.657') as OrderDay,
       extract(hour from '2014-11-22 13:23:44.657') as OrderHour,
       extract(minute from '2014-11-22 13:23:44.657') as OrderMinute
       
+-----------+------------+----------+-----------+-------------+
| OrderYear | OrderMonth | OrderDay | OrderHour | OrderMinute |
+-----------+------------+----------+-----------+-------------+
|      2014 |         11 |       22 |        13 |          23 |
+-----------+------------+----------+-----------+-------------+
*/

/*
select curdate(),date_add(curdate(), interval 5 month) as five_months_after
+------------+-------------------+
| curdate()  | five_months_after |
+------------+-------------------+
| 2019-10-16 | 2020-03-16        |
+------------+-------------------+


select curdate(),date_add(curdate(), interval 5 day) as five_days_after
+------------+-----------------+
| curdate()  | five_days_after |
+------------+-----------------+
| 2019-10-16 | 2019-10-21      |
+------------+-----------------+


select curdate(),date_sub(curdate(), interval 5 month) as five_months_ago
+------------+-----------------+
| curdate()  | five_months_ago |
+------------+-----------------+
| 2019-10-16 | 2019-05-16      |
+------------+-----------------+

select curdate(),date_sub(curdate(), interval 5 day) as five_days_ago
+------------+---------------+
| curdate()  | five_days_ago |
+------------+---------------+
| 2019-10-16 | 2019-10-11    |
+------------+---------------+

SELECT DATEDIFF('2014-06-05','2014-08-05') AS DiffDate
+----------+
| DiffDate |
+----------+
|      -61 |
+----------+

The unit argument can be: MICROSECOND (microseconds), SECOND, MINUTE, HOUR, DAY,WEEK, MONTH, QUARTER, or YEAR.


select TIMESTAMPDIFF(hour,'2019-09-01','2019-09-02')
+-----------------------------------------------+
| TIMESTAMPDIFF(hour,'2019-09-01','2019-09-02') |
+-----------------------------------------------+
|                                            24 |
+-----------------------------------------------+

select TIMESTAMPDIFF(minute,'2019-09-01','2019-09-02')
+-------------------------------------------------+
| TIMESTAMPDIFF(minute,'2019-09-01','2019-09-02') |
+-------------------------------------------------+
|                                            1440 |
+-------------------------------------------------+
*/

/*
select to_date('2015-05-08T23:39:20.123-07:00') as "DATE1",
       date_trunc('YEAR', "DATE1") as "TRUNCATED TO YEAR",
       date_trunc('MONTH', "DATE1") as "TRUNCATED TO MONTH",
       date_trunc('DAY', "DATE1") as "TRUNCATED TO DAY";
+------------+-------------------+--------------------+------------------+
| DATE1      | TRUNCATED TO YEAR | TRUNCATED TO MONTH | TRUNCATED TO DAY |
|------------+-------------------+--------------------+------------------|
| 2015-05-08 | 2015-01-01        | 2015-05-01         | 2015-05-08       |
+------------+-------------------+--------------------+------------------+
*/


SELECT date_diff('day',CAST('2018-01-02' AS DATE), CAST('2018-01-05' AS DATE))
select date_diff('second',timestamp '2017-05-12 16:25:07+0000', timestamp '2017-05-22 16:25:07+0000')
