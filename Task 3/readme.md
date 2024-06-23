# Task 3
Implement Matrix Multiplication with Hadoop Map Reduce
# Procedure
- Open Cloudera in VM Workstation and open eclipse
- In Eclipse, create a java project "MatrixMul"
- In that project, Create 3 java files in src folder:
  - [Mapper.java](https://github.com/prabhasg03/academic_work/blob/Big-Data-Analytics-Lab/Task%203/mapper.java)
  - [Reducer.java](https://github.com/prabhasg03/academic_work/blob/Big-Data-Analytics-Lab/Task%203/reducer.java)
  - [MatrixMultiply.java](https://github.com/prabhasg03/academic_work/blob/Big-Data-Analytics-Lab/Task%203/MatrixMultiply.java)
- Create a jar file for the MatrixMul project
- Enter below commands in command prompt:
  ``
-  hdfs dfs -mkdir matrix
-  hdfs dfs -put /home/cloudera/inp.txt /user/cloudera/matrix
-  hdfs jar /home/cloudera/MatrixMulitply.jar MatrixMultiply Matrix/inp.txt /res
-  hdfs dfs -ls /res/
-  hdfs dfs -cat /res/PART-r-00000
  ``
