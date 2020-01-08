drop table emp02;
drop table dept02;
--
create table dept02(
	deptno number primary key,
	dname varchar2(15),
	loc varchar2(15)
);
create sequence dept02_seq;
--
create table emp02(
	sabun number primary key,
	name varchar2(15),
	nalja date,
	deptno number constraint emp02_deptno_fk references dept02(deptno) 
);
create sequence emp02_seq start with 1000;
-- dummy
insert into dept02 values (dept02_seq.nextval,'¿µ¾÷','¼­¿ï');
insert into dept02 values (dept02_seq.nextval,'È¸°è','¼­¿ï');
insert into dept02 values (dept02_seq.nextval,'»ı»ê','ºÎ»ê');
insert into dept02 values (dept02_seq.nextval,'¸¶ÄÉÆÃ','´ëÀü');
commit;

insert into emp02 values (emp02_seq.nextval,'¹Ú¿µ¼ö',sysdate,3);
insert into emp02 values (emp02_seq.nextval,'±èÃ¶¼ö',sysdate,2);
insert into emp02 values (emp02_seq.nextval,'±è¸»¶Ë',sysdate,3);
insert into emp02 values (emp02_seq.nextval,'±è°³¶Ë',sysdate,3);
insert into emp02 values (emp02_seq.nextval,'ÃÖÃáÀÚ',sysdate,1);
commit;

select * from emp02;
select * from dept02;







