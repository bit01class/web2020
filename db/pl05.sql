declare
	v_avg number;
	sabun emp.empno%type;
	v_sal emp.sal%type;
begin
	sabun :=7698; --7788; --7369;
	select avg(sal) into v_avg from emp;
	select sal into v_sal from emp where empno=sabun;

	if(v_sal<v_avg) then
		dbms_output.put_line('그만 두세요');
	elsif(v_sal<3000) then
		dbms_output.put_line('그냥 버티세요');
	else
		dbms_output.put_line('측근입니다');
	end if;
end;
/