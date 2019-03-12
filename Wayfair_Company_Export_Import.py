create table if not exists Companies(name varchar(100), nation varchar(100), PRIMARY KEY (name));
insert into Companies(name,nation) values ('Alice','Wonderland');
insert into Companies(name,nation) values ('Y-zap','Wonderland');
insert into Companies(name,nation) values ('Absolute','Mathland');
insert into Companies(name,nation) values ('Arcus','Mathland');
insert into Companies(name,nation) values ('Li','Underwater');
insert into Companies(name,nation) values ('None at all','Nothingland');

create table if not exists Trade(id integer, seller varchar(100), buyer varchar(100), value integer);
insert into Trade(id,seller,buyer,value) values (20121107,'Li','Alice',10);
insert into Trade(id,seller,buyer,value) values (20123112,'Arcus','Y-zap',30);
insert into Trade(id,seller,buyer,value) values (20120125,'Alice','Arcus',100);
insert into Trade(id,seller,buyer,value) values (20120216,'Li','Absolute',30);
insert into Trade(id,seller,buyer,value) values (20120217,'Li','Absolute',50);

select table1.country, table1.export, table2.import from
(select c1.nation as country, coalesce(sum(t1.value),0) as export from
Companies c1 left join Trade t1
on c1.name=t1.seller
group by 1
) table1
join 
(
select c2.nation as country, coalesce(sum(t2.value),0) as import from
Companies c2 left join Trade t2
on c2.name=t2.buyer
group by 1
) table2
on table1.country=table2.country

Answer:
Country export import  
Mathland	30	180
Nothingland	0	0
Underwater	90	0
Wonderland	100	40
