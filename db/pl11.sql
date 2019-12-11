declare
	row_emp emp%rowtype;
begin
	select * into row_emp from emp where empno=7369;	
	dbms_output.put_line(row_emp.empno);
	dbms_output.put_line(row_emp.ename);
	dbms_output.put_line(row_emp.sal);
end;
/