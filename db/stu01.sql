create table stu01(
	num number primary key,
	kor number(3) not null,
	eng number(3) not null,
	math number(3) not null
);

create sequence stu01_seq;

-- dummy
insert into stu01 values(stu01_seq.nextval,10,20,30);
insert into stu01 values(stu01_seq.nextval,91,74,31);
insert into stu01 values(stu01_seq.nextval,82,63,65);
insert into stu01 values(stu01_seq.nextval,73,82,45);
commit;
