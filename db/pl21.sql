create or replace trigger tri02
before insert on dept
begin
	dbms_output.put_line('�Է��� �Ͼ ���Դϴ�');
end;
/