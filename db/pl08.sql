declare
	cnt number :=0;
begin
	while cnt<5 loop
		dbms_output.put_line('print...');
		cnt :=cnt+1;
	end loop; 
end;
/