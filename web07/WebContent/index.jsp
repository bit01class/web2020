<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="conn.jspf" %>
<%
	int p=1;
	int pcnt=10;
	int total=0;
	String param1=request.getParameter("page");
	String param2=request.getParameter("pcnt");
	
	if(param1!=null)p=Integer.parseInt(param1);
	if(param2!=null)pcnt=Integer.parseInt(param2);
	
	int pstart=pcnt*(p-1)+1;
	int pend=pstart+(pcnt-1);
	String sql="select * from (select rownum as rn,num,sub,id,nalja ";
	sql+=",num_lev from (select num,sub,id,nalja,num_lev from bbs02 ";
	sql+=" order by num_ref desc, num_no desc)) ";
	sql+=" where rn between "+pstart+" and "+pend;

	ArrayList<Bbs02Bean> list=new ArrayList<Bbs02Bean>();

	try{
		conn=getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery("select count(*) from bbs02");
		if(rs.next())total=rs.getInt(1);
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		while(rs.next()){
			Bbs02Bean bean=new Bbs02Bean();
			bean.setNum(rs.getInt("num"));
			bean.setSub(rs.getString("sub"));
			bean.setId(rs.getString("id"));
			bean.setNalja(rs.getDate("nalja"));
			bean.setNum_lev(rs.getInt("num_lev"));
			list.add(bean);
		}
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
%>
<form>
	<select name="pcnt">
		<option value="5" <%
		if(pcnt==5)out.print(" selected=\"selected\"");
		%>>5개씩</option>
		<option value="10"<%
		if(pcnt==10)out.print(" selected=\"selected\"");
		%>>10개씩</option>
		<option value="15"<%
		if(pcnt==15)out.print(" selected=\"selected\"");
		%>>15개씩</option>
		<option value="20"<%
		if(pcnt==20)out.print(" selected=\"selected\"");
		%>>20개씩</option>
	</select>
	<input type="submit" value="보기">
</form>
<table width="400" border="1">
	<tr>
		<th width="80">글번호</th>
		<th>제목</th>
		<th width="80">글쓴이</th>
		<th width="80">날짜</th>
	</tr>
	<%
	for(int i=0; i<list.size(); i++){
		Bbs02Bean bean=list.get(i);
	%>
	<tr>
		<td><%=bean.getNum() %></td>
		<td><a href="detail.jsp?num=<%=bean.getNum() %>"><%
		for(int j=0; j<bean.getNum_lev(); j++){
			out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
		}
		if(bean.getNum_lev()!=0)out.print("└");
		out.print(bean.getSub()); 
		%></a></td>
		<td><%=bean.getId() %></td>
		<td><%=bean.getNalja() %></td>
	</tr>
	<%} %>
</table>
<br>
<%
//1-1/5
//2-1/5
//3-1/5
//4-1/5
//5-1/5
//6-1)/5
//7-1)/5
//8-1)/5
//9-1)/5
//10-1)/5
// (p-1)/5+1

// 1~5		1((1-1)*5+1)
// 6~10		6((2-1)*5+1)
// 11~15	11((3-1)*5+1)
// 16~20	16((4-1)*5+1)
// 16~20	16(((p-1)/5+1-1)*5+1)
int gap=5;
int start=(p-1)/gap*gap+1;
int end=start+(gap-1);//(total-1)/pcnt+1;
if(end>(total-1)/pcnt+1)end=(total-1)/pcnt+1;
if(start!=1)out.print("<a href=\"index.jsp?page="+(start-1)+"&pcnt="+pcnt+"\">[이전]</a>");
else out.print("<a>[이전]</a>");

for(int i=start; i<=end; i++){
	String msg2="";
	if(p!=i)msg2="href=\"index.jsp?page="+i+"&pcnt="+pcnt+"\"";
%>
	<a <%=msg2 %>>[<%=i %>]</a>	
<%
} 
String msg="";
if(end<(total-1)/pcnt+1){
	msg="href=\"index.jsp?page="+(end+1)+"&pcnt="+pcnt+"\"";
}
%>
<a <%=msg %>>[다음]</a>
<br>
<br>
<br>
<a href="add.jsp">[입 력]</a>
</body>
</html>














