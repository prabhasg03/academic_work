
SQL*Plus: Release 10.2.0.1.0 - Production on Thu Nov 3 12:29:25 2022

Copyright (c) 1982, 2005, Oracle.  All rights reserved.

SQL> CONNECT
Enter user-name: Prabhas
Enter password:
Connected.
SQL> CREATE TABLE EMP(EMPNO NUMBER(6),
  2  ENAME VARCHAR2,JOB VARCHAR2(10)
  3  ,MGR NUMBER(4),DEPTNO NUMBER(3),SAL NUMBER(7,2));
ENAME VARCHAR2,JOB VARCHAR2(10)
              *
ERROR at line 2:
ORA-00906: missing left parenthesis


SQL> CREATE TABLE EMP(EMPNO NUMBER(6),
  2  ENAME VARCHAR2(20),JOB VARCHAR2(10),MGR NUMBER(4),DEPTNO NUMBER(3),SAL NUMBER(7,2));

Table created.

SQL> ALTER TABLE EMP ADD COMMISION NUMBER(10);

Table altered.

SQL> DESC EMP
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                              NUMBER(6)
 ENAME                                              VARCHAR2(20)
 JOB                                                VARCHAR2(10)
 MGR                                                NUMBER(4)
 DEPTNO                                             NUMBER(3)
 SAL                                                NUMBER(7,2)
 COMMISION                                          NUMBER(10)

SQL> ALTER TABLE EMP MODIFY JOB VARCHAR2(20);

Table altered.

SQL> DESC EMP
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                              NUMBER(6)
 ENAME                                              VARCHAR2(20)
 JOB                                                VARCHAR2(20)
 MGR                                                NUMBER(4)
 DEPTNO                                             NUMBER(3)
 SAL                                                NUMBER(7,2)
 COMMISION                                          NUMBER(10)

SQL> CREATE TABLE DEPT(DEPTNO NUMBER(2),DNAME VARCHAR2(10),LOC VARCHAR2(10));

Table created.

SQL> DESC DEPT
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPTNO                                             NUMBER(2)
 DNAME                                              VARCHAR2(10)
 LOC                                                VARCHAR2(10)

SQL> ALTER TABLE DEPT ADD CONSTRAINT pk_dept PRIMARY KEY(DEPTNO);

Table altered.

SQL> DESC DEPT
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 DEPTNO                                    NOT NULL NUMBER(2)
 DNAME                                              VARCHAR2(10)
 LOC                                                VARCHAR2(10)

SQL> ALTER TABLE EMP ADD CONSTRAINT pk_emp PRIMARY KEY(EMPNO);

Table altered.

SQL> ALTER TABLE EMP ADD CONSTRAINT fk_deptno FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO);

Table altered.

SQL> DESC EMP
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER(6)
 ENAME                                              VARCHAR2(20)
 JOB                                                VARCHAR2(20)
 MGR                                                NUMBER(4)
 DEPTNO                                             NUMBER(3)
 SAL                                                NUMBER(7,2)
 COMMISION                                          NUMBER(10)

SQL> ALTER TABLE EMP ADD CHECK(EMPNO>100);

Table altered.

SQL> DESC EMP
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER(6)
 ENAME                                              VARCHAR2(20)
 JOB                                                VARCHAR2(20)
 MGR                                                NUMBER(4)
 DEPTNO                                             NUMBER(3)
 SAL                                                NUMBER(7,2)
 COMMISION                                          NUMBER(10)

SQL> ALTER TABLE EMP MODIFY SAL NUMBER(7,2) DEFAULT 5000.00;

Table altered.

SQL> DESC EMP
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER(6)
 ENAME                                              VARCHAR2(20)
 JOB                                                VARCHAR2(20)
 MGR                                                NUMBER(4)
 DEPTNO                                             NUMBER(3)
 SAL                                                NUMBER(7,2)
 COMMISION                                          NUMBER(10)

SQL> ALTER TABLE EMP ADD DOB DATE;

Table altered.

SQL> ALTER TABLE EMP ADD DOJ DATE;

Table altered.

SQL> DESC EMP
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER(6)
 ENAME                                              VARCHAR2(20)
 JOB                                                VARCHAR2(20)
 MGR                                                NUMBER(4)
 DEPTNO                                             NUMBER(3)
 SAL                                                NUMBER(7,2)
 COMMISION                                          NUMBER(10)
 DOB                                                DATE
 DOJ                                                DATE

SQL> ALTER TABLE EMP DROP COLUMN DOJ;

Table altered.

SQL> DESC EMP
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPNO                                     NOT NULL NUMBER(6)
 ENAME                                              VARCHAR2(20)
 JOB                                                VARCHAR2(20)
 MGR                                                NUMBER(4)
 DEPTNO                                             NUMBER(3)
 SAL                                                NUMBER(7,2)
 COMMISION                                          NUMBER(10)
 DOB                                                DATE

SQL>