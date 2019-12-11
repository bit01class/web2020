<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
	String param1=request.getParameter("num");
	String param2=request.getParameter("sub");
	String param3=request.getParameter("content");
	
	int num=0;
	try{
		num=Integer.parseInt(param1);
	}catch(NumberFormatException e){
		out.println("<h1>ERROR</h1>");
		out.println("<p>누구냐 넌!</p>");
		return;
	}
	
	String sub=param2.trim();
	if(sub.equals("")){
		response.sendRedirect("edit.jsp?idx="+param1);
		return;
	}
	
	String content=param3.trim();
	
	String sql="update bbs01 set sub='"
				+sub+"',content='"+content+"' where num="+num;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="scott";
	String password="tiger";
	
	Connection conn=null;
	Statement stmt=null;
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
		stmt=conn.createStatement();
		int result=stmt.executeUpdate(sql);
		if(result>0)
			response.sendRedirect("detail.jsp?idx="+num);
		else
			response.sendRedirect("edit.jsp?idx="+num);
	}finally{
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
%>
</body>
</html>


























