<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	
	//response.setContentType("text/plain; charset=EUC-KR");
	//response.setHeader("Content-Type","text/plain");
	java.io.OutputStream myout=response.getOutputStream();
	myout.write("<h1>���</h1>".getBytes());
	myout.flush();
	%>
</body>
</html>












