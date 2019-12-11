create or replace procedure stu01_num
(cur out sys_refcursor)
is
 
begin
	open cur for select num from stu01 order by num;
end;
/