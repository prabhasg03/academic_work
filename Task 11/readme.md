# Task 11
Ingesting Structured and Unstructured data using sqoop and flame
# Procedure
- Open VM Workstation or linux os and then open command prompt and enter below commands:
- For Mysql
```
mysql -u root -p cloudera;
create database aiml;
use aiml;
create table aiml.task11 (sid int,name varchar65,pno int);
insert into task11 (1,"Prabhas",523);
select * from task11;
ctrl+c
```
- For creating a database and table in the hive where data should be imported
```
hive
create database aimla;
use aimla
create table task(sid int,name varchar(65),pno int);
select * from task;
ctrl+c
```
- For importing data from sql to hive
```
sqoop import --connect jdbc:mysql://127.0.0.1:3306/aiml --username root --password cloudera --table task11 --hive-import --hive-table aiml.task --m 1
hive
select * from task;
```
