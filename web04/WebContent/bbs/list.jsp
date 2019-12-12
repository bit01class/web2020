<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu.jsp" %>
<h1>목 록</h1>
<table width="85%" align="center" border="1" cellspacing="0">
	<tr>
		<th width="10%">글번호</th>
		<th width="60%">제목</th>
		<th width="20%">글쓴이</th>
		<th>조회수</th>
	</tr>
	<%@ page import="com.bit.oracle.BitOracle" %>
	<%@ page import="java.sql.*" %>
	<%
	String sql="SELECT * FROM BBS01 ORDER BY NUM DESC";
	Statement stmt=null;
	ResultSet rs=null;
	try{
	
	stmt=BitOracle.getConnection().createStatement();
	rs=stmt.executeQuery(sql);
	
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getInt("num") %></td>
		<td><a href="detail.jsp?idx=<%=rs.getInt("num") %>"><%=rs.getString("sub") %></a></td>
		<td><%=rs.getString("id") %></td>
		<td><%=rs.getInt("cnt") %></td>
	</tr>
	<%
	} 
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(BitOracle.getConnection()!=null)
			BitOracle.getConnection().close();
	}
	%>
</table>
<center>
	<a href="add.jsp">[입 력]</a>
</center>
<%@ include file="../template/footer.jsp" %>
</body>
</html>

















