--------------
select * from Cars
--------------

+------+-------------+------------+-------+
| id   | name        | company    | power |
+------+-------------+------------+-------+
|    1 | Corrolla    | Toyota     |  1800 |
|    2 | City        | Honda      |  1500 |
|    3 | C200        | Mercedez   |  2000 |
|    4 | Vitz        | Toyota     |  1300 |
|    5 | Baleno      | Suzuki     |  1500 |
|    6 | C500        | Mercedez   |  5000 |
|    7 | 800         | BMW        |  8000 |
|    8 | Mustang     | Ford       |  5000 |
|    9 | 208         | Peugeot    |  5400 |
|   10 | Prius       | Toyota     |  3200 |
|   11 | Atlas       | Volkswagen |  5000 |
|   12 | 110         | Bugatti    |  8000 |
|   13 | Landcruiser | Toyota     |  3000 |
|   14 | Civic       | Honda      |  1800 |
|   15 | Accord      | Honda      |  2000 |
+------+-------------+------------+-------+


SELECT name,company,power,
ROW_NUMBER() OVER(ORDER BY power DESC) AS RowRank
FROM Cars;

+-------------+------------+-------+---------+
| name        | company    | power | RowRank |
+-------------+------------+-------+---------+
| 800         | BMW        |  8000 |       1 |
| 110         | Bugatti    |  8000 |       2 |
| 208         | Peugeot    |  5400 |       3 |
| C500        | Mercedez   |  5000 |       4 |
| Mustang     | Ford       |  5000 |       5 |
| Atlas       | Volkswagen |  5000 |       6 |
| Prius       | Toyota     |  3200 |       7 |
| Landcruiser | Toyota     |  3000 |       8 |
| C200        | Mercedez   |  2000 |       9 |
| Accord      | Honda      |  2000 |      10 |
| Corrolla    | Toyota     |  1800 |      11 |
| Civic       | Honda      |  1800 |      12 |
| City        | Honda      |  1500 |      13 |
| Baleno      | Suzuki     |  1500 |      14 |
| Vitz        | Toyota     |  1300 |      15 |
+-------------+------------+-------+---------+


SELECT name,company, power,
ROW_NUMBER() OVER(PARTITION by company ORDER BY power DESC) AS RowRank
FROM Cars

+-------------+------------+-------+---------+
| name        | company    | power | RowRank |
+-------------+------------+-------+---------+
| 800         | BMW        |  8000 |       1 |
| 110         | Bugatti    |  8000 |       1 |
| Mustang     | Ford       |  5000 |       1 |
| Accord      | Honda      |  2000 |       1 |
| Civic       | Honda      |  1800 |       2 |
| City        | Honda      |  1500 |       3 |
| C500        | Mercedez   |  5000 |       1 |
| C200        | Mercedez   |  2000 |       2 |
| 208         | Peugeot    |  5400 |       1 |
| Baleno      | Suzuki     |  1500 |       1 |
| Prius       | Toyota     |  3200 |       1 |
| Landcruiser | Toyota     |  3000 |       2 |
| Corrolla    | Toyota     |  1800 |       3 |
| Vitz        | Toyota     |  1300 |       4 |
| Atlas       | Volkswagen |  5000 |       1 |
+-------------+------------+-------+---------+
