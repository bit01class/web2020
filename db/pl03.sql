declare
	v_num temp04.num%type;
	v_subject temp04.subject%type;
	v_content temp04.content%type;
begin
	select num,subject,content 
		into v_num,v_subject,v_content  
	from temp04 where num=11;
	dbms_output.put_line('num='||v_num);
	dbms_output.put_line('subject='||v_subject);
	dbms_output.put_line('content='||v_content);	
end;
/