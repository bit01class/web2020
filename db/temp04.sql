drop table temp05;
drop table temp04;
-- 부모테이블
create table temp04(
	num number primary key,
	name varchar2(10),
	id number unique
);
-- dummy
insert into temp04 values (1,'test1',1111);
insert into temp04 values (2,'test2',2222);
insert into temp04 values (3,'test3',3333);
-- 자식테이블
create table temp05(
	num number primary key,
	id number,
	sub varchar2(10),
	constraint temp05_id_fk foreign key(id)  references temp04(id)
);
-- dummy
insert into temp05 values (1,1111,'sub1');
insert into temp05 values (2,3333,'sub2');
insert into temp05 values (3,1111,'sub3');
insert into temp05 values (4,2222,'sub4');






