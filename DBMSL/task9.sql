SQL*Plus: Release 11.2.0.2.0 Production on Fri Sep 22 18:44:15 2023

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

SQL> connect
Enter user-name: prabhas
Enter password:
ERROR:
ORA-28002: the password will expire within 7 days


Connected.
SQL> select * from emp;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7839 KING       PRESIDENT            17-NOV-81       6050
        10

      7698 BLAKE      MANAGER         7839 01-MAY-81       2850
        30

      7782 CLARK      MANAGER         7839 09-JUN-81       3500
        10


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7566 JONES      MANAGER         7839 02-APR-81       2975
        20

      7788 SCOTT      ANALYST         7566 19-APR-87       3000
        20

      7902 FORD       ANALYST         7566 03-DEC-81       3000
        20


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7369 SMITH      CLERK           7902 17-DEC-80        800
        20

      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300
        30

      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500
        30


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400
        30

      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0
        30

      7876 ADAMS      CLERK           7788 23-MAY-87       1100
        20


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7900 JAMES      CLERK           7698 03-DEC-81        950
        30

      7934 MILLER     CLERK           7782 23-JAN-82       2350
        10


14 rows selected.

SQL> select * from dept;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON

SQL> create view emp_view as select empno,ename,sal from emp where deptno=10;

View created.

SQL> select * from emp_view;

     EMPNO ENAME             SAL
---------- ---------- ----------
      7839 KING             6050
      7782 CLARK            3500
      7934 MILLER           2350
SQL> create view emp_dept as select empno,ename,deptno from emp with read only constraint emp_dept_readonly;

View created.

SQL> select * from emp_dept;

     EMPNO ENAME          DEPTNO
---------- ---------- ----------
      7839 KING               10
      7698 BLAKE              30
      7782 CLARK              10
      7566 JONES              20
      7788 SCOTT              20
      7902 FORD               20
      7369 SMITH              20
      7499 ALLEN              30
      7521 WARD               30
      7654 MARTIN             30
      7844 TURNER             30

     EMPNO ENAME          DEPTNO
---------- ---------- ----------
      7876 ADAMS              20
      7900 JAMES              30
      7934 MILLER             10

14 rows selected.

SQL> insert into emp_view values(7960,'RAM',10);

1 row created.

SQL> insert into emp_dept values(7960,'RAM',10);
insert into emp_dept values(7960,'RAM',10)
*
ERROR at line 1:
ORA-42399: cannot perform a DML operation on a read-only view


SQL> select view_name from user_views;

VIEW_NAME
------------------------------
EMP_DEPT
EMP_VIEW

SQL> insert into emp_view values(7969,'MILTON',20);

1 row created.

SQL> delete from emp_view where empno=7969;

0 rows deleted.

SQL> delete from emp_view where empno=7960;

0 rows deleted.

SQL> drop view emp_view;

View dropped.

SQL> drop view emp_dept;

View dropped.
