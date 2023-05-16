SQL*Plus: Release 10.2.0.1.0 - Production on Thu Nov 3 12:38:39 2022

Copyright (c) 1982, 2005, Oracle.  All rights reserved.

SQL> connect
Enter user-name: Prabhas
Enter password:
Connected.
SQL> insert into dept values(&DEPTNO,'&DNAME','&LOC');
Enter value for deptno: 1
Enter value for dname: A
Enter value for loc: BANGLORE
old   1: insert into dept values(&DEPTNO,'&DNAME','&LOC')
new   1: insert into dept values(1,'A','BANGLORE')

1 row created.

SQL> /
Enter value for deptno: 2
Enter value for dname: B
Enter value for loc: HYDERABAD
old   1: insert into dept values(&DEPTNO,'&DNAME','&LOC')
new   1: insert into dept values(2,'B','HYDERABAD')

1 row created.

SQL> /
Enter value for deptno: 3
Enter value for dname: C
Enter value for loc: CHENNAI
old   1: insert into dept values(&DEPTNO,'&DNAME','&LOC')
new   1: insert into dept values(3,'C','CHENNAI')

1 row created.

SQL> /
Enter value for deptno: 4
Enter value for dname: D
Enter value for loc: DELHI
old   1: insert into dept values(&DEPTNO,'&DNAME','&LOC')
new   1: insert into dept values(4,'D','DELHI')

1 row created.

SQL> /
Enter value for deptno: 5
Enter value for dname: E
Enter value for loc: MUMBAI
old   1: insert into dept values(&DEPTNO,'&DNAME','&LOC')
new   1: insert into dept values(5,'E','MUMBAI')

1 row created.

SQL> CREATE TABLE EMP1 AS SELECT * FROM EMP
  2  ;

Table created.

SQL> DESC EMP1
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                              NUMBER(6)
 ENAME                                              VARCHAR2(20)
 JOB                                                VARCHAR2(20)
 MGR                                                NUMBER(4)
 DEPTNO                                             NUMBER(3)
 SAL                                                NUMBER(7,2)
 COMMISION                                          NUMBER(10)
 DOB                                                DATE

SQL> INSERT INTO EMP1 VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB');
Enter value for empno: 101
Enter value for ename: RAM
Enter value for job: ACCOUNTANT
Enter value for mgr: 50
Enter value for deptno: 1
Enter value for sal: 9000
Enter value for commision: 1000
Enter value for dob: 11-JULY-1993
old   1: INSERT INTO EMP1 VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP1 VALUES(101,'RAM','ACCOUNTANT',50,1,9000,1000,'11-JULY-1993')

1 row created.

SQL> /
Enter value for empno: 102
Enter value for ename: RAJ
Enter value for job: MANAGER
Enter value for mgr: 50
Enter value for deptno: 3
Enter value for sal: 10000
Enter value for commision: 10000
Enter value for dob: 21-JULY-1991
old   1: INSERT INTO EMP1 VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP1 VALUES(102,'RAJ','MANAGER',50,3,10000,10000,'21-JULY-1991')

1 row created.

SQL> SELECT * FROM EMP1;

     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
       101 RAM                  ACCOUNTANT                   50          1
      9000       1000 11-JUL-93

       102 RAJ                  MANAGER                      50          3
     10000      10000 21-JUL-91


SQL> TRUNCATE TABLE EMP1;

Table truncated.

SQL> SELECT * FROM EMP1;

no rows selected

SQL> DROP TABLE EMP1;

Table dropped.

SQL> SELECT * FROM EMP1;
SELECT * FROM EMP1
              *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB');
Enter value for empno: 7588
Enter value for ename: RAM
Enter value for job: A
Enter value for mgr: 50
Enter value for deptno: 1
Enter value for sal: 9000
Enter value for commision: 1000
Enter value for dob: 11-JULY-1993
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7588,'RAM','A',50,1,9000,1000,'11-JULY-1993')

1 row created.

SQL> /
Enter value for empno: 7589
Enter value for ename: RAJ
Enter value for job: B
Enter value for mgr: 50
Enter value for deptno: 2
Enter value for sal: 8000
Enter value for commision: 1000
Enter value for dob: 23-MARCH-1995
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7589,'RAJ','B',50,2,8000,1000,'23-MARCH-1995')

1 row created.

