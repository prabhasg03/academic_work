
SQL> select concat(empno,ename) from emp;

CONCAT(EMPNO,ENAME)
--------------------------------------------------
7839KING
7698BLAKE
7782CLARK
7566JONES
7788SCOTT
7902FORD
7369SMITH
7499ALLEN
7521WARD
7654MARTIN
7844TURNER

CONCAT(EMPNO,ENAME)
--------------------------------------------------
7876ADAMS
7900JAMES
7934MILLER

14 rows selected.

SQL> select upper(substr(ename,0,length(ename)/2))||lower(substr(ename,length(ename)/2 +1,length(ename))) from emp;

UPPER(SUBSTR(ENAME,0,LENGTH(ENAME)/2))||LOWER(SUBSTR(ENAME,LENGTH(ENAME)/2+1,LEN
--------------------------------------------------------------------------------
KIng
BLake
CLark
JOnes
SCott
FOrd
SMith
ALlen
WArd
MARtin
TURner

UPPER(SUBSTR(ENAME,0,LENGTH(ENAME)/2))||LOWER(SUBSTR(ENAME,LENGTH(ENAME)/2+1,LEN
--------------------------------------------------------------------------------
ADams
JAmes
MILler

14 rows selected.

SQL> select to_char(to_date(HIREDATE),'MONTH') from emp;

TO_CHAR(TO_DATE(HIREDATE),'MONTH')
------------------------------------
NOVEMBER
MAY
JUNE
APRIL
APRIL
DECEMBER
DECEMBER
FEBRUARY
FEBRUARY
SEPTEMBER
SEPTEMBER

TO_CHAR(TO_DATE(HIREDATE),'MONTH')
------------------------------------
MAY
DECEMBER
JANUARY

14 rows selected.

SQL> select to_char(to_date('14-jul-09'),'MONTH') from dual;

TO_CHAR(TO_DATE('14-JUL-09'),'MONTH'
------------------------------------
JULY

SQL> select to_char(to_date(HIREDATE),'DD-MONTH-YYYY') from emp;

TO_CHAR(TO_DATE(HIREDATE),'DD-MONTH-YYYY')
--------------------------------------------
17-NOVEMBER -1981
01-MAY      -1981
09-JUNE     -1981
02-APRIL    -1981
19-APRIL    -1987
03-DECEMBER -1981
17-DECEMBER -1980
20-FEBRUARY -1981
22-FEBRUARY -1981
28-SEPTEMBER-1981
08-SEPTEMBER-1981

TO_CHAR(TO_DATE(HIREDATE),'DD-MONTH-YYYY')
--------------------------------------------
23-MAY      -1987
03-DECEMBER -1981
23-JANUARY  -1982

14 rows selected.

SQL> select ADD_MONTHS(to_date(HIREDATE),2) from emp;

ADD_MONTH
---------
17-JAN-82
01-JUL-81
09-AUG-81
02-JUN-81
19-JUN-87
03-FEB-82
17-FEB-81
20-APR-81
22-APR-81
28-NOV-81
08-NOV-81

ADD_MONTH
---------
23-JUL-87
03-FEB-82
23-MAR-82

14 rows selected.

SQL> SELECT LAST_DAY('05-OCT-09') FROM DUAL;

LAST_DAY(
---------
31-OCT-09

SQL> select round(HIREDATE,'dd'),round(HIREDATE,'month'),round(HIREDATE,'year') from emp;

ROUND(HIR ROUND(HIR ROUND(HIR
--------- --------- ---------
17-NOV-81 01-DEC-81 01-JAN-82
01-MAY-81 01-MAY-81 01-JAN-81
09-JUN-81 01-JUN-81 01-JAN-81
02-APR-81 01-APR-81 01-JAN-81
19-APR-87 01-MAY-87 01-JAN-87
03-DEC-81 01-DEC-81 01-JAN-82
17-DEC-80 01-JAN-81 01-JAN-81
20-FEB-81 01-MAR-81 01-JAN-81
22-FEB-81 01-MAR-81 01-JAN-81
28-SEP-81 01-OCT-81 01-JAN-82
08-SEP-81 01-SEP-81 01-JAN-82

ROUND(HIR ROUND(HIR ROUND(HIR
--------- --------- ---------
23-MAY-87 01-JUN-87 01-JAN-87
03-DEC-81 01-DEC-81 01-JAN-82
23-JAN-82 01-FEB-82 01-JAN-82

14 rows selected.

SQL> SELECT HIREDATE FROM EMP;

HIREDATE
---------
17-NOV-81
01-MAY-81
09-JUN-81
02-APR-81
19-APR-87
03-DEC-81
17-DEC-80
20-FEB-81
22-FEB-81
28-SEP-81
08-SEP-81

HIREDATE
---------
23-MAY-87
03-DEC-81
23-JAN-82

14 rows selected.


SQL> select empno,nvl(to_char(comm),'No Commission')"comm" from emp;

     EMPNO comm
---------- ----------------------------------------
      7839 No Commission
      7698 No Commission
      7782 No Commission
      7566 No Commission
      7788 No Commission
      7902 No Commission
      7369 No Commission
      7499 300
      7521 500
      7654 1400
      7844 0

     EMPNO comm
---------- ----------------------------------------
      7876 No Commission
      7900 No Commission
      7934 No Commission

14 rows selected.

SQL>