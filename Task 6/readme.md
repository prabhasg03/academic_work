# Task 6
Run the Pig Latin Scripts to find Word Count and max temp for each and every year.
# WordCount
## Procedure
Text File I used:[weather.txt](https://github.com/prabhasg03/Task-Codes/edit/Big-Data-Analytics-Lab/Task%206/weather.txt)<br>
Step1:
1. Create a text file having few lines of text and save it as bd.txt.
2. Create on directory in hdfs named wc
3. Store bd..txt file from local file system to hdfs file system directory wc
Step2:
```
inputline = load '/user/cloudera/21241A6625/Task6/weather.txt' using PigStorage('\t') as (data:chararray);
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

![image](https://github.com/prabhasg03/Task-Codes/assets/121883587/558201e5-395b-41c7-aa4f-fd0dc0461f26)


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
Text File I used:[Weather1.txt](https://github.com/prabhasg03/Task-Codes/edit/Big-Data-Analytics-Lab/Task%206/Weather1.txt)<br>
Enter the Below commands in command prompt:
```
[cloudera@quickstart ~]$ pig
grunt> A = LOAD 'user/cloudera/21241A6625/Task6/Weather1.txt' USING PigStorage() AS (year:int,temp:int);
grunt> B = ORDER A BY temp DESC;
grunt> C = LIMIT B 1;
grunt> D = FOREACH C GENERATE Temp;
grunt> DUMP D
```
## Commands and Outputs
```
![image](https://github.com/prabhasg03/Task-Codes/assets/121883587/d7f3d726-18fa-4dc5-a4a7-832607a8f4b4)

[cloudera@quickstart ~]$ pig
log4j:WARN No appenders could be found for logger (org.apache.hadoop.util.Shell).
log4j:WARN Please initialize the log4j system properly.
log4j:WARN See http://logging.apache.org/log4j/1.2/faq.html#noconfig for more info.
2024-04-20 01:22:50,385 [main] INFO  org.apache.pig.Main - Apache Pig version 0.12.0-cdh5.13.0 (rexported) compiled Oct 04 2017, 11:09:03
2024-04-20 01:22:50,385 [main] INFO  org.apache.pig.Main - Logging error messages to: /home/cloudera/pig_1713601370371.log
2024-04-20 01:22:50,401 [main] INFO  org.apache.pig.impl.util.Utils - Default bootup file /home/cloudera/.pigbootup not found
2024-04-20 01:22:51,010 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:22:51,010 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:22:51,010 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to hadoop file system at: hdfs://quickstart.cloudera:8020
2024-04-20 01:22:52,242 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:22:52,242 [main] INFO  org.apache.pig.backend.hadoop.executionengine.HExecutionEngine - Connecting to map-reduce job tracker at: localhost:8021
2024-04-20 01:22:52,242 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:22:52,305 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:22:52,307 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:22:52,402 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:22:52,403 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:22:52,485 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:22:52,486 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:22:52,566 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:22:52,568 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:22:52,640 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:22:52,642 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:22:52,710 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:22:52,710 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:22:52,788 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:22:52,788 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:22:52,862 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:22:52,863 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
grunt> A = LOAD '/user/cloudera/21241A6625/Task6/Weather1.txt' USING PigStorage() AS (Temp:int);
grunt> B = ORDER A BY Temp DESC;
grunt> C = LIMIT B 1;
grunt> D = FOREACH C GENERATE Temp;
grunt> DUMP D;
2024-04-20 01:23:17,940 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig features used in the script: ORDER_BY,LIMIT
2024-04-20 01:23:17,970 [main] INFO  org.apache.pig.newplan.logical.optimizer.LogicalPlanOptimizer - {RULES_ENABLED=[AddForEach, ColumnMapKeyPrune, DuplicateForEachColumnRewrite, GroupByConstParallelSetter, ImplicitSplitInserter, LimitOptimizer, LoadTypeCastInserter, MergeFilter, MergeForEach, NewPartitionFilterOptimizer, PushDownForEachFlatten, PushUpFilter, SplitFilter, StreamTypeCastInserter], RULES_DISABLED=[FilterLogicExpressionSimplifier, PartitionFilterOptimizer]}
2024-04-20 01:23:18,055 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MRCompiler - File concatenation threshold: 100 optimistic? false
2024-04-20 01:23:18,126 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size before optimization: 4
2024-04-20 01:23:18,126 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MultiQueryOptimizer - MR plan size after optimization: 4
2024-04-20 01:23:18,207 [main] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-20 01:23:18,406 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig script settings are added to the job
2024-04-20 01:23:18,445 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.reduce.markreset.buffer.percent is deprecated. Instead, use mapreduce.reduce.markreset.buffer.percent
2024-04-20 01:23:18,445 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2024-04-20 01:23:18,445 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.output.compress is deprecated. Instead, use mapreduce.output.fileoutputformat.compress
2024-04-20 01:23:18,649 [DataStreamer for file /tmp/temp-725171896/tmp-499436284/libthrift-0.9.3.jar] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-20 01:23:18,837 [DataStreamer for file /tmp/temp-725171896/tmp-2030972486/hive-hcatalog-pig-adapter-1.1.0-cdh5.13.0.jar] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-20 01:23:18,837 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - creating jar file Job3979954303327635499.jar
2024-04-20 01:23:21,799 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - jar file Job3979954303327635499.jar created
2024-04-20 01:23:21,799 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.jar is deprecated. Instead, use mapreduce.job.jar
2024-04-20 01:23:21,825 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2024-04-20 01:23:21,835 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2024-04-20 01:23:21,839 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cache
2024-04-20 01:23:21,839 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2024-04-20 01:23:21,887 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2024-04-20 01:23:21,893 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker.http.address is deprecated. Instead, use mapreduce.jobtracker.http.address
2024-04-20 01:23:21,893 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:23:21,903 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-20 01:23:21,916 [JobControl] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:23:22,210 [DataStreamer for file /tmp/hadoop-yarn/staging/cloudera/.staging/job_1713598644935_0027/job.jar block BP-333635372-127.0.0.1-1508779710286:blk_1073746215_5435] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeInternal(DFSOutputStream.java:935)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:931)
2024-04-20 01:23:22,270 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-20 01:23:22,270 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2024-04-20 01:23:22,288 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2024-04-20 01:23:22,324 [DataStreamer for file /tmp/hadoop-yarn/staging/cloudera/.staging/job_1713598644935_0027/job.splitmetainfo] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-20 01:23:22,325 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2024-04-20 01:23:22,523 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1713598644935_0027
2024-04-20 01:23:22,733 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1713598644935_0027
2024-04-20 01:23:22,767 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713598644935_0027/
2024-04-20 01:23:22,767 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1713598644935_0027
2024-04-20 01:23:22,767 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases A
2024-04-20 01:23:22,767 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: A[1,4],A[-1,-1] C:  R: 
2024-04-20 01:23:22,767 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - More information at: http://localhost:50030/jobdetails.jsp?jobid=job_1713598644935_0027
2024-04-20 01:23:22,798 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 0% complete
2024-04-20 01:23:35,508 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 12% complete
2024-04-20 01:23:38,091 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 25% complete
2024-04-20 01:23:38,253 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.reduce.tasks is deprecated. Instead, use mapreduce.job.reduces
2024-04-20 01:23:38,320 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig script settings are added to the job
2024-04-20 01:23:38,337 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2024-04-20 01:23:38,339 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2024-04-20 01:23:38,344 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Using reducer estimator: org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator
2024-04-20 01:23:38,358 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.InputSizeReducerEstimator - BytesPerReducer=1000000000 maxReducers=999 totalInputFileSize=37
2024-04-20 01:23:38,359 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2024-04-20 01:23:38,558 [DataStreamer for file /tmp/temp-725171896/tmp600620571/hive-hbase-handler-1.1.0-cdh5.13.0.jar] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-20 01:23:38,577 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - creating jar file Job7438856388907299581.jar
2024-04-20 01:23:41,264 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - jar file Job7438856388907299581.jar created
2024-04-20 01:23:41,283 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2024-04-20 01:23:41,295 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2024-04-20 01:23:41,295 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cache
2024-04-20 01:23:41,295 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2024-04-20 01:23:41,346 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2024-04-20 01:23:41,346 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:23:41,348 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-20 01:23:41,351 [JobControl] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:23:41,465 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-20 01:23:41,465 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2024-04-20 01:23:41,465 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2024-04-20 01:23:41,498 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2024-04-20 01:23:41,574 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1713598644935_0028
2024-04-20 01:23:41,613 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1713598644935_0028
2024-04-20 01:23:41,617 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713598644935_0028/
2024-04-20 01:23:41,848 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1713598644935_0028
2024-04-20 01:23:41,848 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases B
2024-04-20 01:23:41,848 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: B[2,4] C:  R: 
2024-04-20 01:23:41,848 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - More information at: http://localhost:50030/jobdetails.jsp?jobid=job_1713598644935_0028
2024-04-20 01:23:53,591 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 37% complete
2024-04-20 01:24:01,584 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 50% complete
2024-04-20 01:24:06,870 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig script settings are added to the job
2024-04-20 01:24:06,874 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2024-04-20 01:24:06,874 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2024-04-20 01:24:06,874 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2024-04-20 01:24:07,091 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - creating jar file Job2922651399281433086.jar
2024-04-20 01:24:09,766 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - jar file Job2922651399281433086.jar created
2024-04-20 01:24:09,771 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2024-04-20 01:24:09,772 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2024-04-20 01:24:09,772 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cache
2024-04-20 01:24:09,772 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2024-04-20 01:24:09,799 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2024-04-20 01:24:09,799 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:24:09,800 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-20 01:24:09,807 [JobControl] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:24:09,937 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-20 01:24:09,938 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2024-04-20 01:24:09,938 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2024-04-20 01:24:09,959 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2024-04-20 01:24:10,001 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1713598644935_0029
2024-04-20 01:24:10,043 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1713598644935_0029
2024-04-20 01:24:10,045 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713598644935_0029/
2024-04-20 01:24:10,299 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1713598644935_0029
2024-04-20 01:24:10,299 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases B
2024-04-20 01:24:10,299 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: B[2,4] C:  R: 
2024-04-20 01:24:10,299 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - More information at: http://localhost:50030/jobdetails.jsp?jobid=job_1713598644935_0029
2024-04-20 01:24:21,956 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 62% complete
2024-04-20 01:24:29,584 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 75% complete
2024-04-20 01:24:35,363 [main] INFO  org.apache.pig.tools.pigstats.ScriptState - Pig script settings are added to the job
2024-04-20 01:24:35,366 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - mapred.job.reduce.markreset.buffer.percent is not set, set to default 0.3
2024-04-20 01:24:35,366 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Reduce phase detected, estimating # of required reducers.
2024-04-20 01:24:35,366 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting Parallelism to 1
2024-04-20 01:24:35,433 [DataStreamer for file /tmp/temp-725171896/tmp-1883608876/libthrift-0.9.3.jar] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-20 01:24:35,563 [DataStreamer for file /tmp/temp-725171896/tmp-2085474401/libfb303-0.9.3.jar] WARN  org.apache.hadoop.hdfs.DFSClient - Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
2024-04-20 01:24:35,610 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - creating jar file Job508560244552578263.jar
2024-04-20 01:24:38,347 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - jar file Job508560244552578263.jar created
2024-04-20 01:24:38,352 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.JobControlCompiler - Setting up single store job
2024-04-20 01:24:38,352 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Key [pig.schematuple] is false, will not generate code.
2024-04-20 01:24:38,352 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Starting process to move generated code to distributed cache
2024-04-20 01:24:38,352 [main] INFO  org.apache.pig.data.SchemaTupleFrontend - Setting key [pig.schematuple.classes] with classes to deserialize []
2024-04-20 01:24:38,360 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 1 map-reduce job(s) waiting for submission.
2024-04-20 01:24:38,360 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:24:38,361 [JobControl] INFO  org.apache.hadoop.yarn.client.RMProxy - Connecting to ResourceManager at /0.0.0.0:8032
2024-04-20 01:24:38,365 [JobControl] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:24:38,463 [JobControl] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-20 01:24:38,463 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
2024-04-20 01:24:38,463 [JobControl] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths (combined) to process : 1
2024-04-20 01:24:38,479 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - number of splits:1
2024-04-20 01:24:38,508 [JobControl] INFO  org.apache.hadoop.mapreduce.JobSubmitter - Submitting tokens for job: job_1713598644935_0030
2024-04-20 01:24:38,547 [JobControl] INFO  org.apache.hadoop.yarn.client.api.impl.YarnClientImpl - Submitted application application_1713598644935_0030
2024-04-20 01:24:38,549 [JobControl] INFO  org.apache.hadoop.mapreduce.Job - The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713598644935_0030/
2024-04-20 01:24:38,861 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - HadoopJobId: job_1713598644935_0030
2024-04-20 01:24:38,861 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Processing aliases B,D
2024-04-20 01:24:38,861 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - detailed locations: M: B[2,4] C:  R: D[5,4]
2024-04-20 01:24:38,861 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - More information at: http://localhost:50030/jobdetails.jsp?jobid=job_1713598644935_0030
2024-04-20 01:24:50,185 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 87% complete
2024-04-20 01:24:58,793 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - 100% complete
2024-04-20 01:24:58,807 [main] INFO  org.apache.pig.tools.pigstats.SimplePigStats - Script Statistics: 

HadoopVersion	PigVersion	UserId	StartedAt	FinishedAt	Features
2.6.0-cdh5.13.0	0.12.0-cdh5.13.0	cloudera	2024-04-20 01:23:18	2024-04-20 01:24:58	ORDER_BY,LIMIT

Success!

Job Stats (time in seconds):
JobId	Maps	Reduces	MaxMapTime	MinMapTIme	AvgMapTime	MedianMapTime	MaxReduceTime	MinReduceTime	AvgReduceTime	MedianReducetime	Alias	Feature	Outputs
job_1713598644935_0027	1	0	3	3	3	3	n/a	n/a	n/a	n/a	A	MAP_ONLY	
job_1713598644935_0028	1	1	3	3	3	3	4	4	4	4	B	SAMPLER	
job_1713598644935_0029	1	1	3	3	3	3	4	4	4	4	B	ORDER_BY,COMBINER	
job_1713598644935_0030	1	1	3	3	3	3	4	4	4	4	B,D		hdfs://quickstart.cloudera:8020/tmp/temp-725171896/tmp-1756004885,

Input(s):
Successfully read 9 records (419 bytes) from: "/user/cloudera/21241A6625/Task6/Weather.txt"

Output(s):
Successfully stored 1 records (13 bytes) in: "hdfs://quickstart.cloudera:8020/tmp/temp-725171896/tmp-1756004885"

Counters:
Total records written : 1
Total bytes written : 13
Spillable Memory Manager spill count : 0
Total bags proactively spilled: 0
Total records proactively spilled: 0

Job DAG:
job_1713598644935_0027	->	job_1713598644935_0028,
job_1713598644935_0028	->	job_1713598644935_0029,
job_1713598644935_0029	->	job_1713598644935_0030,
job_1713598644935_0030


2024-04-20 01:24:59,809 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:36446. Already tried 0 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-20 01:25:00,809 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:36446. Already tried 1 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-20 01:25:01,810 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:36446. Already tried 2 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-20 01:25:01,810 [main] WARN  org.apache.hadoop.ipc.Client - Failed to connect to server: quickstart.cloudera/127.0.0.1:36446: retries get failed due to exceeded maximum allowed retries number: 3
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
	at sun.reflect.GeneratedMethodAccessor6.invoke(Unknown Source)
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
2024-04-20 01:25:01,916 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2024-04-20 01:25:03,015 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:55788. Already tried 0 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-20 01:25:04,016 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:55788. Already tried 1 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-20 01:25:05,016 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:55788. Already tried 2 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-20 01:25:05,016 [main] WARN  org.apache.hadoop.ipc.Client - Failed to connect to server: quickstart.cloudera/127.0.0.1:55788: retries get failed due to exceeded maximum allowed retries number: 3
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
	at sun.reflect.GeneratedMethodAccessor6.invoke(Unknown Source)
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
2024-04-20 01:25:05,119 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2024-04-20 01:25:06,215 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:56181. Already tried 0 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-20 01:25:07,216 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:56181. Already tried 1 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-20 01:25:08,217 [main] INFO  org.apache.hadoop.ipc.Client - Retrying connect to server: quickstart.cloudera/127.0.0.1:56181. Already tried 2 time(s); retry policy is RetryUpToMaximumCountWithFixedSleep(maxRetries=3, sleepTime=1000 MILLISECONDS)
2024-04-20 01:25:08,217 [main] WARN  org.apache.hadoop.ipc.Client - Failed to connect to server: quickstart.cloudera/127.0.0.1:56181: retries get failed due to exceeded maximum allowed retries number: 3
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
	at sun.reflect.GeneratedMethodAccessor6.invoke(Unknown Source)
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
2024-04-20 01:25:08,319 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2024-04-20 01:25:08,503 [main] INFO  org.apache.hadoop.mapred.ClientServiceDelegate - Application state is completed. FinalApplicationStatus=SUCCEEDED. Redirecting to job history server
2024-04-20 01:25:08,649 [main] INFO  org.apache.pig.backend.hadoop.executionengine.mapReduceLayer.MapReduceLauncher - Success!
2024-04-20 01:25:08,653 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - fs.default.name is deprecated. Instead, use fs.defaultFS
2024-04-20 01:25:08,653 [main] INFO  org.apache.hadoop.conf.Configuration.deprecation - mapred.job.tracker is deprecated. Instead, use mapreduce.jobtracker.address
2024-04-20 01:25:08,653 [main] INFO  org.apache.pig.data.SchemaTupleBackend - Key [pig.schematuple] was not set... will not generate code.
2024-04-20 01:25:08,656 [main] INFO  org.apache.hadoop.mapreduce.lib.input.FileInputFormat - Total input paths to process : 1
2024-04-20 01:25:08,656 [main] INFO  org.apache.pig.backend.hadoop.executionengine.util.MapRedUtil - Total input paths to process : 1
(93)
grunt> store ordered_word_count into '/user/cloudera/21241A6625/Task6/OUTPUT1/';
[cloudera@quickstart ~]$ ^C
[cloudera@quickstart ~]$ hdfs dfs -cat /user/cloudera/21241A6625/Task6/OUTPUT1/part-r-00000
93
```
