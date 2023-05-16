SQL> CREATE TABLE STUDENTS(ROLLNO NUMBER(10),NAME VARCHAR2(20));

Table created.

SQL> INSERT INTO STUDENTS VALUES(&ROLLNO,'&NAME');
Enter value for rollno: 25
Enter value for name: PRABHAS
old   1: INSERT INTO STUDENTS VALUES(&ROLLNO,'&NAME')
new   1: INSERT INTO STUDENTS VALUES(25,'PRABHAS')

1 row created.

SQL> /
Enter value for rollno: 47
Enter value for name: VIKRAM
old   1: INSERT INTO STUDENTS VALUES(&ROLLNO,'&NAME')
new   1: INSERT INTO STUDENTS VALUES(47,'VIKRAM')

1 row created.

SQL> /
Enter value for rollno: 46
Enter value for name: ARAFATH
old   1: INSERT INTO STUDENTS VALUES(&ROLLNO,'&NAME')
new   1: INSERT INTO STUDENTS VALUES(46,'ARAFATH')

1 row created.

SQL> INSERT INTO STUDENTS VALUES(4,'PRIYA');

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM STUDENTS;

    ROLLNO NAME
---------- --------------------
        25 PRABHAS
        47 VIKRAM
        46 ARAFATH
         4 PRIYA

SQL> UPDATE STUDENTS SET NAME = 'KIRTHI' WHERE ROLLNO=5;

0 rows updated.

SQL> UPDATE STUDENTS SET NAME = 'KIRTHI' WHERE ROLLNO=4;

1 row updated.

SQL> SELECT * FROM STUDENTS;

    ROLLNO NAME
---------- --------------------
        25 PRABHAS
        47 VIKRAM
        46 ARAFATH
         4 KIRTHI

SQL> SAVEPOINT A;

Savepoint created.

SQL> INSERT INTO STUDENTS VALUES(5,'RIYA');

1 row created.

SQL> SAVEPOINT B;

Savepoint created.

SQL> INSERT INTO STUDENTS VALUES(7,'VENKY');

1 row created.

SQL> SAVEPOINT C;

Savepoint created.

SQL> SELECT * FROM STUDENTS;

    ROLLNO NAME
---------- --------------------
        25 PRABHAS
        47 VIKRAM
        46 ARAFATH
         4 KIRTHI
         5 RIYA
         7 VENKY

6 rows selected.

SQL> ROLLBACK B;
ROLLBACK B
         *
ERROR at line 1:
ORA-02181: invalid option to ROLLBACK WORK


SQL> ROLLBACK B
  2  ROLLBACK TO B;
ROLLBACK B
         *
ERROR at line 1:
ORA-02181: invalid option to ROLLBACK WORK


SQL> ROLLBACK TO B;

Rollback complete.

SQL> SELECT * FROM STUDENTS;

    ROLLNO NAME
---------- --------------------
        25 PRABHAS
        47 VIKRAM
        46 ARAFATH
         4 KIRTHI
         5 RIYA

SQL> ROLLBACK TO A;

Rollback complete.

SQL> SELECT * FROM STUDENTS;

    ROLLNO NAME
---------- --------------------
        25 PRABHAS
        47 VIKRAM
        46 ARAFATH
         4 KIRTHI

SQL> ROLLBACK;

Rollback complete.

SQL> SELECT * FROM STUDENTS;

    ROLLNO NAME
---------- --------------------
        25 PRABHAS
        47 VIKRAM
        46 ARAFATH
         4 PRIYA

SQL> DELETE FROM STUDENTS WHERE ROLLNO=47;

1 row deleted.

SQL> SELECT * FROM STUDENTS;

    ROLLNO NAME
---------- --------------------
        25 PRABHAS
        46 ARAFATH
         4 PRIYA

SQL> ROLLBACK;

Rollback complete.

SQL> SELECT * FROM STUDENTS;

    ROLLNO NAME
---------- --------------------
        25 PRABHAS
        47 VIKRAM
        46 ARAFATH
         4 PRIYA

SQL> TRUNCATE TABLE STUDENTS;

Table truncated.

SQL> SELECT * FROM STUDENTS;

no rows selected

SQL> ROLLBACK;

Rollback complete.

SQL> SELECT * FROM STUDENTS;

no rows selected