create or replace procedure stu01_edit
(v_num stu01.num%type,v_kor stu01.kor%type
, v_eng stu01.eng%type, v_math stu01.math%type)
is
begin
	update stu01 set kor=v_kor
			,eng=v_eng
			,math=v_math 
		where num=v_num;
	commit;
end;
/