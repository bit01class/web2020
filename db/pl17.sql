create or replace procedure pro17
(v_empno emp.empno%type)
is
	v_ename emp.ename%type;
	num number;
begin
	select ename into v_ename from emp where empno=v_empno;
	num :=sql%ROWCOUNT;
	dbms_output.put_line(v_ename);
	dbms_output.put_line('실행갯수:'||num);

exception
	when NO_DATA_FOUND then
		dbms_output.put_line('데이터 없음');	
	when ZERO_DIVIDE then
		dbms_output.put_line('0으로 나눌때');
	when TOO_MANY_ROWS then
		dbms_output.put_line('로우가 너무 많을 때');
	when VALUE_ERROR then
		dbms_output.put_line('값이 잘못됐음');
	when others then
		dbms_output.put_line('기타 에러');	
end;
/