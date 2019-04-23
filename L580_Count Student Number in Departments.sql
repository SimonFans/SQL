
student 表：

student_id	student_name	gender	dept_id
1	Jack	M	1
2	Jane	F	1
3	Mark	M	2


department 表：

dept_id	dept_name
1	Engineering
2	Science
3	Law

输出：

dept_name	      student_number
Engineering	        2
Science	            1
Law	                0



SELECT d.dept_name, count(s.student_id) as student_number 
FROM department d
LEFT JOIN student s
ON d.dept_id=s.dept_id
GROUP BY d.dept_name


/*
create table student (student_id int, student_name varchar(20), gender varchar(10), dept_id int);

insert into student values (1,'Jack','M',1);
insert into student values (2,'jane','F',1);
insert into student values (3,'Mark','M',2);


create table department (dept_id int, dept_name varchar(20));

insert into department values (1,'Engineering');
insert into department values (2,'Science');
insert into department values (3,'Law');
*/

