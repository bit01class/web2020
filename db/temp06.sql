drop table temp06;
create table temp06(
	num number primary key,
	name varchar2(10),
	age number(3),
	gender char(1) check(gender in('m','f')),
	constraint temp06_age_ck check(age between 1 and 85)
);