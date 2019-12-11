<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>내장객체</h1>
	<h2>out내장객체</h2>
	<%
	String msg="jsp";
	
	out.println(msg);
	
	%>
	<h2>request객체</h2>
	<%
	System.out.println(request.getRemoteAddr() );
	System.out.println(request.getMethod() );
	System.out.println(request.getRequestURI()  );
	System.out.println(request.getContextPath()  );
	System.out.println(request.getServerName() );
	System.out.println(request.getServerPort() );
	System.out.println(request.getParameter("msg2") );
	
	%>
</body>
</html>




















