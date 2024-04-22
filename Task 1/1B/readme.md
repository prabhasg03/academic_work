# Task 1
b) Run a basic word count Map Reduce program to understand Map Reduce Paradigm
# Procedure
- Open Eclipse in cloudera and Create new java Project as per below step:
- Click "File -> New -> Java Project" and name the project
- Click "Project Name -> wordcount -> next"
- Open "libraries -> Add External JARS",then Go to file system and select "usr -> lib -> hadoop" and select all JAR files
- Again,Open "libraries -> Add External JARS",then Go to file system and select "usr -> lib -> hadoop -> client" and select all JAR files
- Then Proceed next and click on finish
- Open "File -> New -> Class" and select Source Folder: wordcount/src and click on finish
- Enter the source code as per this java file: [1b.java](https://github.com/prabhasg03/Task-Codes/blob/Big-Data-Analytics-Lab/Task%201/1B/1b.java)
- Open File->Export->JAVA->JAR File and click on next
- Browse the JAR file,click on finish
- To browse the file, save with [wordcount.jar]()
- Enter commands in command prompt as in Output Section as per file paths
# Commands and Outputs

![image](https://github.com/prabhasg03/Task-Codes/assets/121883587/58dd1149-af5d-4c58-b27b-39564421e6b0)

```
[cloudera@quickstart ~]$ cat wordcount.txt
Cloudera
Linux
Linux
Job
Job
Job
Siva
Siva
[cloudera@quickstart ~]$ hadoop fs -put /home/cloudera/wordcount.txt /user/cloudera/21241A6625/Task1/1B/
[cloudera@quickstart ~]$ hadoop fs -put /home/cloudera/wordcount.jar /user/cloudera/21241A6625/Task1/1B/
[cloudera@quickstart ~]$ hadoop fs -cat /user/cloudera/21241A6625/Task1/1B/wordcount.txt
Cloudera
Linux
Linux
Job
Job
Job
Siva
Siva
[cloudera@quickstart ~]$ hadoop jar /home/cloudera/wordcount.jar WordCount1 /user/cloudera/21241A6625/Task1/1B/wordcount.txt /user/cloudera/21241A6625/Task1/1B/OUTPUT
24/04/22 01:33:40 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
24/04/22 01:33:41 WARN mapreduce.JobResourceUploader: Hadoop command-line option parsing not performed. Implement the Tool interface and execute your application with ToolRunner to remedy this.
24/04/22 01:33:41 INFO input.FileInputFormat: Total input paths to process : 1
24/04/22 01:33:41 WARN hdfs.DFSClient: Caught exception 
java.lang.InterruptedException
	at java.lang.Object.wait(Native Method)
	at java.lang.Thread.join(Thread.java:1281)
	at java.lang.Thread.join(Thread.java:1355)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.closeResponder(DFSOutputStream.java:967)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.endBlock(DFSOutputStream.java:705)
	at org.apache.hadoop.hdfs.DFSOutputStream$DataStreamer.run(DFSOutputStream.java:894)
24/04/22 01:33:41 INFO mapreduce.JobSubmitter: number of splits:1
24/04/22 01:33:41 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1713598644935_0033
24/04/22 01:33:42 INFO impl.YarnClientImpl: Submitted application application_1713598644935_0033
24/04/22 01:33:42 INFO mapreduce.Job: The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713598644935_0033/
24/04/22 01:33:42 INFO mapreduce.Job: Running job: job_1713598644935_0033
24/04/22 01:33:52 INFO mapreduce.Job: Job job_1713598644935_0033 running in uber mode : false
24/04/22 01:33:52 INFO mapreduce.Job:  map 0% reduce 0%
24/04/22 01:34:01 INFO mapreduce.Job:  map 100% reduce 0%
24/04/22 01:34:08 INFO mapreduce.Job:  map 100% reduce 100%
24/04/22 01:34:08 INFO mapreduce.Job: Job job_1713598644935_0033 completed successfully
24/04/22 01:34:08 INFO mapreduce.Job: Counters: 49
	File System Counters
		FILE: Number of bytes read=54
		FILE: Number of bytes written=286925
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=187
		HDFS: Number of bytes written=32
		HDFS: Number of read operations=6
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Launched reduce tasks=1
		Data-local map tasks=1
		Total time spent by all maps in occupied slots (ms)=7389
		Total time spent by all reduces in occupied slots (ms)=3953
		Total time spent by all map tasks (ms)=7389
		Total time spent by all reduce tasks (ms)=3953
		Total vcore-milliseconds taken by all map tasks=7389
		Total vcore-milliseconds taken by all reduce tasks=3953
		Total megabyte-milliseconds taken by all map tasks=7566336
		Total megabyte-milliseconds taken by all reduce tasks=4047872
	Map-Reduce Framework
		Map input records=8
		Map output records=8
		Map output bytes=75
		Map output materialized bytes=54
		Input split bytes=144
		Combine input records=8
		Combine output records=4
		Reduce input groups=4
		Reduce shuffle bytes=54
		Reduce input records=4
		Reduce output records=4
		Spilled Records=8
		Shuffled Maps =1
		Failed Shuffles=0
		Merged Map outputs=1
		GC time elapsed (ms)=109
		CPU time spent (ms)=980
		Physical memory (bytes) snapshot=337924096
		Virtual memory (bytes) snapshot=3015176192
		Total committed heap usage (bytes)=226627584
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=43
	File Output Format Counters 
		Bytes Written=32
[cloudera@quickstart ~]$ hadoop fs -ls /user/cloudera/21241A6625/Task1/1B/OUTPUT/
Found 2 items
-rw-r--r--   1 cloudera cloudera          0 2024-04-22 01:34 /user/cloudera/21241A6625/Task1/1B/OUTPUT/_SUCCESS
-rw-r--r--   1 cloudera cloudera         32 2024-04-22 01:34 /user/cloudera/21241A6625/Task1/1B/OUTPUT/part-r-00000
[cloudera@quickstart ~]$ hadoop fs -cat /user/cloudera/21241A6625/Task1/1B/OUTPUT/part-r-00000
Cloudera	1
Job	3
Linux	2
Siva	2
```
