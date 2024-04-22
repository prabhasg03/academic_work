# Task 2
Write a Map Reduce program that mines weather data
# Procedure
### Step-1
Open Cloudera on VMWare and click on eclipse app and create a new Project in the eclipse on clicking below hierarchy:
File -> New -> Java Project
### Step-2
- Give Project a name "weather"
- Click on Libraries
- Click on Add External JARS
- select all JAR files below bin in "usr->lib->hadoop" folder
- Again, Select all JAR files in client of "use->lib->hadoop->client"
### Step-3
- Create Weatherforecasting class in below way:
- Open File->New->class in src folder
- Enter source and className as Weather
- Enter the source code as in the file: [weather.java](https://github.com/prabhasg03/Task-Codes/edit/Big-Data-Analytics-Lab/Task%202/weather.java)
### Step-4 
- Open File->Export->JAVA->JAR File and click on next
- Browse the JAR file,click on finish
- To browse the file, save with [weather.jar](https://github.com/prabhasg03/Task-Codes/edit/Big-Data-Analytics-Lab/Task%202/weather.jar)
- Enter commands in command prompt as in Output Section as per file paths
# Output
![Uploading image.png…]()

```
[cloudera@quickstart ~]$ hdfs dfs -put /home/cloudera/weather.txt /user/cloudera/21241A6625/Task2/
[cloudera@quickstart ~]$ hdfs dfs -put /home/cloudera/weather.jar /user/cloudera/21241A6625/Task2/
[cloudera@quickstart ~]$ hadoop jar /home/cloudera/weather.jar weather /user/cloudera/21241A6625/Task2/weather.txt /user/cloudera/21241A6625/Task2/OUTPUT
24/04/22 00:33:28 INFO client.RMProxy: Connecting to ResourceManager at /0.0.0.0:8032
24/04/22 00:33:29 WARN mapreduce.JobResourceUploader: Hadoop command-line option parsing not performed. Implement the Tool interface and execute your application with ToolRunner to remedy this.
24/04/22 00:33:29 INFO input.FileInputFormat: Total input paths to process : 1
24/04/22 00:33:29 INFO mapreduce.JobSubmitter: number of splits:1
24/04/22 00:33:29 INFO mapreduce.JobSubmitter: Submitting tokens for job: job_1713598644935_0032
24/04/22 00:33:29 INFO impl.YarnClientImpl: Submitted application application_1713598644935_0032
24/04/22 00:33:29 INFO mapreduce.Job: The url to track the job: http://quickstart.cloudera:8088/proxy/application_1713598644935_0032/
24/04/22 00:33:29 INFO mapreduce.Job: Running job: job_1713598644935_0032
24/04/22 00:33:37 INFO mapreduce.Job: Job job_1713598644935_0032 running in uber mode : false
24/04/22 00:33:37 INFO mapreduce.Job:  map 0% reduce 0%
24/04/22 00:33:42 INFO mapreduce.Job:  map 100% reduce 0%
24/04/22 00:33:48 INFO mapreduce.Job:  map 100% reduce 100%
24/04/22 00:33:48 INFO mapreduce.Job: Job job_1713598644935_0032 completed successfully
24/04/22 00:33:48 INFO mapreduce.Job: Counters: 49
	File System Counters
		FILE: Number of bytes read=9225
		FILE: Number of bytes written=305761
		FILE: Number of read operations=0
		FILE: Number of large read operations=0
		FILE: Number of write operations=0
		HDFS: Number of bytes read=79346
		HDFS: Number of bytes written=8489
		HDFS: Number of read operations=6
		HDFS: Number of large read operations=0
		HDFS: Number of write operations=2
	Job Counters 
		Launched map tasks=1
		Launched reduce tasks=1
		Data-local map tasks=1
		Total time spent by all maps in occupied slots (ms)=3344
		Total time spent by all reduces in occupied slots (ms)=3619
		Total time spent by all map tasks (ms)=3344
		Total time spent by all reduce tasks (ms)=3619
		Total vcore-milliseconds taken by all map tasks=3344
		Total vcore-milliseconds taken by all reduce tasks=3619
		Total megabyte-milliseconds taken by all map tasks=3424256
		Total megabyte-milliseconds taken by all reduce tasks=3705856
	Map-Reduce Framework
		Map input records=365
		Map output records=365
		Map output bytes=8489
		Map output materialized bytes=9225
		Input split bytes=139
		Combine input records=0
		Combine output records=0
		Reduce input groups=365
		Reduce shuffle bytes=9225
		Reduce input records=365
		Reduce output records=365
		Spilled Records=730
		Shuffled Maps =1
		Failed Shuffles=0
		Merged Map outputs=1
		GC time elapsed (ms)=94
		CPU time spent (ms)=900
		Physical memory (bytes) snapshot=364556288
		Virtual memory (bytes) snapshot=3015147520
		Total committed heap usage (bytes)=226627584
	Shuffle Errors
		BAD_ID=0
		CONNECTION=0
		IO_ERROR=0
		WRONG_LENGTH=0
		WRONG_MAP=0
		WRONG_REDUCE=0
	File Input Format Counters 
		Bytes Read=79207
	File Output Format Counters 
		Bytes Written=8489
[cloudera@quickstart ~]$ hadoop fs -ls /user/cloudera/21241A6625/Task2/
Found 3 items
drwxr-xr-x   - cloudera cloudera          0 2024-04-22 00:33 /user/cloudera/21241A6625/Task2/OUTPUT
-rw-r--r--   1 cloudera cloudera       3358 2024-04-22 00:33 /user/cloudera/21241A6625/Task2/weather.jar
-rw-r--r--   1 cloudera cloudera      79207 2024-04-22 00:33 /user/cloudera/21241A6625/Task2/weather.txt
[cloudera@quickstart ~]$ hadoop fs -ls /user/cloudera/21241A6625/Task2/OUTPUT
Found 2 items
-rw-r--r--   1 cloudera cloudera          0 2024-04-22 00:33 /user/cloudera/21241A6625/Task2/OUTPUT/_SUCCESS
-rw-r--r--   1 cloudera cloudera       8489 2024-04-22 00:33 /user/cloudera/21241A6625/Task2/OUTPUT/part-r-00000
[cloudera@quickstart ~]$ hadoop fs -cat /user/cloudera/21241A6625/Task2/OUTPUT/part-r-00000
Cold Day 20150101	-21.8
Cold Day 20150102	-24.9
Cold Day 20150103	-28.2
Cold Day 20150104	-28.9
Cold Day 20150105	-29.3
Cold Day 20150106	-26.3
Cold Day 20150107	-28.7
Cold Day 20150108	-24.1
Cold Day 20150109	-20.3
Cold Day 20150110	-25.8
Cold Day 20150111	-28.2
Cold Day 20150112	-29.1
Cold Day 20150113	-29.9
Cold Day 20150114	-29.0
Cold Day 20150115	-24.2
Cold Day 20150116	-24.6
Cold Day 20150117	-23.2
Cold Day 20150118	-23.0
Cold Day 20150119	-30.4
Cold Day 20150120	-24.7
Cold Day 20150121	-24.1
Cold Day 20150122	-27.5
Cold Day 20150123	-29.3
Cold Day 20150124	-30.3
Cold Day 20150125	-30.0
Cold Day 20150126	-30.7
Cold Day 20150127	-26.9
Cold Day 20150128	-36.2
Cold Day 20150129	-35.0
Cold Day 20150130	-24.2
Cold Day 20150131	-26.5
Cold Day 20150201	-22.1
Cold Day 20150202	-19.0
Cold Day 20150203	-31.1
Cold Day 20150204	-38.2
Cold Day 20150205	-37.0
Cold Day 20150206	-29.7
Cold Day 20150207	-27.9
Cold Day 20150208	-35.4
Cold Day 20150209	-36.8
Cold Day 20150210	-34.5
Cold Day 20150211	-34.1
Cold Day 20150212	-32.5
Cold Day 20150213	-34.0
Cold Day 20150214	-34.6
Cold Day 20150215	-32.8
Cold Day 20150216	-25.7
Cold Day 20150217	-22.1
Cold Day 20150218	-18.5
Cold Day 20150219	-19.2
Cold Day 20150220	-23.2
Cold Day 20150221	-19.3
Cold Day 20150222	-19.0
Cold Day 20150223	-20.0
Cold Day 20150224	-18.1
Cold Day 20150225	-15.6
Cold Day 20150226	-6.5
Cold Day 20150227	-16.3
Cold Day 20150228	-26.5
Cold Day 20150301	-28.5
Cold Day 20150302	-23.6
Cold Day 20150303	-16.4
Cold Day 20150304	-25.4
Cold Day 20150305	-26.9
Cold Day 20150306	-27.6
Cold Day 20150307	-25.0
Cold Day 20150308	-29.6
Cold Day 20150309	-31.5
Cold Day 20150310	-36.5
Cold Day 20150311	-38.6
Cold Day 20150312	-39.3
Cold Day 20150313	-39.3
Cold Day 20150314	-38.0
Cold Day 20150315	-32.7
Cold Day 20150316	-33.1
Cold Day 20150317	-23.7
Cold Day 20150318	-23.9
Cold Day 20150319	-24.2
Cold Day 20150320	-24.3
Cold Day 20150321	-20.2
Cold Day 20150322	-23.0
Cold Day 20150323	-27.0
Cold Day 20150324	-33.0
Cold Day 20150325	-27.4
Cold Day 20150326	-26.5
Cold Day 20150327	-25.0
Cold Day 20150328	-26.3
Cold Day 20150329	-25.0
Cold Day 20150330	-23.3
Cold Day 20150331	-19.3
Cold Day 20150401	-23.7
Cold Day 20150402	-26.1
Cold Day 20150403	-21.6
Cold Day 20150404	-23.7
Cold Day 20150405	-24.2
Cold Day 20150406	-20.1
Cold Day 20150407	-18.4
Cold Day 20150408	-16.4
Cold Day 20150409	-17.6
Cold Day 20150410	-20.0
Cold Day 20150411	-22.1
Cold Day 20150412	-23.1
Cold Day 20150413	-27.7
Cold Day 20150414	-26.1
Cold Day 20150415	-27.4
Cold Day 20150416	-24.2
Cold Day 20150417	-28.1
Cold Day 20150418	-25.0
Cold Day 20150419	-15.6
Cold Day 20150420	-11.8
Cold Day 20150421	-13.8
Cold Day 20150422	-8.4
Cold Day 20150423	-8.8
Cold Day 20150424	-12.4
Cold Day 20150425	-9.0
Cold Day 20150426	-8.6
Cold Day 20150427	-9.4
Cold Day 20150428	-9.5
Cold Day 20150429	-9.4
Cold Day 20150430	-13.7
Cold Day 20150501	-16.1
Cold Day 20150502	-8.6
Cold Day 20150503	-9.6
Cold Day 20150504	-8.6
Cold Day 20150505	-13.0
Cold Day 20150506	-12.3
Cold Day 20150507	-10.8
Cold Day 20150508	-9.6
Cold Day 20150509	-4.7
Cold Day 20150510	-6.1
Cold Day 20150511	-2.1
Cold Day 20150512	-3.8
Cold Day 20150513	-4.6
Cold Day 20150514	-6.7
Cold Day 20150515	-5.1
Cold Day 20150516	-2.9
Cold Day 20150517	-0.3
Cold Day 20150518	0.7
Cold Day 20150519	-1.4
Cold Day 20150520	-2.6
Cold Day 20150521	0.0
Cold Day 20150522	0.2
Cold Day 20150523	-0.4
Cold Day 20150524	-0.5
Cold Day 20150525	-0.3
Cold Day 20150526	-1.8
Cold Day 20150527	-2.4
Cold Day 20150528	-2.1
Cold Day 20150529	0.2
Cold Day 20150530	-2.3
Cold Day 20150531	-3.8
Cold Day 20150601	-4.0
Cold Day 20150602	-2.4
Cold Day 20150603	-3.2
Cold Day 20150604	-3.7
Cold Day 20150605	-3.3
Cold Day 20150606	-1.0
Cold Day 20150607	-1.7
Cold Day 20150608	1.0
Cold Day 20150609	0.6
Cold Day 20150610	-1.5
Cold Day 20150611	-2.9
Cold Day 20150612	-2.4
Cold Day 20150613	3.3
Cold Day 20150614	3.3
Cold Day 20150615	0.8
Cold Day 20150616	1.4
Cold Day 20150617	1.0
Cold Day 20150618	0.6
Cold Day 20150619	0.6
Cold Day 20150620	7.7
Cold Day 20150621	7.1
Cold Day 20150622	0.1
Cold Day 20150623	1.3
Cold Day 20150624	1.3
Cold Day 20150625	1.6
Cold Day 20150626	2.6
Cold Day 20150627	1.4
Cold Day 20150628	1.9
Cold Day 20150629	6.5
Cold Day 20150630	6.7
Cold Day 20150701	4.7
Cold Day 20150702	3.7
Cold Day 20150703	1.3
Cold Day 20150704	3.9
Cold Day 20150705	8.5
Cold Day 20150706	8.1
Cold Day 20150707	0.8
Cold Day 20150708	0.3
Cold Day 20150709	0.2
Cold Day 20150710	0.4
Cold Day 20150711	0.4
Cold Day 20150712	0.6
Cold Day 20150713	0.9
Cold Day 20150714	2.6
Cold Day 20150715	1.1
Cold Day 20150716	2.2
Cold Day 20150717	1.4
Cold Day 20150718	1.4
Cold Day 20150719	2.0
Cold Day 20150721	3.8
Cold Day 20150722	0.5
Cold Day 20150723	0.0
Cold Day 20150724	-0.1
Cold Day 20150725	1.0
Cold Day 20150726	0.9
Cold Day 20150727	0.9
Cold Day 20150728	-0.2
Cold Day 20150729	0.3
Cold Day 20150730	-0.7
Cold Day 20150731	3.8
Cold Day 20150801	0.8
Cold Day 20150802	0.3
Cold Day 20150803	3.5
Cold Day 20150804	2.3
Cold Day 20150805	1.9
Cold Day 20150806	0.7
Cold Day 20150807	4.2
Cold Day 20150808	3.6
Cold Day 20150809	4.2
Cold Day 20150810	1.9
Cold Day 20150811	0.2
Cold Day 20150812	0.4
Cold Day 20150813	3.1
Cold Day 20150814	4.3
Cold Day 20150815	1.2
Cold Day 20150816	0.6
Cold Day 20150817	0.5
Cold Day 20150818	0.4
Cold Day 20150819	-2.3
Cold Day 20150820	-3.2
Cold Day 20150821	0.8
Cold Day 20150822	1.4
Cold Day 20150823	0.6
Cold Day 20150824	0.6
Cold Day 20150825	1.3
Cold Day 20150826	2.4
Cold Day 20150827	1.9
Cold Day 20150828	0.5
Cold Day 20150829	0.0
Cold Day 20150830	-0.2
Cold Day 20150831	-0.1
Cold Day 20150901	1.4
Cold Day 20150902	2.6
Cold Day 20150903	1.3
Cold Day 20150904	0.0
Cold Day 20150905	-0.3
Cold Day 20150906	2.7
Cold Day 20150907	0.5
Cold Day 20150908	-0.2
Cold Day 20150909	-1.4
Cold Day 20150910	-1.5
Cold Day 20150911	-1.2
Cold Day 20150912	-2.0
Cold Day 20150913	-2.4
Cold Day 20150914	0.1
Cold Day 20150915	-1.1
Cold Day 20150916	-2.0
Cold Day 20150917	-3.0
Cold Day 20150918	-3.2
Cold Day 20150919	-3.4
Cold Day 20150920	-3.6
Cold Day 20150921	-4.9
Cold Day 20150922	-5.6
Cold Day 20150923	-6.1
Cold Day 20150924	-5.1
Cold Day 20150925	-1.5
Cold Day 20150926	-2.1
Cold Day 20150927	-3.9
Cold Day 20150928	-5.6
Cold Day 20150929	-3.0
Cold Day 20150930	-4.4
Cold Day 20151001	-6.9
Cold Day 20151002	-8.1
Cold Day 20151003	-3.8
Cold Day 20151004	-4.6
Cold Day 20151005	-2.9
Cold Day 20151006	-4.1
Cold Day 20151007	-4.6
Cold Day 20151008	-4.7
Cold Day 20151009	-4.6
Cold Day 20151010	-4.6
Cold Day 20151011	-3.7
Cold Day 20151012	-5.0
Cold Day 20151013	-9.4
Cold Day 20151014	-6.7
Cold Day 20151015	-9.6
Cold Day 20151016	-14.2
Cold Day 20151017	-4.9
Cold Day 20151018	-5.5
Cold Day 20151019	-6.9
Cold Day 20151020	-9.1
Cold Day 20151021	-9.5
Cold Day 20151022	-8.3
Cold Day 20151023	-6.4
Cold Day 20151024	-4.4
Cold Day 20151025	-14.5
Cold Day 20151026	-9.2
Cold Day 20151027	-9.7
Cold Day 20151028	-17.0
Cold Day 20151029	-18.3
Cold Day 20151030	-15.5
Cold Day 20151031	-15.3
Cold Day 20151101	-16.5
Cold Day 20151102	-10.0
Cold Day 20151103	-8.5
Cold Day 20151104	-7.4
Cold Day 20151105	-8.7
Cold Day 20151106	-10.3
Cold Day 20151107	-12.1
Cold Day 20151108	-14.1
Cold Day 20151109	-7.6
Cold Day 20151110	-9.6
Cold Day 20151111	-13.9
Cold Day 20151112	-22.3
Cold Day 20151113	-24.7
Cold Day 20151114	-25.1
Cold Day 20151115	-26.7
Cold Day 20151116	-28.4
Cold Day 20151117	-23.6
Cold Day 20151118	-29.8
Cold Day 20151119	-30.8
Cold Day 20151120	-21.7
Cold Day 20151121	-23.2
Cold Day 20151122	-28.3
Cold Day 20151123	-26.8
Cold Day 20151124	-16.9
Cold Day 20151125	-14.9
Cold Day 20151126	-19.8
Cold Day 20151127	-24.1
Cold Day 20151128	-17.9
Cold Day 20151129	-18.8
Cold Day 20151130	-25.7
Cold Day 20151201	-25.5
Cold Day 20151202	-25.6
Cold Day 20151203	-27.4
Cold Day 20151204	-27.4
Cold Day 20151205	-28.2
Cold Day 20151206	-28.9
Cold Day 20151207	-28.4
Cold Day 20151208	-28.3
Cold Day 20151209	-28.3
Cold Day 20151210	-27.2
Cold Day 20151211	-29.2
Cold Day 20151212	-26.0
Cold Day 20151213	-22.3
Cold Day 20151214	-23.2
Cold Day 20151215	-20.8
Cold Day 20151216	-19.4
Cold Day 20151217	-22.9
Cold Day 20151218	-25.7
Cold Day 20151219	-22.3
Cold Day 20151220	-22.5
Cold Day 20151221	-27.5
Cold Day 20151222	-30.0
Cold Day 20151223	-30.3
Cold Day 20151224	-30.8
Cold Day 20151225	-37.5
Cold Day 20151226	-29.6
Cold Day 20151227	-26.0
Cold Day 20151228	-27.1
Cold Day 20151229	-33.0
Cold Day 20151230	-25.7
Cold Day 20151231	-22.7
Hot Day 20150720	9999.0
```
