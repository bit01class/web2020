drop table temp02;
create table temp02(
	-- primary key = unique , not null , index,
	--	레코드 식별자 부여,(오라클) 하나의테이블에 유일
	num number primary key,
	-- not null = null값 불가
	name varchar2(10) not null,
	-- unique = 컬럼의 중복값 불가,null은 허용
	cnt number unique
);