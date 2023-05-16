declare
v_id number(6):=&empno;
v_sal emp.sal%type;
v_name emp.ename%type;
v_job emp.job%type;
begin
select ename,sal into v_name, v_sal from emp where empno=v_id;
DBMS_OUTPUT.PUT_LINE(v_name||'''s sal is '||v_sal);
select job into v_job from emp where ename=v_name;
DBMS_OUTPUT.PUT_LINE(v_name||'''s job is '||v_job);
EXCEPTION
when no_data_found then
DBMS_OUTPUT.PUT_LINE('No employee with ID:'||v_id);
when too_many_rows then
DBMS_OUTPUT.PUT_LINE('Many emp with Name:'||v_name);
when others then
DBMS_OUTPUT.PUT_LINE('Some other error occured');
end;
/
