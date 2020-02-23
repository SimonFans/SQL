-- Syntax For The SQL WITH Clause

* The following is the syntax of the SQL WITH clause when using a single sub-query alias.

WITH <alias_name> AS (sql_subquery_statement)
SELECT column_list FROM <alias_name>[,table_name]
[WHERE <join_condition>]

* When using multiple sub-query aliases, the syntax is as follows.

WITH <alias_name_A> AS (sql_subquery_statement),
<alias_name_B> AS(sql_subquery_statement_from_alias_name_A
or sql_subquery_statement )
SELECT <column_list>
FROM <alias_name_A>, <alias_name_B> [,table_names]
[WHERE <join_condition>]
