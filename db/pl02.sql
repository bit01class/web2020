declare
	num dept.deptno%type :=12;
begin
	-- num++;
	num :=num+1;
	-- insert into temp04 values (11,'test1','test');
	dbms_output.put_line('입력완료');
end;
/