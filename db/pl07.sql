declare
begin
	for i in REVERSE 1..5 loop
		dbms_output.put_line('print...'||i);
	end loop;
end;
/