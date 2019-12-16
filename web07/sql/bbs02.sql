drop table bbs02;
drop sequence bbs02_seq;
create table bbs02(
	num number,
	id varchar2(10),
	sub varchar2(10),
	content varchar2(2000),
	nalja date,
	num_ref number,
	num_no number default 0,
	num_lev number default 0
);
create sequence bbs02_seq;
-- dummy
insert into bbs02 (num,id,sub,content,nalja,num_ref) 
	values (bbs02_seq.nextval,'guest','test1','test',sysdate,bbs02_seq.currval);
insert into bbs02 (num,id,sub,content,nalja,num_ref) 
	values (bbs02_seq.nextval,'guest','test2','test',sysdate,bbs02_seq.currval);
insert into bbs02 (num,id,sub,content,nalja,num_ref) 
	values (bbs02_seq.nextval,'guest','test3','test',sysdate,bbs02_seq.currval);
insert into bbs02 (num,id,sub,content,nalja,num_ref) 
	values (bbs02_seq.nextval,'guest','test4','test',sysdate,bbs02_seq.currval);
commit;
















