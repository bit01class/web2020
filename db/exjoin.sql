create table temp01(
	idx number,
	name varchar2(5),
	num number
);
create table temp02(
	num number,
	sub varchar2(5)
);
-- dummy
insert into temp01 values (1,'aaaa',1111);
insert into temp01 values (2,'bbbb',2222);
insert into temp01 values (3,'cccc',3333);
insert into temp01 values (4,'dddd',4444);

insert into temp02 values (1111,'test1');
insert into temp02 values (2222,'test2');
insert into temp02 values (5555,'test5');
commit;