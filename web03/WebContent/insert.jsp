<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%! 
public String paramCheck(String msg){
	msg=msg.replace("<", "&lt;");
	msg=msg.replace(">", "&gt;");
	return msg;
} 
%>
<%@ page import="java.sql.*" %>
<%
String sub=request.getParameter("sub").trim();
String id=request.getParameter("id");
String content=request.getParameter("content");

sub=paramCheck(sub);
id=paramCheck(id);
content=paramCheck(content);

String sql="insert into bbs01 values (bbs01_seq.nextval,'"
			+sub+"','"+id+"','"+content+"',sysdate,0)";
//System.out.println(sql);
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
	stmt.executeUpdate(sql);
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
response.sendRedirect("list.jsp");
%>
</body>
</html>













