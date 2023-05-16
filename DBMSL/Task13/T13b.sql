DECLARE
v_dept number:=&deptno;
e_nodept exception;
BEGIN
update emp set sal=sal+1050 where deptno=v_dept;
IF SQL%notfound then
 raise e_nodept;
ELSE
 DBMS_OUTPUT.PUT_LINE(SQL%rowcount||' rows updated');
END IF; 
EXCEPTION
when e_nodept then 
DBMS_OUTPUT.PUT_LINE('No Department with ID:'||v_dept);
END;
/