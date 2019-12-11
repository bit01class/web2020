create or replace procedure pro17
(v_empno emp.empno%type)
is
	v_ename emp.ename%type;
	num number;
begin
	select ename into v_ename from emp where empno=v_empno;
	num :=sql%ROWCOUNT;
	dbms_output.put_line(v_ename);
	dbms_output.put_line('���హ��:'||num);

exception
	when NO_DATA_FOUND then
		dbms_output.put_line('������ ����');	
	when ZERO_DIVIDE then
		dbms_output.put_line('0���� ������');
	when TOO_MANY_ROWS then
		dbms_output.put_line('�ο찡 �ʹ� ���� ��');
	when VALUE_ERROR then
		dbms_output.put_line('���� �߸�����');
	when others then
		dbms_output.put_line('��Ÿ ����');	
end;
/