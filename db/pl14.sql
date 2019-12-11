declare
	v_empno emp.empno%type;
	v_ename emp.ename%type;
	row_emp emp%rowtype;
	cur2 sys_refcursor;
begin
	open cur2 for select * from emp;
	loop 
	fetch cur2 into row_emp;
	dbms_output.put_line(row_emp.empno||'  '||row_emp.ename);
	if(cur2%notfound) then
		exit;
	end if;
	end loop;
	close cur2; --커서 닫기
end;
/