
with q as (
select 10 deptno, 'rrr' empname, 10000.00 sal from dual union all
select 11, 'nnn', 20000.00 from dual union all
select 11, 'mmm', 5000.00 from dual union all
select 12, 'kkk', 30000 from dual union all
select 10, 'fff', 40000 from dual union all
select 10, 'ddd', 40000 from dual union all
select 10, 'bbb', 50000 from dual union all
select 10, 'xxx', null from dual union all
select 10, 'ccc', 50000 from dual)
select empname, deptno, sal
     , rank() over (partition by deptno order by sal nulls first) r
     , dense_rank() over (partition by deptno order by sal nulls first) dr1
     , dense_rank() over (partition by deptno order by sal nulls last) dr2
 from q; 

EMP     DEPTNO        SAL          R        DR1        DR2
--- ---------- ---------- ---------- ---------- ----------
xxx         10                     1          1          4
rrr         10      10000          2          2          1
fff         10      40000          3          3          2
ddd         10      40000          3          3          2
ccc         10      50000          5          4          3
bbb         10      50000          5          4          3
mmm         11       5000          1          1          1
nnn         11      20000          2          2          2
kkk         12      30000          1          1          1
