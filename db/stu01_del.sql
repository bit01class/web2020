create or replace procedure stu01_del
(v_num stu01.num%type)
is
begin
	delete from stu01 where num=v_num;
	commit;
end;
/