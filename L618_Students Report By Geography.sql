A U.S graduate school has students from Asia, Europe and America. The students' location information are stored in table student as below.
 

| name   | continent |
|--------|-----------|
| Jack   | America   |
| Pascal | Europe    |
| Xi     | Asia      |
| Jane   | America   |
 

Pivot the continent column in this table so that each name is sorted alphabetically and displayed underneath its corresponding continent. The output headers should be America, Asia and Europe respectively. It is guaranteed that the student number from America is no less than either Asia or Europe.
 

For the sample input, the output is:
 

| America | Asia | Europe |
|---------|------|--------|
| Jack    | Xi   | Pascal |
| Jane    |      |        |

Solution:

SELECT
(CASE WHEN continent='America' THEN name ELSE '' END) AS 'America',
(CASE WHEN continent='Europe' THEN name ELSE '' END) AS 'Europe',
(CASE WHEN continent='Asia' THEN name ELSE '' END) AS 'Asia'
FROM Pivot;



/*
CREATE TABLE Pivot (name varchar(10),continent varchar(20));

insert into Pivot values ('jack','America');
insert into Pivot values ('Pascal','Europe');
insert into Pivot values ('Xi','Asia');
insert into Pivot values ('jane','America');
*/
