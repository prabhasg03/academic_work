# Task 6
Run the Pig Latin Scripts to find Word Count and max temp for each and every year.
# WordCount
## Procedure
Step1:
1. Create a text file having few lines of text and save it as bd.txt.
2. Create on directory in hdfs named wc
3. Store bd..txt file from local file system to hdfs file system directory wc
Step2:
```
inputline = load '/user/cloudera/wc/bd.txt' using PigStorage('\t') as (data:chararray);
words = FOREACH inputline GENERATE FLATTEN(TOKENIZE(data)) AS word;
filtered_words = FILTER words BY word MATCHES '\\w+';
word_groups = GROUP filtered_words BY word;
word_count = FOREACH word_groups GENERATE COUNT(filtered_words) AS 
count, group AS word;
ordered_word_count = ORDER word_count BY count DESC;
DUMP ordered_word_count;
You can use the below command to save the result in HDFS.
grunt> store ordered_word_count; into '/user/cloudera/wc/output/';
```
## Commands and Outputs
![image](https://github.com/prabhasg03/Task-Codes/assets/121883587/59e988ef-2231-42b5-a45e-5f382cfc1055)
```
grunt> inputline = load '/user/cloudera/21241A6625/Task6/weather.txt' using PigStorage('\t') as (date:chararray);
grunt> DUMP inputline
2024-04-17 23:04:07,877 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: UNKNOWN
2024-04-17 23:04:07,878 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, DuplicateForEachColumnRewrite, GroupByConstParallelSetter, ImplicitSplitInserter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, NewPartitionFilterOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter], RULES_DISABLED=[FilterLogicExpressionSimplifier, PartitionFilterOptimizer]}
2024-04-17 23:04:07,880 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2024-04-17 23:04:07,881 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 1
2024-04-17 23:04:07,881 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 1
2024-04-17 23:04:07,898 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-17 23:04:07,902 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig script settings are added to the job
2024-04-17 23:04:07,903 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2024-04-17 23:04:08,121 [DataStreamer for file /tmp/temp250915078/tmp168330017/hive-hbase-handler-1.1.0-cdh5.13.0.jar] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-17 23:04:08,156 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - creating jar file Job5109238358086745524.jar
2024-04-17 23:04:10,783 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - jar file Job5109238358086745524.jar created
2024-04-17 23:04:10,788 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2024-04-17 23:04:10,788 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2024-04-17 23:04:10,788 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cache
2024-04-17 23:04:10,788 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2024-04-17 23:04:10,794 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2024-04-17 23:04:10,795 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-17 23:04:10,795 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-17 23:04:10,798 [JobControl] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-17 23:04:10,939 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-17 23:04:10,939 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2024-04-17 23:04:10,940 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2024-04-17 23:04:10,966 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2024-04-17 23:04:11,018 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1713416435135_0017
2024-04-17 23:04:11,047 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1713416435135_0017
2024-04-17 23:04:11,049 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713416435135_0017/
2024-04-17 23:04:11,295 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1713416435135_0017
2024-04-17 23:04:11,295 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases inputline
2024-04-17 23:04:11,295 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: inputline[17,12],inputline[-1,-1] C:  R: 
2024-04-17 23:04:11,295 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - More information at: http://localhost:50030/jobdetails.jsp?jobid=job_1713416435135_0017
2024-04-17 23:04:11,315 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2024-04-17 23:04:24,626 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 50% complete
2024-04-17 23:04:26,255 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2024-04-17 23:04:26,255 [main] INFO  org.apache.pig.tools.pigstats.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.6.0-cdh5.13.0	0.12.0-cdh5.13.0	cloudera	2024-04-17 23:04:07	2024-04-17 23:04:26	UNKNOWN

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTIme	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1713416435135_0017	1	0	4	4	4	4	n/a	n/a	n/a	n/a	inputline	MAP_ONLY	hdfs://quickstart.cloudera:8020/tmp/temp250915078/tmp-1019638285,

Input(s):
Successfully read 7 records (422 bytes) from: "/user/cloudera/21241A6625/Task6/weather.txt"

Output(s):
Successfully stored 7 records (61 bytes) in: "hdfs://quickstart.cloudera:8020/tmp/temp250915078/tmp-1019638285"

Counters:
Total records written : 7
Total bytes written : 61
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 0
Total records proactively spilled: 0

Job DAG:
job_1713416435135_0017


2024-04-17 23:04:26,315 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2024-04-17 23:04:26,315 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-17 23:04:26,315 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-17 23:04:26,316 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2024-04-17 23:04:26,321 [main] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-17 23:04:26,321 [main] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
(date)
(hdfs)
(car)
(car)
(car)
(job)
(job)
grunt> words = FOREACH inputline GENERATE FLATTEN(TOKENIZE(date)) AS word;
grunt> filtered_words = FILTER words BY word MATCHES '\\w+';
grunt> word_groups = GROUP filtered_words BY word;
grunt> word_count = FOREACH word_groups GENERATE COUNT(filtered_words) AS 
>> count, group AS word;
grunt> ordered_word_count = ORDER word_count BY count DESC;
grunt> DUMP ordered_word_count;
2024-04-17 23:04:56,596 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: GROUP_BY,ORDER_BY,FILTER
2024-04-17 23:04:56,597 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, DuplicateForEachColumnRewrite, GroupByConstParallelSetter, ImplicitSplitInserter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, NewPartitionFilterOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter], RULES_DISABLED=[FilterLogicExpressionSimplifier, PartitionFilterOptimizer]}
2024-04-17 23:04:56,606 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2024-04-17 23:04:56,615 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.CombinerOptimizer - Choosing to move algebraic foreach to combiner
2024-04-17 23:04:56,616 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 3
2024-04-17 23:04:56,616 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 3
2024-04-17 23:04:56,657 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-17 23:04:56,660 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig script settings are added to the job
2024-04-17 23:04:56,673 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2024-04-17 23:04:56,673 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2024-04-17 23:04:56,673 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Using reducer estimator: org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator
2024-04-17 23:04:56,679 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator - BytesPerReducer=1000000000 maxReducers=999 totalInputFileSize=29
2024-04-17 23:04:56,679 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2024-04-17 23:04:57,010 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - creating jar file Job1547339254531995446.jar
2024-04-17 23:04:59,609 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - jar file Job1547339254531995446.jar created
2024-04-17 23:04:59,614 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2024-04-17 23:04:59,614 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2024-04-17 23:04:59,614 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cache
2024-04-17 23:04:59,614 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2024-04-17 23:04:59,624 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2024-04-17 23:04:59,624 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-17 23:04:59,625 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-17 23:04:59,628 [JobControl] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-17 23:04:59,720 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-17 23:04:59,720 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2024-04-17 23:04:59,722 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2024-04-17 23:04:59,741 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2024-04-17 23:04:59,763 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1713416435135_0018
2024-04-17 23:04:59,791 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1713416435135_0018
2024-04-17 23:04:59,793 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713416435135_0018/
2024-04-17 23:05:00,125 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1713416435135_0018
2024-04-17 23:05:00,125 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases filtered_words,inputline,word_count,word_groups,words
2024-04-17 23:05:00,125 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: inputline[17,12],words[-1,-1],filtered_words[19,17],word_count[21,13],word_groups[20,14] C: word_count[21,13],word_groups[20,14] R: word_count[21,13]
2024-04-17 23:05:00,125 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - More information at: http://localhost:50030/jobdetails.jsp?jobid=job_1713416435135_0018
2024-04-17 23:05:00,147 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2024-04-17 23:05:13,572 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 16% complete
2024-04-17 23:05:21,548 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 33% complete
2024-04-17 23:05:25,245 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig script settings are added to the job
2024-04-17 23:05:25,249 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2024-04-17 23:05:25,249 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2024-04-17 23:05:25,249 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Using reducer estimator: org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator
2024-04-17 23:05:25,254 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator - BytesPerReducer=1000000000 maxReducers=999 totalInputFileSize=46
2024-04-17 23:05:25,254 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2024-04-17 23:05:25,306 [DataStreamer for file /tmp/temp250915078/tmp-1109955044/libthrift-0.9.3.jar] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-17 23:05:25,506 [DataStreamer for file /tmp/temp250915078/tmp-1973564210/hive-hcatalog-pig-adapter-1.1.0-cdh5.13.0.jar] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-17 23:05:25,507 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - creating jar file Job3820228232936777070.jar
2024-04-17 23:05:28,153 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - jar file Job3820228232936777070.jar created
2024-04-17 23:05:28,158 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2024-04-17 23:05:28,158 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2024-04-17 23:05:28,158 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cache
2024-04-17 23:05:28,158 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2024-04-17 23:05:28,166 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2024-04-17 23:05:28,166 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-17 23:05:28,170 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-17 23:05:28,174 [JobControl] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-17 23:05:28,263 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-17 23:05:28,263 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2024-04-17 23:05:28,263 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2024-04-17 23:05:28,280 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2024-04-17 23:05:28,298 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1713416435135_0019
2024-04-17 23:05:28,337 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1713416435135_0019
2024-04-17 23:05:28,340 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713416435135_0019/
2024-04-17 23:05:28,667 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1713416435135_0019
2024-04-17 23:05:28,667 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases ordered_word_count
2024-04-17 23:05:28,667 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: ordered_word_count[24,21] C:  R: 
2024-04-17 23:05:28,667 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - More information at: http://localhost:50030/jobdetails.jsp?jobid=job_1713416435135_0019
2024-04-17 23:05:39,817 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 50% complete
2024-04-17 23:05:47,311 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 66% complete
2024-04-17 23:05:48,947 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig script settings are added to the job
2024-04-17 23:05:48,951 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2024-04-17 23:05:48,951 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2024-04-17 23:05:48,951 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2024-04-17 23:05:49,197 [DataStreamer for file /tmp/temp250915078/tmp-2119361589/hive-hcatalog-pig-adapter-1.1.0-cdh5.13.0.jar] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-17 23:05:49,198 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - creating jar file Job2696872897169232580.jar
2024-04-17 23:05:51,851 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - jar file Job2696872897169232580.jar created
2024-04-17 23:05:51,855 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2024-04-17 23:05:51,856 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2024-04-17 23:05:51,856 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cache
2024-04-17 23:05:51,856 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2024-04-17 23:05:51,866 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2024-04-17 23:05:51,866 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-17 23:05:51,867 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-17 23:05:51,870 [JobControl] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-17 23:05:51,975 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-17 23:05:51,975 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2024-04-17 23:05:51,975 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2024-04-17 23:05:52,009 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2024-04-17 23:05:52,043 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1713416435135_0020
2024-04-17 23:05:52,097 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1713416435135_0020
2024-04-17 23:05:52,100 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713416435135_0020/
2024-04-17 23:05:52,367 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1713416435135_0020
2024-04-17 23:05:52,367 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases ordered_word_count
2024-04-17 23:05:52,367 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: ordered_word_count[24,21] C:  R: 
2024-04-17 23:05:52,367 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - More information at: http://localhost:50030/jobdetails.jsp?jobid=job_1713416435135_0020
2024-04-17 23:06:04,571 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 83% complete
2024-04-17 23:06:17,308 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2024-04-17 23:06:17,315 [main] INFO  org.apache.pig.tools.pigstats.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.6.0-cdh5.13.0	0.12.0-cdh5.13.0	cloudera	2024-04-17 23:04:56	2024-04-17 23:06:17	GROUP_BY,ORDER_BY,FILTER

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTIme	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1713416435135_0018	1	1	4	4	4	4	4	4	4	4	filtered_words,inputline,word_count,word_groups,words	GROUP_BY,COMBINER	
job_1713416435135_0019	1	1	3	3	3	3	4	4	4	4	ordered_word_count	SAMPLER	
job_1713416435135_0020	1	1	4	4	4	4	4	4	4	4	ordered_word_count	ORDER_BY	hdfs://quickstart.cloudera:8020/tmp/temp250915078/tmp-1930982848,

Input(s):
Successfully read 7 records (422 bytes) from: "/user/cloudera/21241A6625/Task6/weather.txt"

Output(s):
Successfully stored 4 records (46 bytes) in: "hdfs://quickstart.cloudera:8020/tmp/temp250915078/tmp-1930982848"

Counters:
Total records written : 4
Total bytes written : 46
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 0
Total records proactively spilled: 0

Job DAG:
job_1713416435135_0018	->	job_1713416435135_0019,
job_1713416435135_0019	->	job_1713416435135_0020,
job_1713416435135_0020


2024-04-17 23:06:18,315 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:40718. Already tried 0 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-17 23:06:19,316 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:40718. Already tried 1 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-17 23:06:20,317 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:40718. Already tried 2 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-17 23:06:20,317 [main] WARN  org.apache.hadoop.ipc.Client - Failed to connect to server: quickstart.cloudera/127.0.0.1:40718: retries get failed due to exceeded maximum allowed retries number: 3
java.net.ConnectException: Connection refused
	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:648)
	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:744)
	at org.apache.hadoop.ipc.Client$Connection.access$3000(Client.java:396)
	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1557)
	at org.apache.hadoop.ipc.Client.call(Client.java:1480)
	at org.apache.hadoop.ipc.Client.call(Client.java:1441)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:230)
	at com.sun.proxy.$Proxy22.getJobReport(Unknown Source)
	at org.apache.hadoop.mapreduce.v2.api.impl.pb.client.MRClientProtocolPBClientImpl.getJobReport(MRClientProtocolPBClientImpl.java:133)
	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:606)
	at org.apache.hadoop.mapred.ClientServiceDelegate.invoke(ClientServiceDelegate.java:324)
	at org.apache.hadoop.mapred.ClientServiceDelegate.getJobStatus(ClientServiceDelegate.java:423)
	at org.apache.hadoop.mapred.YARNRunner.getJobStatus(YARNRunner.java:698)
	at org.apache.hadoop.mapreduce.Cluster.getJob(Cluster.java:206)
	at org.apache.hadoop.mapred.JobClient$2.run(JobClient.java:604)
	at org.apache.hadoop.mapred.JobClient$2.run(JobClient.java:602)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:415)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1917)
	at org.apache.hadoop.mapred.JobClient.getJobUsingCluster(JobClient.java:602)
	at org.apache.hadoop.mapred.JobClient.getTaskReports(JobClient.java:673)
	at org.apache.hadoop.mapred.JobClient.getMapTaskReports(JobClient.java:667)
	at org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.Launcher.getStats(Launcher.java:150)
	at org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher.launchPig(MapReduceLauncher.java:468)
	at org.apache.pig.PigServer.launchPlan(PigServer.java:1334)
	at org.apache.pig.PigServer.executeCompiledLogicalPlan(PigServer.java:1319)
	at org.apache.pig.PigServer.storeEx(PigServer.java:990)
	at org.apache.pig.PigServer.store(PigServer.java:954)
	at org.apache.pig.PigServer.openIterator(PigServer.java:867)
	at org.apache.pig.tools.grunt.GruntParser.processDump(GruntParser.java:774)
	at org.apache.pig.tools.pigscript.parser.PigScriptParser.parse(PigScriptParser.java:372)
	at org.apache.pig.tools.grunt.GruntParser.parseStopOnError(GruntParser.java:198)
	at org.apache.pig.tools.grunt.GruntParser.parseStopOnError(GruntParser.java:173)
	at org.apache.pig.tools.grunt.Grunt.run(Grunt.java:69)
	at org.apache.pig.Main.run(Main.java:547)
	at org.apache.pig.Main.main(Main.java:158)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:606)
	at org.apache.hadoop.util.RunJar.run(RunJar.java:221)
	at org.apache.hadoop.util.RunJar.main(RunJar.java:136)
2024-04-17 23:06:20,422 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2024-04-17 23:06:21,609 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:35441. Already tried 0 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-17 23:06:22,610 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:35441. Already tried 1 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-17 23:06:23,610 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:35441. Already tried 2 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-17 23:06:23,611 [main] WARN  org.apache.hadoop.ipc.Client - Failed to connect to server: quickstart.cloudera/127.0.0.1:35441: retries get failed due to exceeded maximum allowed retries number: 3
java.net.ConnectException: Connection refused
	at sun.nio.ch.SocketChannelImpl.checkConnect(Native Method)
	at sun.nio.ch.SocketChannelImpl.finishConnect(SocketChannelImpl.java:739)
	at org.apache.hadoop.net.SocketIOWithTimeout.connect(SocketIOWithTimeout.java:206)
	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:530)
	at org.apache.hadoop.net.NetUtils.connect(NetUtils.java:494)
	at org.apache.hadoop.ipc.Client$Connection.setupConnection(Client.java:648)
	at org.apache.hadoop.ipc.Client$Connection.setupIOstreams(Client.java:744)
	at org.apache.hadoop.ipc.Client$Connection.access$3000(Client.java:396)
	at org.apache.hadoop.ipc.Client.getConnection(Client.java:1557)
	at org.apache.hadoop.ipc.Client.call(Client.java:1480)
	at org.apache.hadoop.ipc.Client.call(Client.java:1441)
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:230)
	at com.sun.proxy.$Proxy22.getJobReport(Unknown Source)
	at org.apache.hadoop.mapreduce.v2.api.impl.pb.client.MRClientProtocolPBClientImpl.getJobReport(MRClientProtocolPBClientImpl.java:133)
	at sun.reflect.GeneratedMethodAccessor7.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:606)
	at org.apache.hadoop.mapred.ClientServiceDelegate.invoke(ClientServiceDelegate.java:324)
	at org.apache.hadoop.mapred.ClientServiceDelegate.getJobStatus(ClientServiceDelegate.java:423)
	at org.apache.hadoop.mapred.YARNRunner.getJobStatus(YARNRunner.java:698)
	at org.apache.hadoop.mapreduce.Cluster.getJob(Cluster.java:206)
	at org.apache.hadoop.mapred.JobClient$2.run(JobClient.java:604)
	at org.apache.hadoop.mapred.JobClient$2.run(JobClient.java:602)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:415)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1917)
	at org.apache.hadoop.mapred.JobClient.getJobUsingCluster(JobClient.java:602)
	at org.apache.hadoop.mapred.JobClient.getTaskReports(JobClient.java:673)
	at org.apache.hadoop.mapred.JobClient.getMapTaskReports(JobClient.java:667)
	at org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.Launcher.getStats(Launcher.java:150)
	at org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher.launchPig(MapReduceLauncher.java:468)
	at org.apache.pig.PigServer.launchPlan(PigServer.java:1334)
	at org.apache.pig.PigServer.executeCompiledLogicalPlan(PigServer.java:1319)
	at org.apache.pig.PigServer.storeEx(PigServer.java:990)
	at org.apache.pig.PigServer.store(PigServer.java:954)
	at org.apache.pig.PigServer.openIterator(PigServer.java:867)
	at org.apache.pig.tools.grunt.GruntParser.processDump(GruntParser.java:774)
	at org.apache.pig.tools.pigscript.parser.PigScriptParser.parse(PigScriptParser.java:372)
	at org.apache.pig.tools.grunt.GruntParser.parseStopOnError(GruntParser.java:198)
	at org.apache.pig.tools.grunt.GruntParser.parseStopOnError(GruntParser.java:173)
	at org.apache.pig.tools.grunt.Grunt.run(Grunt.java:69)
	at org.apache.pig.Main.run(Main.java:547)
	at org.apache.pig.Main.main(Main.java:158)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:606)
	at org.apache.hadoop.util.RunJar.run(RunJar.java:221)
	at org.apache.hadoop.util.RunJar.main(RunJar.java:136)
2024-04-17 23:06:23,712 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2024-04-17 23:06:23,959 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2024-04-17 23:06:24,094 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2024-04-17 23:06:24,095 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-17 23:06:24,095 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-17 23:06:24,096 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2024-04-17 23:06:24,102 [main] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-17 23:06:24,102 [main] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
(3,car)
(2,job)
(1,hdfs)
(1,date)
grunt> store ordered_word_count into '/user/cloudera/21241A6625/Task6/OUTPUT/';
[cloudera@quickstart ~]$ ^C
[cloudera@quickstart ~]$ hdfs dfs -cat /user/cloudera/21241A6625/Task6/OUTPUT/part-r-00000
3	car
2	job
1	hdfs
1	date
```
# Max Year
## Procedure
```
A = LOAD 'user/cloudera/wc/weather.txt' USING PigStorage() AS (year:int,temp:int);
B = ORDER A BY temp DESC;
C = LIMIT B 1;
D = FOREACH C GENERATE Temp;
DUMP D
```
## Commands and Outputs
```

```
