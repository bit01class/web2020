create or replace procedure stu01_add
(kor stu01.kor%type, eng stu01.eng%type, math stu01.math%type)
is
begin
	insert into stu01 values (stu01_seq.nextval,kor,eng,math);
	commit;
end;
/