# Task 5
Write Pig Latin scripts sort, group, join, project, and filter your data.
# Procedure
Create a data the fallowing file first.txt and second.txt<br>
[first.txt](https://github.com/prabhasg03/Task-Codes/blob/Big-Data-Analytics-Lab/Task%205/first.txt)-Attributes(user,url,id,)
```
Srinivas,google,123
Srikar,yahoo,12
Sreyas,flipcart,34
Lohitha,linkedin,l46
Syam,myblog,3
```
[second.txt](https://github.com/prabhasg03/Task-Codes/blob/Big-Data-Analytics-Lab/Task%205/second.txt)-Attributes (url,rating)
```
google,8
yahoo,7
flipcart,4
linkedin,5
myblog,3
```
First we have to enter pig in command prompt like below:
```
[cloudera@quickstart ~]$ pig
```
create a directory called Task5 in HDFS and place first.txt and second.txt in Task5.
### LOAD:
LOAD operator is used to load data from the file system or HDFS storage into a Pig relation.
<br>Commands:
```
grunt>loading1 = load '/user/cloudera/21241A6625/Task5/first.txt' using PigStorage(',') as (user:chararray,url:chararray,id:int);
grunt>loading2 = load '/user/cloudera/21241A6625/Task5/second.txt' using PigStorage(',') as (user:chararray,url:chararray,id:int);
```
### FOREACH:
This operator generates data transformations based on columns of data. It is used to add or remove fields from a relation. Use FOREACH-GENERATE operation to work
with columns of data.<br>
Commands:
```
grunt> for_each = FOREACH loading1 generate url,id;
grunt> DUMP for_each;
```
### FILTER:
This operator selects tuples from a relation based on a condition.
In this example, we are filtering the record from ‘loading1’ when the condition ‘id’ is
greater than 8.
<br>
Commands:
```
grunt> filter_command = FILTER loading1 by id>8;
grunt> DUMP filter_command;
```
### JOIN:
JOIN operator is used to perform an inner, equijoin join of two or more relations
based on common field values. The JOIN operator always performs an inner join.
Inner joins ignore null keys, so it makes sense to filter them out before the join.
In this example, join the two relations based on the column 'url' from 'loading1' and'loading2'.<br>
Commands:
```
grunt> join_command = JOIN loading1 BY url,loading2 by url;
grunt> DUMP join_command;
```
### ORDER BY:
Order By is used to sort a relation based on one or more fields. You can do sorting in
ascending or descending order using ASC and DESC keywords.
In below example, we are sorting data in loading2 in ascending order on ratings field.<br>
Commands:
```
grunt> loading4 = ORDER loading2 BY rating ASC;
grunt> DUMP loading4;
```
### DISTINCT:
Distinct removes duplicate tuples in a relation.Lets take an input file as below, which
has amr,crap,8 and amr,myblog,10 twice in the file. When we apply distinct on the
data in this file, duplicate entries are removed.<br>
Commands:
```
grunt> loading1 = LOAD '/first' USING PigStorage(',') AS (user:chararray,url:chararray,id:int);
grunt> loading3 = DISTINCT loading1;
grunt> DUMP loading3;
```
### STORE:
Store is used to save results to the file system.
Here we are saving loading3 data into a file named storing on HDFS.<br>
Commands:
```
grunt> STORE loading3 INTO '/storing_path';
```
# Output
