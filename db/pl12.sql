declare
	row_emp emp%rowtype;
	cursor cur1 is (select * from emp);
begin
	for row_emp in cur1 loop
		dbms_output.put_line(row_emp.empno||' '||row_emp.ename);
		dbms_output.put_line(cur1%rowcount);
	end loop;
end;
/