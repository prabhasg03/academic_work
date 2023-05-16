SQL> select min(sal)"3rd Highest Salary" from (select distinct sal from emp order by sal desc)where rownum<=3;

3rd Highest Salary
------------------
              2975

SQL> select ename,sal from emp where sal>(select min(sal) from emp where job like 'M%');

ENAME             SAL
---------- ----------
KING             5000
BLAKE            2850
JONES            2975
SCOTT            3000
FORD             3000

SQL> select * from emp where sal>ANY(select sal from emp where deptno=30);

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


12 rows selected.

SQL> select * from emp where job=(select job from emp where ename='JONES') and sal>=(select sal from emp where ename='FORD');

no rows selected

SQL> select ename from emp where sal>ALL(select max(sal) from emp where deptno in(20,30));

ENAME
----------
KING

SQL> select deptno,max(sal) from emp group by deptno having max(sal)>9000;

no rows selected

SQL> create table employee as (select * from emp);

Table created.

SQL> select * from employee;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7839 KING       PRESIDENT            17-NOV-81       5000
        10

      7698 BLAKE      MANAGER         7839 01-MAY-81       2850
        30

      7782 CLARK      MANAGER         7839 09-JUN-81       2450
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

      7876 ADAMS      CLERK           7788 23-MAY-87       1100
        20


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7900 JAMES      CLERK           7698 03-DEC-81        950
        30

      7934 MILLER     CLERK           7782 23-JAN-82       1300
        10


14 rows selected.

SQL> create table manager as (select * from emp where job='MANAGER');

Table created.

SQL> select * from manager;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850
        30

      7782 CLARK      MANAGER         7839 09-JUN-81       2450
        10

      7566 JONES      MANAGER         7839 02-APR-81       2975
        20
