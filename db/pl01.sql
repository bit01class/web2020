set serveroutput on;
-- �����ּ�
/* 
	������ �ּ�
	���� �ּ�
*/
declare
	-- �����
	num number := 4321;
	msg varchar2(15) :='���';
begin
	-- ����� main()
	num :=1234/3;
	-- System.out.println();
	dbms_output.put_line(msg||num);
end;
/