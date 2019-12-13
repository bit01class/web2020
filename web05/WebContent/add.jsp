<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*,com.bit.web05.*" %>
<%!
	Connection conn;
	Statement stmt;
%>
<%
Object obj=session.getAttribute("login");
	if(obj==null){
		response.sendRedirect("login.jsp");
	}else if(request.getMethod().equals("POST")){
		String sub=request.getParameter("sub");
		String content=request.getParameter("content");
		String id=((Bbs01userBean)obj).getId();
		String sql="insert into bbs01 values (bbs01_seq.nextval,'";
		sql+=sub+"','"+id+"','"+content+"',sysdate,0)";
		System.out.println(sql);
		try{
			conn=MyOracle.getConnection();
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
			response.sendRedirect("/web05/");
		}finally{
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>입력페이지</h1>
	<form method="post">
	<p>제목:<input type="text" name="sub"></p>
	<textarea rows="5" cols="50" name="content"></textarea>
	<br><input type="submit" value="입 력">
	</form>
</body>
</html>
















