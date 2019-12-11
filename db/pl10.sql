-- array type
declare
	v_ename emp.ename%type;
	type arr_ename is table of emp.empno%type index by binary_integer;
	v_enames arr_ename;
begin
	v_enames(0) := 7369;
	v_enames(1) := 7499;
	v_enames(2) := 7521;

	for i in 0..2 loop
		select ename into v_ename from emp where empno=v_enames(i);
		dbms_output.put_line(v_ename);
	end loop;
end;
/