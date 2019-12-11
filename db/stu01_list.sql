create or replace procedure stu01_list
(cur out sys_refcursor)
is
begin
	open cur for select num||','||kor||','||eng||','||math from stu01 order by num;
end;
/