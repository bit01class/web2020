<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="com.bit.web05.*,java.sql.*" %>
	<%!
		Connection conn;
		Statement stmt;
		ResultSet rs;
	%>
	<%
	Object obj=session.getAttribute("login");
	if(obj==null)response.sendRedirect("/web05/");
	
	int num=Integer.parseInt(request.getParameter("num"));
	Bbs01userBean bean=(Bbs01userBean)obj;
	String loginID=bean.getId();
	
	String sql="select count(*) from bbs01 where num="+num;
	sql+=" and id='"+loginID+"'";
	
	try{
		conn=MyOracle.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		if(rs.next()){
			if(rs.getInt(1)==0){
				response.sendRedirect("/web05/");
			}
		}
		if("POST".equals(request.getMethod())){
			sql="delete from bbs01 where num="+num;
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
			response.sendRedirect("/web05/");			
		}
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	%>
	<h1>삭제 페이지</h1>
	<form method="post">
	<p><%=num %>번 글을 삭제하시겠습니까?</p>
	<input type="hidden" name="num" value="<%=num %>">
	<input type="submit" value="확 인">
	</form>
</body>
</html>










