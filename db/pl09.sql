-- array type
declare
	v_ename emp.ename%type;
	type arr_ename is table of emp.ename%type index by binary_integer;
	v_enames arr_ename;
begin
	select ename into v_ename from emp where empno=7369;
	v_enames(0) := v_ename;
	select ename into v_ename from emp where empno=7499;
	v_enames(1) := v_ename;
	select ename into v_ename from emp where empno=7521;
	v_enames(2) := v_ename;

	dbms_output.put_line(v_enames(0));
	dbms_output.put_line(v_enames(1));
	dbms_output.put_line(v_enames(2));
end;
/