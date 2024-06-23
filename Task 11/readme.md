# Task 11
Ingesting Structured and Unstructured data using sqoop and flame
# Procedure
- Open VM Workstation or linux os and then open command prompt and enter below commands:
- For logging
```
mysql -u -root -pcloudera;
```
- For creating a database and table and insert data
```
create database aiml;
create table task11 (sid int,name varchar65,pno int);
insert into task11 (1,"Prabhas",523);
select * from task11;
```
- For creating a database and table in the hive where data should be imported
```
create table BDG (sid int,name varchar65,pno int) row format delimited fields terminated by ',';
create database aimla;
hive
use aimla
create table task(sid int,name varchar65,pno int);
select * from task;
```
- For importing data from sql to hive
```
sqoop import --connect\
jdbc:mysql:localhost/aiml \--username root --password cloudera \ --task11\ --hive --import --hive --table
db aimla task \--m\
hive
select * from task;
```
