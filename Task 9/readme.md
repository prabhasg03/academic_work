## Task 9
Writing user defined functions in Hive
# Procedure
Step1:- open eclipse and create a new java project (udf_example).
Add External JARs from usr/lib/hive/lib/
Inside that create a new class.
Package name: udf_example
Class name: DataStandardization
Program:
```
package udf_example;
import org.apache.hadoop.hive.ql.exec.UDF;
public class DataStandardization extends UDF
{
public String evaluate(String input)
{
if(input==null)
{
return null;
}
return (input.toString().toUpperCase());
}
}
```
Step 2:
Import hive jar files
Create the jar file for the above program
Connect to hive from cloudera quickstart terminal by typing ‘hive’
```
hive>SHOW databases;
hive>CREATE DATABASE database_name;
hive>USE sales(database name);
hive>create table if not exists sample_table(name string, count int)row format delimited fields
terminated by ‘,’ lines terminated by ‘\n’ stored as textfile;
load data local inpath ‘/home/cloudera/Downloads/sample_data.txt’
overwrite into table sample_table;
```
Export the jar file for the java project
Right click project --&gt; export --&gt; jar file. (jar file will be created)
Add the jar and create temporary function
```
ADD JAR /home/cloudera/Desktop/udf_example.jar;
Create temporary function standardize as ‘udf_example.DataStandardization’;
```
Calling this UDF on a column in a table.
```
select standardize(name) from sample_table;
```
Issue: this jar &amp; function is valid only for current session, if you comeout of the hive and go back
in , then you won’t be able to call this function).

To create a permanent function , we need to have our jar in hdfs.
So, now transfer the jar to HDFS from local
```
hadoop fs -put udf_example.jar /user/cloudera/
```
For creating a permanent function in hive :
```
CREATE FUNCTION standardize_permanent AS ‘udf_example.DataStandardization’ using JAR
‘user/cloudera/udf_example.jar’;
```
Calling the function:
```
select standardize_permanent(name) from sample_table;
```
