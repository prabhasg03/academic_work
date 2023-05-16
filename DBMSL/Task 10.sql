DCL commands
-------------------------------------------
SQL> connect system/tiger;
Connected.
SQL> create user test identified by pswd;

User created.

SQL> grant create session,create table,create sequence,create view to test;

Grant succeeded.

SQL> create role manager;

Role created.

SQL> grant create table,create view to manager;

Grant succeeded.

SQL> grant manager to test;

Grant succeeded.

SQL> alter user test identified by qwerty;

User altered.

SQL> grant select on emp to test;

Grant succeeded.

SQL> grant update(dname,loc) on dept to test;

Grant succeeded.

SQL> grant select on prabhas.emp to test;

Grant succeeded.

SQL> grant update(dname,loc) on prabhas.dept to test;

Grant succeeded.

SQL> grant select,insert on prabhas.emp to test;

Grant succeeded.

SQL> grant select,insert on prabhas.dept to test;

Grant succeeded.

SQL> revoke select,insert on prabhas.emp from test;

Revoke succeeded.

SQL> connect test/qwerty;
Connected.

SQL> select ename from prabhas.emp;
select ename from prabhas.emp
                          *
ERROR at line 1:
ORA-00942: table or view does not exist

SQL> select * from prabhas.dept;

    DEPTNO DNAME          LOC
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK
        20 RESEARCH       DALLAS
        30 SALES          CHICAGO
        40 OPERATIONS     BOSTON
____________________________________________________________
Indexes
------------------------------------------------------------
SQL> create index emp_index on emp(UPPER(ename));

Index created.
SQL> select ename,job from emp where ename like 'K%___';

ENAME      JOB
---------- ---------
KING       PRESIDENT

SQL> create table emp2(empno number(6) PRIMARY KEY USING INDEX(CREATE INDEX emp_idx ON emp2(empno)),ename varchar2(20),job varchar2(20));

Table created.

SQL> select index_name,table_name from user_indexes where table_name='EMP2';

INDEX_NAME                     TABLE_NAME
------------------------------ ------------------------------
EMP_IDX                        EMP2

SQL> create table emp3(empno number(6) primary key,ename varchar2(20),job varchar2(10));

Table created.

SQL> select index_name,table_name from user_indexes where table_name='EMP';

INDEX_NAME                     TABLE_NAME
------------------------------ ------------------------------
PK_EMP                         EMP
EMP_INDEX                      EMP

SQL> select index_name,table_name from user_indexes;

INDEX_NAME                     TABLE_NAME
------------------------------ ------------------------------
PK_EMP                         EMP
EMP_INDEX                      EMP
PK_DEPT                        DEPT
SYS_C004152                    EMP3
EMP_IDX                        EMP2

SQL> select table_name, index_name, column_name from user_ind_columns where
  2  table_name='EMP';

TABLE_NAME                     INDEX_NAME
------------------------------ ------------------------------
COLUMN_NAME
--------------------------------------------------------------------------------
EMP                            PK_EMP
EMPNO

EMP                            EMP_INDEX
SYS_NC00009$


SQL> drop index emp_index;

Index dropped.
_________________________________________
SEQUENCES
-----------------------------------------
SQL> create sequence my_seq start with 10 increment by 10 maxvalue 100 nocache;

Sequence created.

SQL> select my_seq.nextval from dual;

   NEXTVAL
----------
        10

SQL> select my_seq.currval from dual;

   CURRVAL
----------
        10

SQL> create table dept1(deptno number(6),dname varchar2(20),loc varchar2(10));

Table created.

SQL> insert into dept1 values(my_seq.nextval,'Packing','Chennai');

1 row created.

SQL> insert into dept1 values(my_seq.nextval,'Testing','Banglore');

1 row created.

SQL> select * from dept1;

    DEPTNO DNAME                LOC
---------- -------------------- ----------
        20 Packing              Chennai
        30 Testing              Banglore

SQL> drop sequence my_seq;

Sequence dropped.
