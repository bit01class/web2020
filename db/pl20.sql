create or replace trigger tri01
after insert on dept
begin
	dbms_output.put_line('�Է��� �Ͼ���ϴ�');
end;
/