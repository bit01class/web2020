declare
	num number :=0;
	msg varchar2(10) :='*';
begin
	loop
		dbms_output.put_line(msg);
		msg:=msg||'*';
		if(num=5) then
			exit;
		end if;
		num := num+1;
	end loop;
end;
/