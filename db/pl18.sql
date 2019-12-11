create or replace procedure pro18(cnt out number)
is
	row_dept dept%rowtype;
	cursor v_cursor is (select * from dept);
begin
	open v_cursor;
	
	loop
	fetch v_cursor into row_dept;
	cnt :=v_cursor%rowcount;
	exit when v_cursor%notfound;
	dbms_output.put_line(row_dept.dname);

	end loop;
	close v_cursor;
end;
/