SQL> /
Enter value for empno: 7590
Enter value for ename: SAM
Enter value for job: MANAGER
Enter value for mgr: 50
Enter value for deptno: 3
Enter value for sal: 8500
Enter value for commision: 1000
Enter value for dob: 15-AUGUST-1994
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7590,'SAM','MANAGER',50,3,8500,1000,'15-AUGUST-1994')

1 row created.

SQL> /
Enter value for empno: 7591
Enter value for ename: EVE
Enter value for job: D
Enter value for mgr: 50
Enter value for deptno: 4
Enter value for sal: 9500
Enter value for commision: 1000
Enter value for dob: 18-JANUARY-1984
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7591,'EVE','D',50,4,9500,1000,'18-JANUARY-1984')

1 row created.

SQL> /
Enter value for empno: 7599
Enter value for ename: RIA
Enter value for job: E
Enter value for mgr: 50
Enter value for deptno: 5
Enter value for sal: 9700
Enter value for commision: 1000
Enter value for dob: 04-APRIL-1992
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7599,'RIA','E',50,5,9700,1000,'04-APRIL-1992')

1 row created.

SQL> /
Enter value for empno: 7566
Enter value for ename: MARY
Enter value for job: B
Enter value for mgr: 50
Enter value for deptno: 50
Enter value for sal: 2
Enter value for commision:
Enter value for dob:
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7566,'MARY','B',50,50,2,,'')
INSERT INTO EMP VALUES(7566,'MARY','B',50,50,2,,'')
                                               *
ERROR at line 1:
ORA-00936: missing expression


SQL> /
Enter value for empno: 7566
Enter value for ename: HEMA
Enter value for job: A
Enter value for mgr: 50
Enter value for deptno: 1
Enter value for sal: 9000
Enter value for commision: 1000
Enter value for dob: 07-FEBRUARY-1995
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7566,'HEMA','A',50,1,9000,1000,'07-FEBRUARY-1995')

1 row created.

SQL> /
Enter value for empno: 7565
Enter value for ename: MARY
Enter value for job: B
Enter value for mgr: 50
Enter value for deptno: 2
Enter value for sal: 9200
Enter value for commision: 1000
Enter value for dob: 06-OCTOBER-1995
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7565,'MARY','B',50,2,9200,1000,'06-OCTOBER-1995')

1 row created.

SQL> /
Enter value for empno: 7564
Enter value for ename: HENRY
Enter value for job: C
Enter value for mgr: 50
Enter value for deptno: 3
Enter value for sal: 8900
Enter value for commision: 1000
Enter value for dob: 19-MAY-1990
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7564,'HENRY','C',50,3,8900,1000,'19-MAY-1990')

1 row created.

SQL> /
Enter value for empno: 7563
Enter value for ename: TOM
Enter value for job: MANAGER
Enter value for mgr: 50
Enter value for deptno: 4
Enter value for sal: 8800
Enter value for commision:
Enter value for dob:
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7563,'TOM','MANAGER',50,4,8800,,'')
INSERT INTO EMP VALUES(7563,'TOM','MANAGER',50,4,8800,,'')
                                                      *
ERROR at line 1:
ORA-00936: missing expression


SQL> /
Enter value for empno: 7563
Enter value for ename: TOM
Enter value for job: MANAGER
Enter value for mgr: 50
Enter value for deptno: 4
Enter value for sal: 8800
Enter value for commision: 1000
Enter value for dob: 05-NOVEMBER-1986
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7563,'TOM','MANAGER',50,4,8800,1000,'05-NOVEMBER-1986')

1 row created.

SQL> /
Enter value for empno: 7562
Enter value for ename: DANY
Enter value for job: E
Enter value for mgr: 50
Enter value for deptno: 5
Enter value for sal: 8700
Enter value for commision: 1000
Enter value for dob: 03-SEPTEMBER-1997
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7562,'DANY','E',50,5,8700,1000,'03-SEPTEMBER-1997')

1 row created.

SQL> /
Enter value for empno: 7561
Enter value for ename: PETER
Enter value for job: A
Enter value for mgr: 50
Enter value for deptno: 1
Enter value for sal: 8600
Enter value for commision: 1000
Enter value for dob: 09-JULY-1998
old   1: INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&JOB',&MGR,&DEPTNO,&SAL,&COMMISION,'&DOB')
new   1: INSERT INTO EMP VALUES(7561,'PETER','A',50,1,8600,1000,'09-JULY-1998')

