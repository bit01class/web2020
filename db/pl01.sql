set serveroutput on;
-- 한줄주석
/* 
	여러줄 주석
	다중 주석
*/
declare
	-- 선언부
	num number := 4321;
	msg varchar2(15) :='출력';
begin
	-- 실행부 main()
	num :=1234/3;
	-- System.out.println();
	dbms_output.put_line(msg||num);
end;
/