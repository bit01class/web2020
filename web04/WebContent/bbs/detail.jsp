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
<h1>��������</h1>
<%@ page import="com.bit.oracle.BitOracle" %>
<%@ page import="java.sql.*" %>
<%
	int num=Integer.parseInt(request.getParameter("idx"));
	String sql="select * from bbs01 where num="+num;
	// jdk 1.7~
	// BitOracle -  implements AutoCloseable
	// overide - public void close() throws Exception
	
//	try(Connection conn=BitOracle.getConnection()){
//		Statement stmt=conn.createStatement();
//		ResultSet rs=stmt.executeQuery(sql);
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	try{
		conn=BitOracle.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		if(rs.next()){
%>
<table align="center" width="85%">
	<tr>
		<td>�۹�ȣ</td>
		<td><%=rs.getInt("num") %></td>
		<td>��¥</td>
		<td><%=rs.getDate("nalja") %></td>
	</tr>
	<tr>
		<td>�۾���</td>
		<td><%=rs.getString("id") %></td>
		<td>��ȸ��</td>
		<td><%=rs.getInt("cnt") %></td>
	</tr>
	<tr>
		<td>����</td>
		<td colspan="3"><%=rs.getString("sub") %></td>
	</tr>
	<tr>
		<td colspan="4"><%=rs.getString("content").replace("\n", "<br>") %></td>
	</tr>
	<tr>
		<td colspan="4">
			<a href="edit.jsp?idx=<%=rs.getInt("num") %>">[�� ��]</a>
			<a href="delte.jsp?idx=<%=rs.getInt("num") %>">[�� ��]</a>
		</td>
	</tr>
</table>
<%
		}
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
%>
<%@ include file="../template/footer.jsp" %>
</body>
</html>













