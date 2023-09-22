# TASK 1
### DDL commands (Create, Alter, Drop, Truncate)
[a. Create a table EMP with the following structure.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%201.txt)
 ```
 Name   Type
 ------------------------------------------------------------
 EMPNO  NUMBER(6)
 ENAME  VARCHAR2(20)
 JOB    VARCHAR2(10)
 MGR    NUMBER(4)
 DEPTNO NUMBER(3)
 SAL    NUMBER(7,2)
 ```
- [b. Add a column commission to the emptable. Commission should be numeric with null values allowed.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%201.txt)
- [c. Modify the column width of the job field of emptable.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%201.txt)
- [d. Create dept table with the following structure.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%201.txt)
```
Name   Type
-----------------------------------------------------------
DEPTNO NUMBER(2)
DNAME  VARCHAR2(10)
LOC    VARCHAR2(10)
DEPTNO as the primary key
```
- [e. Add constraints to the emptable that is empno as the primary key and deptno as the foreign key](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%201.txt)
- [f. Add constraints to the emptable to check the empno value while entering(i.e)empno>100.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%201.txt)
- [g. Salary value by default is 5000, otherwise it should accept the values from the user.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%201.txt)
- [h. Add columns DOB to the emp table. Add and drop a column DOJ to the emp table.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%201.txt)
# TASK 2
### DML COMMANDS (Insert, Update, Delete)
- [a. Insert 5 records into dept Insert few rows and truncate those from the emp1 table and also drop it.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%202.txt)
- [b. Insert 11 records into emp table.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%202.txt)
- [c. Update the emptable to set the value of commission of all employees to Rs1000/- who are working as managers.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%202.txt)
- [d. Delete only those who are working as supervisors.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%202.txt)
- [e. Delete the rows whose empno is 7599.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%202.txt)
# TASK 3
- [TCL COMMANDS (Save Point, Rollback Commit)](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/TASK%203.txt)
# 
TASK 4
### DQL COMMAND (Select)- SQL Operators and Order by Clause
- [a. List the records in the emptable order by salary in descending order.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%204.sql)
- [b. Display only those employees whose deptno is 30.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%204.sql)
- [c. Display deptno from the table employee avoiding the duplicated values.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%204.sql)
- [d. List all employee names, salary and 15% rise in salary. Label the column as pay hike.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%204.sql)
- [e. Display the rows whose salary ranges from 15000 to 30000.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%204.sql)
- [f. Display all the employees in dept 10 and 20 in alphabetical order of names.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%204.sql)
- [g. List the employee names who do not earn commission.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%204.sql)
- [h. Display all the details of the records with 5-character names with ‘S’ as starting character.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%204.sql)
- [i. Display joining date of all employees in the year of 1998.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%204.sql)
- [j. List out the employee names whose salary is greater than 5000 and less than 6000.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%204.sql)
# TASK 5
### SQL Aggregate Functions, Group by clause, Having clause
- [a. Count the total records in the emptable.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/task5.txt)
- [b. Calculate the total and average salary of the employee.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/task5.txt)
- [c. Determine the max and min salary and rename the column as max_salary and min_salary.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/task5.txt)
- [d. Find number of departments in employee table.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/task5.txt)
- [e. Display job wise sum, average, max, min salaries.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/task5.txt)
- [f. Display maximum salaries of all the departments having maximum salary >2000](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/task5.txt)
- [g. Display job wise sum, avg, max, min salaries in department 10 having average salary is greater than 1000 and the result is ordered by sum of salary in descending order.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/task5.txt)
# TASK 6
### SQL Functions
- [a. Display the employee name concatenate with employee number.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%206.sql)
- [b. Display half of employee name in upper case and half in lowercase.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%206.sql)
- [c. Display the month name of date “14-jul-09” in full.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%206.sql)
- [d. Display the Date of joining of all employees in the format “dd-mm-yy”.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%206.sql)
- [e. Display the date two months after the Date of joining of employees.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%206.sql)
- [f. Display the last date of that month in “05-Oct-09”.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%206.sql)
- [g. Display the rounded date in the year format, month format, day format in the employee](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%206.sql)
- [h. Display the commissions earned by employees. If they do not earn commission, display it as “No Commission”.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%206.sql)
# TASK 7
### Nested Queries
- [a. Find the third highest salary of an employee.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%207.sql)
- [b. Display all employee names and salary whose salary is greater than minimum salary of the company and job title starts with 'M'.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%207.sql)
- [c. Write a query to display information about employees who earn more than any employee in dept 30.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%207.sql)
- [d. Display the employees who have the same job as Jones and whose salary is greater than or equal to the salary of Ford.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%207.sql)
- [e. List out the employee names who get the salary greater than the maximum salaries of dept with deptno 20,30.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%207.sql)
- [f. Display the maximum salaries of the departments whose maximum salary is greater than 9000.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%207.sql)
- [g. Create a table employee with the same structure as the table emp and insert rows into the table using select clause.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%207.sql)
- [h. Create a manager table from the emptable which should hold details only about the managers.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%207.sql)
# TASK 8
### Joins, Set Operators
- [a. Display all the employees and the departments implementing a left outer join.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%208.sql)
- [b. Display the employee name and department name in which they are working implementing a full outer join.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%208.sql)
- [c. Write a query to display their employee names and their managers’ name and salary for every employee.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%208.sql)
- [d. Write a query to output the name, job, empno, deptname and location for each dept, even if there are no employees.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%208.sql)
- [e. Display the details of those who draw the same salary.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%208.sql)
# TASK 9
### Views
- [a. Create a view that displays the employee id, name and salary of employees who belong to 10th department.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/task9.sql)
- [b. Create a view with read only option that displays the employee name and their department name.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/task9.sql)
- [c. Display all the views generated.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/task9.sql)
- [d. Execute the DML commands on views created and drop them](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/task9.sql)
# TASK 10
[Practice on DCL commands, Sequence and indexes.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task%2010.sql)
# TASK 11
- [a. Write a PL/SQL code to retrieve the employee name, join date and designation of an employee whose number is given as input by the user.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task11.sql)
- [b. Write a PL/SQL code to calculate tax of employee.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task11.sql)
- [c. Write a PL/SQL program to display top ten employee details based on salary using cursors.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task11.sql)
- [d. Write a PL/SQL program to update the commission values for all the employees’ with salary less than 2000, by adding 1000 to the existing values.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task11.sql)
# TASK 12
- [a. Write a trigger on employee table that shows the old and new values of employee name after updating on employee name.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task12/T12a.sql)
- [b. Write a PL/SQL procedure for inserting, deleting and updating the employee table.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task12/T12b.sql)
- [c. Write a PL/SQL function that accepts the department number and returns the total salary of that department.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task12/T12c.sql)
# TASK 13
- [a. Write PL/SQL program to handle predefined exceptions.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task13/T13a.sql)
- [b. Write PL/SQL program to handle user defined exception.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task13/T13b.sql)
- c. Write a PL/SQL code to create
  - [i) Package specification](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task13/T13.sql)
  - [ii) Package body to insert, update, delete and retrieve data on emptable.](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task13/T13c.sql)
# TASK 14
[Table locking (Shared Lock and Exclusive lock)](https://github.com/prabhasg03/Task-Codes/blob/DBMS/DBMSL/Task14.sql)
