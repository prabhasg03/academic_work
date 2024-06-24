# Task 7
Writing User Defined Functions/Eval Functions for filtering unwanted data in pig.
# Procedure
### Step 1: Load the file
Load the text file data in pig, use below command. Change the location as per your environment.
```
INPUT_RECORDS = LOAD 'input_file_path' USING PigStorage('|') AS (id:chararray,contype:chararray);
```
Check whether the file is loaded successfully or not.
```
DUMP INPUT_RECORDS
```
### Step 2: Filter the record as per the requirement
<br>Use below command:
```
INTERMD_RECORDS = FILTER INPUT_RECORDS BY (contype=='POSTP' OR contype=='PREP' OR contype IS NULL OR contype=='');
```
<p>Here, only those records will come which are having connection type in "POSTP","PREP"and blank. Blank in a string can be meant to either null or empty string, so contype="" is also
written.</p>
Let’s visualize it using below command:<br>

```
DUMP INTERMD_RECORDS
```
### Step 3: Output
```
OUTPUT_RECORDS = FOREACH INTERMD_RECORDS GENERATE id,((contype ISNULL OR contype=='';)?'NA':contype) AS contype;
```
Here, we have assigned “NA” value to blank contype.
Let’s visualize it using below command:
```
DUMP OUTPUT_RECORDS
```
If you compare the above output with input, you would be able to see the difference that
unwanted records are no longer present in the output.
- DataSet I used: [data.txt](https://github.com/prabhasg03/Task-Codes/tree/Big-Data-Analytics-Lab/Task%207/data.txt)
# Commands and Output
![image](https://github.com/prabhasg03/Task-Codes/assets/121883587/e652fc5a-1b35-496a-bf08-dff4b71b5473)
```
grunt> INPUT_RECORDS = LOAD '/user/cloudera/21241A6625/Task7/data.txt' USING PigStorage('|') AS (id:chararray,contype:chararray);
grunt> DUMP INPUT_RECORDS;
2024-04-22 02:29:54,048 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: UNKNOWN
2024-04-22 02:29:54,048 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, DuplicateForEachColumnRewrite, GroupByConstParallelSetter, ImplicitSplitInserter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, NewPartitionFilterOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter], RULES_DISABLED=[FilterLogicExpressionSimplifier, PartitionFilterOptimizer]}
2024-04-22 02:29:54,051 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2024-04-22 02:29:54,051 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 1
2024-04-22 02:29:54,051 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 1
2024-04-22 02:29:54,071 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-22 02:29:54,072 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig script settings are added to the job
2024-04-22 02:29:54,077 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2024-04-22 02:29:54,242 [DataStreamer for file /tmp/temp974947234/tmp-1418223344/hive-exec-1.1.0-cdh5.13.0.jar block BP-333635372-127.0.0.1-1508779710286:blk_1073746883_6108] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeInternal(DFSOutputStream.java:935)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:931)
2024-04-22 02:29:54,286 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - creating jar file Job480182479624702456.jar
2024-04-22 02:29:57,018 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - jar file Job480182479624702456.jar created
2024-04-22 02:29:57,024 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2024-04-22 02:29:57,024 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2024-04-22 02:29:57,025 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cache
2024-04-22 02:29:57,025 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2024-04-22 02:29:57,035 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2024-04-22 02:29:57,036 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-22 02:29:57,039 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-22 02:29:57,059 [JobControl] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-22 02:29:57,176 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-22 02:29:57,176 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2024-04-22 02:29:57,177 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2024-04-22 02:29:57,192 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2024-04-22 02:29:57,234 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1713598644935_0059
2024-04-22 02:29:57,283 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1713598644935_0059
2024-04-22 02:29:57,285 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713598644935_0059/
2024-04-22 02:29:57,538 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1713598644935_0059
2024-04-22 02:29:57,538 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases INPUT_RECORDS
2024-04-22 02:29:57,538 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: INPUT_RECORDS[4,16],INPUT_RECORDS[-1,-1] C:  R: 
2024-04-22 02:29:57,538 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - More information at: http://localhost:50030/jobdetails.jsp?jobid=job_1713598644935_0059
2024-04-22 02:29:57,583 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2024-04-22 02:30:09,966 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 50% complete
2024-04-22 02:30:12,641 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2024-04-22 02:30:12,641 [main] INFO  org.apache.pig.tools.pigstats.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.6.0-cdh5.13.0	0.12.0-cdh5.13.0	cloudera	2024-04-22 02:29:54	2024-04-22 02:30:12	UNKNOWN

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTIme	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1713598644935_0059	1	0	4	4	4	4	n/a	n/a	n/a	n/a	INPUT_RECORDS	MAP_ONLY	hdfs://quickstart.cloudera:8020/tmp/temp974947234/tmp-7945170,

Input(s):
Successfully read 12 records (534 bytes) from: "/user/cloudera/21241A6625/Task7/data.txt"

Output(s):
Successfully stored 12 records (209 bytes) in: "hdfs://quickstart.cloudera:8020/tmp/temp974947234/tmp-7945170"

Counters:
Total records written : 12
Total bytes written : 209
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 0
Total records proactively spilled: 0

Job DAG:
job_1713598644935_0059


2024-04-22 02:30:12,706 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2024-04-22 02:30:12,706 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-22 02:30:12,706 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-22 02:30:12,707 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2024-04-22 02:30:12,712 [main] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-22 02:30:12,712 [main] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
(1A58252,POSTP)
(73VS543,)
(HD52836,PREP)
(8SH356H,POSTP)
(L62HJS5,PEND)
(Q672821,PREP)
(M672GS6,CLS)
(DGSW522,POSTP)
(RAR1729,PEND)
(YE52863,)
(GHS5281,)
(SYY8373,CLS)
grunt> INTERMD_RECORDS = FILTER INPUT_RECORDS BY (contype=='POSTP'; OR contype=='PREP' OR contype IS NULL OR contype=='');
2024-04-22 02:30:20,991 [main] ERROR org.apache.pig.tools.grunt.Grunt - ERROR 1200: <line 5, column 59>  Syntax error, unexpected symbol at or near ';'
Details at logfile: /home/cloudera/pig_1713777613381.log
grunt> INTERMD_RECORDS = FILTER INPUT_RECORDS BY (contype=='POSTP' OR contype=='PREP' OR contype IS NULL OR contype=='');
grunt> DUMP INTERMD_RECORDS
2024-04-22 02:30:43,517 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: FILTER
2024-04-22 02:30:43,518 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, DuplicateForEachColumnRewrite, GroupByConstParallelSetter, ImplicitSplitInserter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, NewPartitionFilterOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter], RULES_DISABLED=[FilterLogicExpressionSimplifier, PartitionFilterOptimizer]}
2024-04-22 02:30:43,524 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2024-04-22 02:30:43,525 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 1
2024-04-22 02:30:43,525 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 1
2024-04-22 02:30:43,540 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-22 02:30:43,541 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig script settings are added to the job
2024-04-22 02:30:43,546 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2024-04-22 02:30:43,751 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - creating jar file Job2666065447392819672.jar
2024-04-22 02:30:46,410 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - jar file Job2666065447392819672.jar created
2024-04-22 02:30:46,427 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2024-04-22 02:30:46,427 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2024-04-22 02:30:46,428 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cache
2024-04-22 02:30:46,428 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2024-04-22 02:30:46,444 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2024-04-22 02:30:46,445 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-22 02:30:46,447 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-22 02:30:46,456 [JobControl] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-22 02:30:46,530 [DataStreamer for file /tmp/hadoop-yarn/staging/cloudera/.staging/job_1713598644935_0060/job.jar] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-22 02:30:46,553 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-22 02:30:46,553 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2024-04-22 02:30:46,554 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2024-04-22 02:30:46,573 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2024-04-22 02:30:46,670 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1713598644935_0060
2024-04-22 02:30:46,715 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1713598644935_0060
2024-04-22 02:30:46,716 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713598644935_0060/
2024-04-22 02:30:46,947 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1713598644935_0060
2024-04-22 02:30:46,947 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases INPUT_RECORDS,INTERMD_RECORDS
2024-04-22 02:30:46,947 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: INPUT_RECORDS[4,16],INPUT_RECORDS[-1,-1],INTERMD_RECORDS[5,18] C:  R: 
2024-04-22 02:30:46,947 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - More information at: http://localhost:50030/jobdetails.jsp?jobid=job_1713598644935_0060
2024-04-22 02:30:46,965 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2024-04-22 02:30:59,485 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 50% complete
2024-04-22 02:31:02,159 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2024-04-22 02:31:02,159 [main] INFO  org.apache.pig.tools.pigstats.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.6.0-cdh5.13.0	0.12.0-cdh5.13.0	cloudera	2024-04-22 02:30:43	2024-04-22 02:31:02	FILTER

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTIme	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1713598644935_0060	1	0	4	4	4	4	n/a	n/a	n/a	n/a	INPUT_RECORDS,INTERMD_RECORDS	MAP_ONLY	hdfs://quickstart.cloudera:8020/tmp/temp974947234/tmp-208937292,

Input(s):
Successfully read 12 records (534 bytes) from: "/user/cloudera/21241A6625/Task7/data.txt"

Output(s):
Successfully stored 8 records (139 bytes) in: "hdfs://quickstart.cloudera:8020/tmp/temp974947234/tmp-208937292"

Counters:
Total records written : 8
Total bytes written : 139
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 0
Total records proactively spilled: 0

Job DAG:
job_1713598644935_0060


2024-04-22 02:31:02,235 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2024-04-22 02:31:02,235 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-22 02:31:02,235 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-22 02:31:02,236 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2024-04-22 02:31:02,241 [main] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-22 02:31:02,241 [main] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
(1A58252,POSTP)
(73VS543,)
(HD52836,PREP)
(8SH356H,POSTP)
(Q672821,PREP)
(DGSW522,POSTP)
(YE52863,)
(GHS5281,)
grunt> OUTPUT_RECORDS = FOREACH INTERMD_RECORDS GENERATE id,((contype IS NULL OR contype=='')?'NA':contype) AS contype;
grunt> DUMP OUTPUT_RECORDS
2024-04-22 02:31:12,562 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: FILTER
2024-04-22 02:31:12,562 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, DuplicateForEachColumnRewrite, GroupByConstParallelSetter, ImplicitSplitInserter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, NewPartitionFilterOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter], RULES_DISABLED=[FilterLogicExpressionSimplifier, PartitionFilterOptimizer]}
2024-04-22 02:31:12,566 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2024-04-22 02:31:12,572 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 1
2024-04-22 02:31:12,572 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 1
2024-04-22 02:31:12,589 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-22 02:31:12,591 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig script settings are added to the job
2024-04-22 02:31:12,605 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2024-04-22 02:31:12,739 [DataStreamer for file /tmp/temp974947234/tmp-2113083808/hive-exec-1.1.0-cdh5.13.0.jar] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-22 02:31:12,772 [DataStreamer for file /tmp/temp974947234/tmp1600866733/hive-hbase-handler-1.1.0-cdh5.13.0.jar] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-22 02:31:12,807 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - creating jar file Job1737271049206396472.jar
2024-04-22 02:31:15,527 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - jar file Job1737271049206396472.jar created
2024-04-22 02:31:15,532 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2024-04-22 02:31:15,533 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2024-04-22 02:31:15,533 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cache
2024-04-22 02:31:15,533 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2024-04-22 02:31:15,541 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2024-04-22 02:31:15,541 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-22 02:31:15,542 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-22 02:31:15,546 [JobControl] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-22 02:31:15,641 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-22 02:31:15,641 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2024-04-22 02:31:15,642 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2024-04-22 02:31:15,659 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2024-04-22 02:31:15,687 [DataStreamer for file /tmp/hadoop-yarn/staging/cloudera/.staging/job_1713598644935_0061/job.xml] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-22 02:31:15,687 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1713598644935_0061
2024-04-22 02:31:15,715 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1713598644935_0061
2024-04-22 02:31:15,719 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713598644935_0061/
2024-04-22 02:31:16,041 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1713598644935_0061
2024-04-22 02:31:16,041 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases INPUT_RECORDS,INTERMD_RECORDS,OUTPUT_RECORDS
2024-04-22 02:31:16,041 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: INPUT_RECORDS[4,16],INPUT_RECORDS[-1,-1],INTERMD_RECORDS[5,18],OUTPUT_RECORDS[6,17] C:  R: 
2024-04-22 02:31:16,041 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - More information at: http://localhost:50030/jobdetails.jsp?jobid=job_1713598644935_0061
2024-04-22 02:31:16,120 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2024-04-22 02:31:28,030 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 50% complete
2024-04-22 02:31:31,241 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2024-04-22 02:31:31,241 [main] INFO  org.apache.pig.tools.pigstats.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.6.0-cdh5.13.0	0.12.0-cdh5.13.0	cloudera	2024-04-22 02:31:12	2024-04-22 02:31:31	FILTER

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTIme	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1713598644935_0061	1	0	4	4	4	4	n/a	n/a	n/a	n/a	INPUT_RECORDS,INTERMD_RECORDS,OUTPUT_RECORDS	MAP_ONLY	hdfs://quickstart.cloudera:8020/tmp/temp974947234/tmp-1931402450,

Input(s):
Successfully read 12 records (534 bytes) from: "/user/cloudera/21241A6625/Task7/data.txt"

Output(s):
Successfully stored 8 records (151 bytes) in: "hdfs://quickstart.cloudera:8020/tmp/temp974947234/tmp-1931402450"

Counters:
Total records written : 8
Total bytes written : 151
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 0
Total records proactively spilled: 0

Job DAG:
job_1713598644935_0061


2024-04-22 02:31:31,314 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2024-04-22 02:31:31,314 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-22 02:31:31,314 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-22 02:31:31,315 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2024-04-22 02:31:31,319 [main] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-22 02:31:31,319 [main] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
(1A58252,POSTP)
(73VS543,NA)
(HD52836,PREP)
(8SH356H,POSTP)
(Q672821,PREP)
(DGSW522,POSTP)
(YE52863,NA)
(GHS5281,NA)
grunt> 

```
