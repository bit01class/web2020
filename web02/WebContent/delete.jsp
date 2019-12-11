<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ page import="java.util.Properties" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="refresh" content="3; url=http://localhost:8080/web02/list.jsp">
<title>Insert title here</title>
</head>
<body>
	<%
	int result=0;
	String method=request.getMethod();
	if(method.equals("POST")){
		String param=request.getParameter("num");
		int num=Integer.parseInt(param);
		
		String sql="delete from stu01 where num="+num;
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@192.168.3.23:1521:xe";
		String user="scott";
		String password="tiger";
		
		Properties info=new Properties();
		info.setProperty("user", user);
		info.setProperty("password", password);
		
		Connection conn=null;
		Statement stmt=null;
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url, info);
			stmt=conn.createStatement();
			result=stmt.executeUpdate(sql);
		}finally{
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
	}
	if(result>0)out.print("<h1>삭제완료</h1>");
	else out.print("<h1>삭제실패</h1>");
	%>
</body>
</html>







