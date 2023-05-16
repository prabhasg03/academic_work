SQL> select * from emp left outer join dept on (emp.deptno=dept.deptno);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO     DEPTNO DNAME          LOC
---------- ---------- -------------- -------------
      7934 MILLER     CLERK           7782 23-JAN-82       1300
        10         10 ACCOUNTING     NEW YORK

      7782 CLARK      MANAGER         7839 09-JUN-81       2450
        10         10 ACCOUNTING     NEW YORK

      7839 KING       PRESIDENT            17-NOV-81       5000
        10         10 ACCOUNTING     NEW YORK


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO     DEPTNO DNAME          LOC
---------- ---------- -------------- -------------
      7876 ADAMS      CLERK           7788 23-MAY-87       1100
        20         20 RESEARCH       DALLAS

      7369 SMITH      CLERK           7902 17-DEC-80        800
        20         20 RESEARCH       DALLAS

      7902 FORD       ANALYST         7566 03-DEC-81       3000
        20         20 RESEARCH       DALLAS


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO     DEPTNO DNAME          LOC
---------- ---------- -------------- -------------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000
        20         20 RESEARCH       DALLAS

      7566 JONES      MANAGER         7839 02-APR-81       2975
        20         20 RESEARCH       DALLAS

      7900 JAMES      CLERK           7698 03-DEC-81        950
        30         30 SALES          CHICAGO


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO     DEPTNO DNAME          LOC
---------- ---------- -------------- -------------
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0
        30         30 SALES          CHICAGO

      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400
        30         30 SALES          CHICAGO

      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300
        30         30 SALES          CHICAGO


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO     DEPTNO DNAME          LOC
---------- ---------- -------------- -------------
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500
        30         30 SALES          CHICAGO

      7698 BLAKE      MANAGER         7839 01-MAY-81       2850
        30         30 SALES          CHICAGO


14 rows selected.

SQL> select emp.ename,dept.dname from emp full outer join dept on (emp.deptno=dept.deptno);

ENAME      DNAME
---------- --------------
MILLER     ACCOUNTING
CLARK      ACCOUNTING
KING       ACCOUNTING
ADAMS      RESEARCH
SMITH      RESEARCH
FORD       RESEARCH
SCOTT      RESEARCH
JONES      RESEARCH
JAMES      SALES
TURNER     SALES
MARTIN     SALES

ENAME      DNAME
---------- --------------
ALLEN      SALES
WARD       SALES
BLAKE      SALES
           OPERATIONS

15 rows selected.

SQL> select a.ename"Employee",b.ename"Manager",a.sal"Salary" from emp a,emp b where a.mgr=b.empno;

Employee   Manager        Salary
---------- ---------- ----------
JONES      KING             2975
CLARK      KING             2450
BLAKE      KING             2850
JAMES      BLAKE             950
TURNER     BLAKE            1500
MARTIN     BLAKE            1250
ALLEN      BLAKE            1600
WARD       BLAKE            1250
MILLER     CLARK            1300
FORD       JONES            3000
SCOTT      JONES            3000

Employee   Manager        Salary
---------- ---------- ----------
ADAMS      SCOTT            1100
SMITH      FORD              800

13 rows selected.

SQL> select ename,job,empno,dname,loc from emp natural join dept;

ENAME      JOB            EMPNO DNAME          LOC
---------- --------- ---------- -------------- -------------
KING       PRESIDENT       7839 ACCOUNTING     NEW YORK
BLAKE      MANAGER         7698 SALES          CHICAGO
CLARK      MANAGER         7782 ACCOUNTING     NEW YORK
JONES      MANAGER         7566 RESEARCH       DALLAS
SCOTT      ANALYST         7788 RESEARCH       DALLAS
FORD       ANALYST         7902 RESEARCH       DALLAS
SMITH      CLERK           7369 RESEARCH       DALLAS
WARD       SALESMAN        7521 SALES          CHICAGO
ALLEN      SALESMAN        7499 SALES          CHICAGO
MARTIN     SALESMAN        7654 SALES          CHICAGO
TURNER     SALESMAN        7844 SALES          CHICAGO

ENAME      JOB            EMPNO DNAME          LOC
---------- --------- ---------- -------------- -------------
ADAMS      CLERK           7876 RESEARCH       DALLAS
JAMES      CLERK           7900 SALES          CHICAGO
MILLER     CLERK           7934 ACCOUNTING     NEW YORK

14 rows selected.

SQL> select a.empno,a.ename,b.empno,b.ename from emp a,emp b where a.sal=b.sal and not(a.empno=b.empno);

     EMPNO ENAME           EMPNO ENAME
---------- ---------- ---------- ----------
      7902 FORD             7788 SCOTT
      7788 SCOTT            7902 FORD
      7654 MARTIN           7521 WARD
      7521 WARD             7654 MARTIN