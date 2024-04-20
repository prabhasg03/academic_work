# Task 4 
Working with files in Hadoop file system: Reading, Writing and Copying
# Reading and Writing the file content from local file system to Hadoop file system using appendToFile and cat command:
## Procedure
Create a directory called TASK4 in HDFS<br>
```
[cloudera@quickstart ~]$ hadoop fs -mkdir TASK4
```
Create empty text file called source.txt in local file system and put this file in HDFS
directory called TASK4
```
[cloudera@quickstart ~]$ hadoop fs -put /home/cloudera/Desktop/source.txt /user/cloudera/21241A6625/Task4/
```
Create text file called Dest.txt in local file system along with the some text.
```
[cloudera@quickstart ~]$ hadoop fs -appendToFile /home/cloudera/Desktop/Dest.txt /user/cloudera/21241A6625/Task4/source.txt
```
## Output
![image](https://github.com/prabhasg03/Task-Codes/assets/121883587/5a976dc5-51a6-4938-b515-f7db1cc36e77)

```
[cloudera@quickstart ~]$ cat /home/cloudera/Desktop/source.txt
Hello My name is Prabhas
[cloudera@quickstart ~]$ cat /home/cloudera/Desktop/dest.txt
I am a student
[cloudera@quickstart ~]$ hadoop fs -put /home/cloudera/Desktop/source.txt /user/cloudera/21241A6625/Task4
[cloudera@quickstart ~]$ hadoop fs -appendToFile /home/cloudera/Desktop/dest.txt /user/cloudera/21241A6625/Task4/source.txt
[cloudera@quickstart ~]$ hadoop fs -cat  /user/cloudera/21241A6625/Task4/source.txt
Hello My name is Prabhas
I am a student
```
# Copy files in different folders in Hadoop
## Procedure
Step1: Create one directory in local system is called DATA, it consist of set files
Step 2: Create directory in HDFS called Data1.
Now, copy the local directory files to HDFS files directory.
```
[cloudera@quickstart ~]$ hadoop fs -put /home/cloudera/Desktop/DATA/ /user/cloudera/Data1/
```
## Output:
![image](https://github.com/prabhasg03/Task-Codes/assets/121883587/2319a325-1c95-400b-9fad-b6ffd6eac2b2)

```
[cloudera@quickstart ~]$ ls /home/cloudera/Desktop/DATA
dest.txt  source.txt
[cloudera@quickstart ~]$ cat /home/cloudera/Desktop/DATA/source.txt
Hello My name is Prabhas
[cloudera@quickstart ~]$ cat /home/cloudera/Desktop/DATA/dest.txt
I am a student
[cloudera@quickstart ~]$  hadoop fs -put /home/cloudera/Desktop/DATA/ /user/cloudera/21241A6625/Task4/
[cloudera@quickstart ~]$ hadoop fs -ls /user/cloudera/21241A6625/Task4/DATA
1Found 2 items
-rw-r--r--   1 cloudera cloudera         15 2024-04-20 02:07 /user/cloudera/21241A6625/Task4/DATA/dest.txt
-rw-r--r--   1 cloudera cloudera         25 2024-04-20 02:07 /user/cloudera/21241A6625/Task4/DATA/source.txt
[cloudera@quickstart ~]$ hadoop fs -cat /user/cloudera/21241A6625/Task4/DATA/dest.txt
I am a student
[cloudera@quickstart ~]$ hadoop fs -cat /user/cloudera/21241A6625/Task4/DATA/source.txt
Hello My name is Prabhas

```
