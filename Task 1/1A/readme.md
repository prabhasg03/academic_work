# Task 1A
Understanding and using basic HDFS
# Theory
Apache Hadoop hadoop fs or hdfs dfs are file system commands to interact with HDFS, these
commands are very similar to Unix Commands. Note that some Syntax and output formats
may differ between Unix and HDFS Commands.
Hadoop is a open-source distributed framework that is used to store and process a large set of
datasets. To store data, Hadoop uses HDFS, and to process data, it uses MapReduce & Yarn. In
this article, I will mainly focus on Hadoop HDFS commands to interact with the files.
Hadoop provides two types of commands to interact with File System; hadoop fs or hdfs dfs.
Major difference being hadoop commands are supported with multiple file systems like S3,
Azure and many more.
Start Hadoop Services
In order to run hdfs dfs or hadoop fs commands, first, you need to start the Hadoop services by
running the start-dfs.sh script from the Hadoop installation.
ubuntu@namenode:~$ start-dfs.sh
Starting namenodes on [namenode.socal.rr.com]
Starting datanodes
Starting secondary namenodes [namenode]
ubuntu@namenode:~$
```
ls – List Files and Folder
HDFS ls command is used to display the list of Files and Directories in HDFS,
This ls command shows the files with permissions, user, group, and other
details. For more information follow ls- List Files and Folder
Command: $hadoop fs -ls or $hdfs dfs -ls
```
```
mkdir – Make Directory
HDFS mkdir command is used to create a directory in HDFS. By default, this
directory would be owned by the user who is creating it. By specifying “/” at
the beginning it creates a folder at root directory.
$hadoop fs -mkdir /directory-name or $hdfs dfs -mkdir /directory-name
```
```
rm – Remove File or Directory
HDFS rm command deletes a file and a directory from HDFS recursively.
Command: $hadoop fs -rm /file-name
or
$hdfs dfs -rm /file-name
```
```
rmr – Remove Directory Recursively
Rmr command is used to deletes a file from Directory recursively, it is a very
useful command when you want to delete a non-empty directory.
Command:$hadoop fs -rmr /directory-name
or
$hdfs dfs -rmr /directory-name
```
```
rmdir – Delete a Directory
Rmdir command is used to removing directories only if they are empty.
Command:$hadoop fs -rmdir /directory-name
or
$hdfs dfs -rmdir /directory-name
```
```
put – Upload a File to HDFS from Local
Copy file/folder from local disk to HDFS. On put command specifies the local-
file-path where you wanted to copy from and then hdfs-file-path where you
wanted to copy to on hdfs.
Command
$ hadoop fs -put /local-file-path /hdfs-file-path
or
$ hdfs dfs -put /local-file-path /hdfs-file-path
```
```
cat – Displays the Content of the File
The cat command reads the specified file from HDFS and displays the content
of the file on console or stdout.
Command:
$ hadoop fs -cat /hdfs-file-path
or
$ hdfs dfs -cat /hdfs-file-path
```
# Commands and their Output
```
[cloudera@quickstart ~]$ hdfs dfs -ls
Found 42 items
drwxr-xr-x   - cloudera cloudera          0 2023-04-06 02:05 .Trash
drwxr-xr-x   - cloudera cloudera          0 2024-03-27 02:17 6670
drwxr-xr-x   - cloudera cloudera          0 2023-02-09 00:03 6701
drwxr-xr-x   - cloudera cloudera          0 2023-02-09 00:05 6707
drwxr-xr-x   - cloudera cloudera          0 2023-04-13 01:53 6723
drwxr-xr-x   - cloudera cloudera          0 2023-04-13 01:13 6758
drwxr-xr-x   - cloudera cloudera          0 2023-02-13 00:23 AIML
drwxr-xr-x   - cloudera cloudera          0 2024-02-19 20:50 Aditya
drwxr-xr-x   - cloudera cloudera          0 2024-04-15 01:50 Data1
drwxr-xr-x   - cloudera cloudera          0 2023-04-06 00:45 Desktop
-rw-r--r--   1 cloudera cloudera   14966021 2024-02-12 00:36 Hotel_Reviews.csv
drwxr-xr-x   - cloudera cloudera          0 2023-03-06 00:55 JD
-rwxr-xr-x   1 cloudera cloudera        444 2023-06-05 01:17 Mapper.py
drwxr-xr-x   - cloudera cloudera          0 2023-02-16 00:59 Mat
-rwxr-xr-x   1 cloudera cloudera        518 2023-06-05 01:18 Reducer.py
drwxr-xr-x   - cloudera cloudera          0 2024-02-21 23:30 Sneha
drwxr-xr-x   - cloudera cloudera          0 2023-04-06 01:33 TASK4
drwxr-xr-x   - cloudera cloudera          0 2024-04-15 00:40 Task4
drwxr-xr-x   - cloudera cloudera          0 2023-02-09 00:13 abcd
drwxr-xr-x   - cloudera cloudera          0 2024-04-02 22:00 aimlb
drwxr-xr-x   - cloudera cloudera          0 2024-02-13 21:54 bdal96
-rw-r--r--   1 cloudera cloudera          0 2024-02-13 21:39 file1.txt
drwxr-xr-x   - cloudera cloudera          0 2024-02-13 21:54 lavanya
drwxr-xr-x   - cloudera cloudera          0 2024-02-13 22:07 mamatha
drwxr-xr-x   - cloudera cloudera          0 2023-06-05 02:18 mat
drwxr-xr-x   - cloudera cloudera          0 2023-04-06 00:46 mat1
drwxr-xr-x   - cloudera cloudera          0 2023-06-08 01:08 mat14
drwxr-xr-x   - cloudera cloudera          0 2023-04-06 00:56 mat2
drwxr-xr-x   - cloudera cloudera          0 2023-02-24 20:45 oozie-oozi
drwxr-xr-x   - cloudera cloudera          0 2023-02-16 01:08 output
-rw-r--r--   1 cloudera cloudera   12840144 2023-03-05 23:47 pig
drwxr-xr-x   - cloudera cloudera          0 2024-02-13 22:07 ravalika
drwxr-xr-x   - cloudera cloudera          0 2023-02-26 23:44 sales34
drwxr-xr-x   - cloudera cloudera          0 2023-03-06 00:28 sample
drwxr-xr-x   - cloudera cloudera          0 2024-04-02 00:48 sdir
drwxr-xr-x   - cloudera cloudera          0 2024-02-27 20:06 something
-rw-r--r--   1 cloudera cloudera          0 2023-04-06 01:23 source.txt
-rw-r--r--   1 cloudera cloudera          0 2024-04-15 01:28 t1.txt
drwxr-xr-x   - cloudera cloudera          0 2023-02-09 00:30 task1b
drwxr-xr-x   - cloudera cloudera          0 2023-04-06 02:07 task7
drwxr-xr-x   - cloudera cloudera          0 2023-07-10 21:53 task_7
drwxr-xr-x   - cloudera cloudera          0 2023-07-10 22:39 wordcount
[cloudera@quickstart ~]$ hdfs dfs -mkdir /AIMLA
[cloudera@quickstart ~]$ hdfs dfs -rm AIMLA
rm: `AIMLA': No such file or directory
[cloudera@quickstart ~]$ hdfs dfs -rm /AIMLA
rm: `/AIMLA': Is a directory
[cloudera@quickstart ~]$ hdfs dfs -rm -r /AIMLA
Deleted /AIMLA
[cloudera@quickstart ~]$ hdfs dfs -mkdir /AIMLA
[cloudera@quickstart ~]$ hdfs dfs -mkdir /AIMLA
mkdir: `/AIMLA': File exists
[cloudera@quickstart ~]$ hdfs dfs -rmdir /AIMLA
[cloudera@quickstart ~]$ hdfs dfs -put /home/cloudera/Desktop/21241A6625 /home/cloudera
[cloudera@quickstart ~]$ cat hello.txt
AIML
Welcome to AIML
AIML is a good branch
```
