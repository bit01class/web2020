create or replace procedure pro03
(a in number, b out number)
is

begin
	b:=a*10;
	dbms_output.put_line('push..');
end;
/