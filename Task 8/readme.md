# Task 8
Working with HiveQL, Use Hive to create,alter and drop database,tables,views,functions and indexes
# Exploratory Data Analysis(EDA) of Sales using Demographic Data with hive
- DataSet Used: [sales.csv](https://github.com/prabhasg03/Task-Codes/new/Big-Data-Analytics-Lab/Task%208/sales.csv)
### Procedure
### Commands and Outputs
![image](https://github.com/prabhasg03/Task-Codes/assets/121883587/53f8b4d2-4326-49ff-ba61-c88a59010411)
![image](https://github.com/prabhasg03/Task-Codes/assets/121883587/b791ead1-1521-44dd-8581-f386730328b7)
![Screenshot (23)](https://github.com/prabhasg03/Task-Codes/assets/121883587/b01abf15-f4a4-42f3-9cbf-fa489ce5e771)
```
[cloudera@quickstart ~]$ hdfs dfs -ls /user/cloudera/21241A6625/Task8/
Found 2 items
-rw-r--r--   1 cloudera cloudera      24223 2024-04-24 22:06 /user/cloudera/21241A6625/Task8/Queens_Library_Branches.csv
-rw-r--r--   1 cloudera cloudera        687 2024-04-24 21:53 /user/cloudera/21241A6625/Task8/sales.csv
[cloudera@quickstart ~]$ hive

Logging initialized using configuration in file:/etc/hive/conf.dist/hive-log4j.properties
WARNING: Hive CLI is deprecated and migration to Beeline is recommended.
hive> SHOW databases;
OK
default
ggg
sales
Time taken: 0.557 seconds, Fetched: 3 row(s)
hive> DROP database sales;
OK
Time taken: 1.01 seconds
hive> CREATE database sales;
OK
hive> USE sales;
OK
Time taken: 0.021 second
hive> CREATE TABLE sales1(Sales_Executive INT,Sales_Executive_Name STRING,Gender STRING,Age INT,Loc STRING,Sales_in_Rs INT)
    > ROW FORMAT DELIMITED
    > FIELDS TERMINATED BY ','
    > LINES TERMINATED BY '\n'
    > STORED AS TEXTFILE;
OK
Time taken: 0.366 seconds
hive> LOAD DATA INPATH '/user/cloudera/21241A6625/Task8/sales.csv' into TABLE sales1;
Loading data to table sales.sales1
Table sales.sales1 stats: [numFiles=1, totalSize=680]
OK
Time taken: 0.54 seconds
hive> SELECT SUM(Sales_in_Rs) FROM sales1;
Query ID = cloudera_20240424222121_be3c2924-edd3-4e58-a7f6-c128c7d35a82
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1714020214426_0001, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1714020214426_0001/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1714020214426_0001
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2024-04-24 22:22:10,908 Stage-1 map = 0%,  reduce = 0%
2024-04-24 22:22:18,623 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 0.9 sec
2024-04-24 22:22:27,149 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 1.97 sec
MapReduce Total cumulative CPU time: 1 seconds 970 msec
Ended Job = job_1714020214426_0001
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 1.97 sec   HDFS Read: 8573 HDFS Write: 4 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 970 msec
OK
871
Time taken: 31.183 seconds, Fetched: 1 row(s)
hive> SELECT MAX(Sales_in_Rs),MIN(Sales_in_Rs) FROM sales1;
Query ID = cloudera_20240424222323_fa86fc83-dd4c-455d-a262-75b6ef756264
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1714020214426_0002, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1714020214426_0002/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1714020214426_0002
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2024-04-24 22:23:24,148 Stage-1 map = 0%,  reduce = 0%
2024-04-24 22:23:30,495 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 0.84 sec
2024-04-24 22:23:37,855 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 1.88 sec
MapReduce Total cumulative CPU time: 1 seconds 880 msec
Ended Job = job_1714020214426_0002
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 1.88 sec   HDFS Read: 9231 HDFS Write: 6 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 880 msec
OK
77	11
Time taken: 21.883 seconds, Fetched: 1 row(s)
hive> SELECT Loc,SUM(Sales_in_Rs) FROM sales1 GROUP BY Loc;
Query ID = cloudera_20240424222424_f9e1554e-f157-4792-b3b7-85452abc6a2b
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1714020214426_0004, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1714020214426_0004/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1714020214426_0004
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2024-04-24 22:25:01,348 Stage-1 map = 0%,  reduce = 0%
2024-04-24 22:25:07,771 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 0.82 sec
2024-04-24 22:25:15,233 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 1.85 sec
MapReduce Total cumulative CPU time: 1 seconds 850 msec
Ended Job = job_1714020214426_0004
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 1.85 sec   HDFS Read: 8961 HDFS Write: 46 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 850 msec
OK
Bangalore	224
Hyderabad	466
Loc	NULL
Mumbai	181
Time taken: 22.994 seconds, Fetched: 4 row(s)
hive> SELECT Loc,AVG(Sales_in_Rs) FROM sales1 GROUP BY Loc;
Query ID = cloudera_20240424222626_2b1041d4-fae6-4c0b-919b-f69755718e73
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks not specified. Estimated from input data size: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Starting Job = job_1714020214426_0006, Tracking URL = http://quickstart.cloudera:8088/proxy/application_1714020214426_0006/
Kill Command = /usr/lib/hadoop/bin/hadoop job  -kill job_1714020214426_0006
Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 1
2024-04-24 22:26:58,854 Stage-1 map = 0%,  reduce = 0%
2024-04-24 22:27:05,214 Stage-1 map = 100%,  reduce = 0%, Cumulative CPU 0.83 sec
2024-04-24 22:27:12,584 Stage-1 map = 100%,  reduce = 100%, Cumulative CPU 1.86 sec
MapReduce Total cumulative CPU time: 1 seconds 860 msec
Ended Job = job_1714020214426_0006
MapReduce Jobs Launched: 
Stage-Stage-1: Map: 1  Reduce: 1   Cumulative CPU: 1.86 sec   HDFS Read: 9420 HDFS Write: 78 SUCCESS
Total MapReduce CPU Time Spent: 1 seconds 860 msec
OK
Bangalore	37.333333333333336
Hyderabad	58.25
Loc	NULL
Mumbai	30.166666666666668
Time taken: 20.813 seconds, Fetched: 4 row(s)
```

# Analysis of Queens Library Branches
- DataSet Used: [Queens_Library_Branches.csv](https://github.com/prabhasg03/Task-Codes/new/Big-Data-Analytics-Lab/Task%208/Queens_Library_Branches.csv)
### Procedure
### Commands and Outputs