1 row created.

SQL> SELECT * FROM EMP;

     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7588 RAM                  A                            50          1
      9000       1000 11-JUL-93

      7589 RAJ                  B                            50          2
      8000       1000 23-MAR-95

      7590 SAM                  MANAGER                      50          3
      8500       1000 15-AUG-94


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7591 EVE                  D                            50          4
      9500       1000 18-JAN-84

      7599 RIA                  E                            50          5
      9700       1000 04-APR-92

      7566 HEMA                 A                            50          1
      9000       1000 07-FEB-95


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7565 MARY                 B                            50          2
      9200       1000 06-OCT-95

      7564 HENRY                C                            50          3
      8900       1000 19-MAY-90

      7563 TOM                  MANAGER                      50          4
      8800       1000 05-NOV-86


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7562 DANY                 E                            50          5
      8700       1000 03-SEP-97

      7561 PETER                A                            50          1
      8600       1000 09-JUL-98


11 rows selected.

SQL> UPDATE EMP
  2  SET COMMISSION=1000;
SET COMMISSION=1000
    *
ERROR at line 2:
ORA-00904: "COMMISSION": invalid identifier


SQL> UPDATE EMP
  2  SET COMMISSION=1000
  3  WHERE JOB='MANAGER';
SET COMMISSION=1000
    *
ERROR at line 2:
ORA-00904: "COMMISSION": invalid identifier


SQL> UPDATE EMP
  2  SET COMMISION=1000
  3  WHERE JOB='MANAGER';

2 rows updated.

SQL> SELECT * FROM EMP;

     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7588 RAM                  A                            50          1
      9000       1000 11-JUL-93

      7589 RAJ                  B                            50          2
      8000       1000 23-MAR-95

      7590 SAM                  MANAGER                      50          3
      8500       1000 15-AUG-94


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7591 EVE                  D                            50          4
      9500       1000 18-JAN-84

      7599 RIA                  E                            50          5
      9700       1000 04-APR-92

      7566 HEMA                 A                            50          1
      9000       1000 07-FEB-95


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7565 MARY                 B                            50          2
      9200       1000 06-OCT-95

      7564 HENRY                C                            50          3
      8900       1000 19-MAY-90

      7563 TOM                  MANAGER                      50          4
      8800       1000 05-NOV-86


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7562 DANY                 E                            50          5
      8700       1000 03-SEP-97

      7561 PETER                A                            50          1
      8600       1000 09-JUL-98


11 rows selected.

SQL> DELETE FROM EMP
  2  WHERE JOB='D';

1 row deleted.

SQL> SELECT * FROM EMP;

     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7588 RAM                  A                            50          1
      9000       1000 11-JUL-93

      7589 RAJ                  B                            50          2
      8000       1000 23-MAR-95

      7590 SAM                  MANAGER                      50          3
      8500       1000 15-AUG-94


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7599 RIA                  E                            50          5
      9700       1000 04-APR-92

      7566 HEMA                 A                            50          1
      9000       1000 07-FEB-95

      7565 MARY                 B                            50          2
      9200       1000 06-OCT-95


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7564 HENRY                C                            50          3
      8900       1000 19-MAY-90

      7563 TOM                  MANAGER                      50          4
      8800       1000 05-NOV-86

      7562 DANY                 E                            50          5
      8700       1000 03-SEP-97


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7561 PETER                A                            50          1
      8600       1000 09-JUL-98


10 rows selected.

SQL> DELETE FROM EMP
  2  WHERE EMPNO=7599;

1 row deleted.

SQL> SELECT * FROM EMP;

     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7588 RAM                  A                            50          1
      9000       1000 11-JUL-93

      7589 RAJ                  B                            50          2
      8000       1000 23-MAR-95

      7590 SAM                  MANAGER                      50          3
      8500       1000 15-AUG-94


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7566 HEMA                 A                            50          1
      9000       1000 07-FEB-95

      7565 MARY                 B                            50          2
      9200       1000 06-OCT-95

      7564 HENRY                C                            50          3
      8900       1000 19-MAY-90


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL  COMMISION DOB
---------- ---------- ---------
      7563 TOM                  MANAGER                      50          4
      8800       1000 05-NOV-86

      7562 DANY                 E                            50          5
      8700       1000 03-SEP-97

      7561 PETER                A                            50          1
      8600       1000 09-JUL-98


9 rows selected.