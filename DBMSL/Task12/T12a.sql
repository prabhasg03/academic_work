create or replace trigger t after update of ename on employees FOR EACH 
ROW
begin
DBMS_OUTPUT.PUT_LINE('Name updated from '||:OLD.ename||' to '||:NEW.ename);
END;
/