# TASK 1
### DDL commands (Create, Alter, Drop, Truncate)
[a. Create a table EMP with the following structure.]()
 ```
 Name Type
 ------------------------------------------------------------
 EMPNO NUMBER(6)
 ENAME VARCHAR2(20)
 JOB VARCHAR2(10)
 MGR NUMBER(4)
 DEPTNO NUMBER(3)
 SAL NUMBER(7,2)
 ```
- [b. Add a column commission to the emptable. Commission should be numeric with null values allowed.]()
- [c. Modify the column width of the job field of emptable.]()
- [d. Create dept table with the following structure.]()
```
Name Type
-----------------------------------------------------------
DEPTNO NUMBER(2)
DNAME VARCHAR2(10)
LOC VARCHAR2(10)
DEPTNO as the primary key
```
- [e. Add constraints to the emptable that is empno as the primary key and deptno as the foreign key]
- [f. Add constraints to the emptable to check the empno value while entering(i.e)empno>100.]
- [g. Salary value by default is 5000, otherwise it should accept the values from the user.]
- [h. Add columns DOB to the emp table. Add and drop a column DOJ to the emp table.]
# TASK 2
### DML COMMANDS (Insert, Update, Delete)
a. Insert 5 records into dept Insert few rows and truncate those from the emp1 table and also 
drop it.
b. Insert 11 records into emptable.
c. Update the emptable to set the value of commission of all employees to Rs1000/- who are 
working as managers.
d. Delete only those who are working as supervisors.
e. Delete the rows whose empnois7599.
TASK 3
TCL COMMANDS (Save Point, Rollback Commit)
TASK 4
DQL COMMAND (Select)- SQL Operators and Order by Clause
a. List the records in the emptable order by salary in descending order.
b. Display only those employees whose deptnois30.
c. Display deptno from the table employee avoiding the duplicated values.
d. List all employee names, salary and 15% rise in salary. Label the column as pay hike.
e. Display the rows whose salary ranges from 15000 to 30000.
f. Display all the employees in dept 10 and 20 in alphabetical order of names.
g. List the employee names who do not earn commission.
h. Display all the details of the records with 5-character names with ‘S’ as starting character.
i. Display joining date of all employees in the year of1998.
j. List out the employee names whose salary is greater than 5000 and less than6000.
TASK 5
SQL Aggregate Functions, Group by clause, Having clause
a. Count the total records in the emptable.
b. Calculate the total and average salary of the employee.
c. Determinethemaxandminsalaryandrenamethecolumnasmax_salaryandmin_salary.
d. Find number of departments in employee table.
e. Display job wise sum, average, max, min salaries.
f. Display maximum salaries of all the departments having maximum salary >2000
g. Display job wise sum, avg, max, min salaries in department 10 having average salary 
is greater than 1000 and the result is ordered by sum of salary in descending order.
TASK 6
SQL Functions
a. Display the employee name concatenate with employee number.
b. Display half of employee name in upper case and half in lowercase.
c. Display the month name of date “14-jul-09” in full.
d. Display the Date of joining of all employees in the format“dd-mm-yy”.
e. Display the date two months after the Date of joining of employees.
f. Display the last date of that month in“05-Oct-09”.
g. Display the rounded date in the year format, month format, day format in the employee
h. Display the commissions earned by employees. If they do not earn commission, display it 
as “No Commission”.
TASK 7
Nested Queries
a. Find the third highest salary of an employee.
b. Display all employee names and salary whose salary is greater than minimum salary of the 
company and job title starts with‘M’.
c. Write a query to display information about employees who earn more than any employee 
in dept30.
d. Display the employees who have the same job as Jones and whose salary is greater than or 
equal to the salary of Ford.
e. List out the employee names who get the salary greater than the maximum salaries of dept 
with deptno20,30.
f. Display the maximum salaries of the departments whose maximum salary is greater 
than9000.
g. Create a table employee with the same structure as the table emp and insert rows into the 
table using select clause.
h. Create a manager table from the emptable which should hold details only about the 
managers.
TASK 8
Joins, Set Operators
a. Display all the employees and the departments implementing a left outer join.
b. Display the employee name and department name in which they are working implementing 
a full outer join.
c. Write a query to display their employee names and their managers’ name and salary for 
every employee.
d. Write a query to output the name, job, empno, deptname and location for each dept, even 
if there are no employees.
e. Display the details of those who draw the same salary.
TASK 9
Views
a. Create a view that displays the employee id, name and salary of employees who belong to 
10
th
department.
b. Create a view with read only option that displays the employee name and their 
department name.
c. Display all the views generated.
d. Execute the DML commands on views created and drop them
TASK 10
Practice on DCL commands, Sequence and indexes.
TASK 11
a. Write a PL/SQL code to retrieve the employee name, join date and designation of an 
employee whose number is given as input by the user.
b. Write a PL/SQL code to calculate tax of employee.
c. Write a PL/SQL program to display top ten employee details based on salary using cursors.
d. Write a PL/SQL program to update the commission values for all the employees’ with salary 
less than 2000, by adding 1000 to the existing values.
TASK 12
a. Write a trigger on employee table that shows the old and new values of employee name after 
updating on employee name.
b. Write a PL/SQL procedure for inserting, deleting and updating the employee table.
c. Write a PL/SQL function that accepts the department number and returns the total salary of 
that department.
TASK 13
a. Write PL/SQL program to handle predefined exceptions.
b. Write PL/SQL program to handle user defined exception.
c. Write a PL/SQL code to create
i) Package specification
ii) Package body to insert, update, delete and retrieve data on emptable.
TASK 14
Table locking (Shared Lock and Exclusive lock)
