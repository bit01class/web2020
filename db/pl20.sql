create or replace trigger tri01
after insert on dept
begin
	dbms_output.put_line('입력이 일어났습니다');
end;
/