create or replace package body p1 is
procedure t1(id number,choice number) is
n varchar2(20);
tm number;
BEGIN
case choice 
when 1 then 
DBMS_OUTPUT.PUT_LINE('Insertion...');
insert into students values(id,'Franco',90);
when 2 then 
DBMS_OUTPUT.PUT_LINE('Deletion...');
delete from students where rollno=id;
when 3 then 
DBMS_OUTPUT.PUT_LINE('Updation...');
update students set TOTAL=TOTAL+1 where rollno=id;
when 4 then
select SNAME,TOTAL into n,tm from students where rollno=id;
DBMS_OUTPUT.PUT_LINE('Total marks of '||n||' is '||tm);
end case;
DBMS_OUTPUT.PUT_LINE('DML operation performed on '||SQL%rowcount||' rows');
END t1;
END p1;
/
BEGIN
p1.t1(&StudentID,&choice1or2or3or4);
END;
/