
SQL*Plus: Release 10.2.0.1.0 - Production on Wed Jan 4 10:06:31 2023

Copyright (c) 1982, 2005, Oracle.  All rights reserved.

SQL> connect
Enter user-name: prabhas
Enter password:
Connected.
SQL> select * from emp order by sal desc;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7839 KING       PRESIDENT            17-NOV-81       5000
        10

      7788 SCOTT      ANALYST         7566 19-APR-87       3000
        20

      7902 FORD       ANALYST         7566 03-DEC-81       3000
        20


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7566 JONES      MANAGER         7839 02-APR-81       2975
        20

      7698 BLAKE      MANAGER         7839 01-MAY-81       2850
        30

      7782 CLARK      MANAGER         7839 09-JUN-81       2450
        10


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300
        30

      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0
        30

      7934 MILLER     CLERK           7782 23-JAN-82       1300
        10


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400
        30

      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500
        30

      7876 ADAMS      CLERK           7788 23-MAY-87       1100
        20


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7900 JAMES      CLERK           7698 03-DEC-81        950
        30

      7369 SMITH      CLERK           7902 17-DEC-80        800
        20


14 rows selected.

SQL> select * from emp where deptno=30;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850
        30

      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500
        30

      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300
        30


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400
        30

      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0
        30

      7900 JAMES      CLERK           7698 03-DEC-81        950
        30


6 rows selected.

SQL> select distinct deptno from emp;

    DEPTNO
----------
        30
        20
        10

SQL> select ename,sal,1.15*sal"pay hike" from emp;

ENAME             SAL   pay hike
---------- ---------- ----------
KING             5000       5750
BLAKE            2850     3277.5
CLARK            2450     2817.5
JONES            2975    3421.25
SCOTT            3000       3450
FORD             3000       3450
SMITH             800        920
WARD             1250     1437.5
ALLEN            1600       1840
MARTIN           1250     1437.5
TURNER           1500       1725

ENAME             SAL   pay hike
---------- ---------- ----------
ADAMS            1100       1265
JAMES             950     1092.5
MILLER           1300       1495

14 rows selected.

SQL> select * from emp where sal between 15000 and 30000;

no rows selected

SQL> select * from emp where deptno in(10,20) order by ename;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7876 ADAMS      CLERK           7788 23-MAY-87       1100
        20

      7782 CLARK      MANAGER         7839 09-JUN-81       2450
        10

      7902 FORD       ANALYST         7566 03-DEC-81       3000
        20


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7566 JONES      MANAGER         7839 02-APR-81       2975
        20

      7839 KING       PRESIDENT            17-NOV-81       5000
        10

      7934 MILLER     CLERK           7782 23-JAN-82       1300
        10


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000
        20

      7369 SMITH      CLERK           7902 17-DEC-80        800
        20


8 rows selected.

SQL> select ename from emp where comm=0 or comm is null;

ENAME
----------
KING
BLAKE
CLARK
JONES
SCOTT
FORD
SMITH
TURNER
ADAMS
JAMES
MILLER

11 rows selected.

SQL> select * from emp where ename like 'S%____';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000
        20

      7369 SMITH      CLERK           7902 17-DEC-80        800
        20


SQL> select hiredate from emp where hiredate between '01-JAN-98' and '31-DEC-98';

no rows selected

SQL> select ename from emp where sal between 5000 and 6000;

ENAME
----------
KING

SQL>