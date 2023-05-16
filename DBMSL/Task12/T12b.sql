create or replace procedure proc_dml (p_id emp.empno%type, p_sal number,p_case 
number) is
BEGIN
case p_case 
when 1 then 
 DBMS_OUTPUT.PUT_LINE('Insertion...');
insert into emp(empno,ename,hiredate,job) 
values(p_id,'Franco','12-JAN-02','ST_CLERK');
when 2 then 
DBMS_OUTPUT.PUT_LINE('Deletion...');
delete from emp where empno=p_id;
when 3 then 
DBMS_OUTPUT.PUT_LINE('Updation...');
update emp set sal=p_sal where empno=p_id;
end case;
DBMS_OUTPUT.PUT_LINE('DML operation performed on '||SQL%rowcount||' rows');
END;
/
DECLARE
v_id emp.empno%type:=&id;
v_sal emp.sal%type:=&sal;
v_case number:=&case1or2or3;
begin
proc_dml(v_id,v_sal,v_case);
END;
/