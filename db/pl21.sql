create or replace trigger tri02
before insert on dept
begin
	dbms_output.put_line('입력이 일어날 것입니다');
end;
/