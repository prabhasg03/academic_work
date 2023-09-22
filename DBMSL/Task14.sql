SQL> lock table emp in share mode nowait;

Table(s) Locked.

SQL> lock table emp in share mode wait 5;

Table(s) Locked.

SQL> lock table emp in exclusive mode nowait;

Table(s) Locked.

SQL> lock table emp in exclusive mode wait 5;

Table(s) Locked.

SQL> select * from emp where ename='MILLER' for update of sal;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7934 MILLER     CLERK           7782 23-JAN-82       2350
        10
