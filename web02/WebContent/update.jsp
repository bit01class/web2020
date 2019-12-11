<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.Properties" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="refresh" content="1; url=http://192.168.3.23:8080/web02/list.jsp">
<title>Insert title here</title>
</head>
<body>
	<%
	String param1=request.getParameter("num");
	String param2=request.getParameter("kor");
	String param3=request.getParameter("eng");
	String param4=request.getParameter("math");
	
	int num=Integer.parseInt(param1);
	int kor=Integer.parseInt(param2);
	int eng=Integer.parseInt(param3);
	int math=Integer.parseInt(param4);
	
	String sql="update stu01 set kor="+kor+",eng="+eng
							+",math="+math+" where num="+num;
	
	String url="jdbc:oracle:thin:@192.168.3.23:1521:xe";
	String driver="oracle.jdbc.driver.OracleDriver";
	String user="scott";
	String password="tiger";
	
	Properties info=new Properties();
	info.setProperty("user",user);
	info.setProperty("password", password);
	
	Connection conn=null;
	Statement stmt=null;
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,info);
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
	}finally{
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	%>
</body>
</html>





















