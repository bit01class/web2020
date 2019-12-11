create or replace function func01 (v_name emp.ename%type)
return number 			-- 주의 ; 없음
is
	cnt number;
	v_name2 emp.ename%type;
begin
	v_name2 := '%'||v_name||'%';
	select count(empno) into cnt from emp 
			where ename like upper(v_name2);
	return cnt;
end;
/