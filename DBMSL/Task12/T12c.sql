create or replace function sa(t number) return number is 
tow number;
BEGIN
select sum(sal) into tow from emp where deptno=t;
return tow;
END;
/
DECLARE
p number:=&department_id;
tow number;
BEGIN 
DBMS_OUTPUT.PUT_LINE('Total salary in Department '||p||' is '||sa(p));
END;
/