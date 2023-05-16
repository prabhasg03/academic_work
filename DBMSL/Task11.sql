
SQL*Plus: Release 10.2.0.1.0 - Production on Thu Jan 5 13:09:44 2023

Copyright (c) 1982, 2005, Oracle.  All rights reserved.

SQL> connect prabhas/guda
Connected.
SQL> set serveroutput on;
//a. Write a PL/SQL code to retrieve the employee name, join date and designation of an employee whose number is given as input by the user.
sol:-
SQL> declare
  2      name varchar2(25);
  3      joindate date;
  4      job emp.job%type;
  5      begin
  6      select ename,hiredate,job into name,joindate,job from emp where empno=&empno;
  7      dbms_output.put_line('Name: '||name);
  8      dbms_output.put_line('Joindate: '||joindate);
  9      dbms_output.put_line('Designation: '||job);
 10      end;
 11      /
Enter value for empno: 7839
old   6:     select ename,hiredate,job into name,joindate,job from emp where empno=&empno;
new   6:     select ename,hiredate,job into name,joindate,job from emp where empno=7839;
Name: KING
Joindate: 17-NOV-81
Designation: PRESIDENT

PL/SQL procedure successfully completed.

b. Write a PL/SQL code to calculate tax of employee.
sol:-
SQL> declare
        name varchar2(25);
        salary emp.sal%type;
        tax number(8,3);
    begin
        select ename,sal into name,salary from emp where empno=&empno;
        if salary<10000 then
         tax:=salary*0.1;
    else if salary between 10000 and 20000 then
        tax:=salary*0.2;
   else
        tax:=salary*0.3;
   end if;
       dbms_output.put_line('Name: '||name);
       dbms_output.put_line('Salary: '||salary);
       dbms_output.put_line('Tax: '||tax);
   end;
   /
Enter value for empno: 7839
old   6:     select ename,sal into name,salary from emp where empno=&empno;
new   6:     select ename,sal into name,salary from emp where empno=7839;
Name: KING
Salary: 5000
Tax: 500

PL/SQL procedure successfully completed.
c. Write a PL/SQL program to display top ten employee details based on salary using cursors.
SQL> declare
  2  cursor a is select empno,ename,sal from emp order by sal desc;
  3  rec a%rowtype;
  4  i number(3):=0;
  5
  6  begin
  7  open a;
  8  loop
  9  i:=i+1;
 10  fetch a into rec;
 11  exit when i>10;
 12  dbms_output.put_line(i||'. '||rec.empno||' '||rec.ename||' '||rec.sal);
 13  end loop;
 14  close a;
 15  end;
 16  /
1. 7839 KING 5000
2. 7788 SCOTT 3000
3. 7902 FORD 3000
4. 7566 JONES 2975
5. 7698 BLAKE 2850
6. 7782 CLARK 2450
7. 7499 ALLEN 1600
8. 7844 TURNER 1500
9. 7934 MILLER 1300
10. 7654 MARTIN 1250

PL/SQL procedure successfully completed.

d. Write a PL/SQL program to update the commission values for all the employees’ with salary less than 2000, by adding 1000 to the existing values.

SQL> declare
    cursor a is select empno,sal,comm from emp;
    b a%rowtype;
    x number(7,2);
    y number;
    begin
    open a;
    loop
    fetch a into b;
   exit when a%notfound;
   x:=b.comm;
   y:=(b.comm)+1000;
   if(b.sal<2000) then
   update emp set comm=y where empno=b.empno;
   dbms_output.put_line('Commission % updated from '||x||' to '||y);
   end if;
   end loop;
   end;
   /
Commission % updated from 1000 to 2000
Commission % updated from 300 to 1300
Commission % updated from 1000 to 2000
Commission % updated from 500 to 1500
Commission % updated from 500 to 1500
Commission % updated from 500 to 1500
Commission % updated from 500 to 1500
Commission % updated from 300 to 1300
Commission % updated from 300 to 1300
Commission % updated from 300 to 1300
Commission % updated from 300 to 1300
Commission % updated from 500 to 1500
Commission % updated from 300 to 1300
Commission % updated from 1000 to 2000

PL/SQL procedure successfully completed.