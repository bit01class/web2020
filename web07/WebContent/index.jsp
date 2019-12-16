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
	String sql="select num,sub,id,nalja,num_lev from bbs02 "
			+"order by num_ref desc, num_no asc";

	ArrayList<Bbs02Bean> list=new ArrayList<Bbs02Bean>();

	try{
		conn=getConnection();
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

<a href="add.jsp">[입 력]</a>
</body>
</html>














