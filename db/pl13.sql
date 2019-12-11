declare
	v_empno emp.empno%type;
	v_ename emp.ename%type;
	cursor cur2 is (select empno,ename from emp);
begin
	open cur2;
	loop
		fetch cur2 into v_empno,v_ename;
		dbms_output.put_line(v_empno||'  '||v_ename);
		if(cur2%notFOUND) then
			exit;
		end if;
		dbms_output.put_line(cur2%ROWCOUNT);
		if(cur2%ISOPEN) then
			dbms_output.put_line('open');
		end if;
	end loop;

	close cur2; --커서 닫기
end;
/