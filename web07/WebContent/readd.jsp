<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>��۾���</h1>
<%
	String param1=request.getParameter("ref");
	String param2=request.getParameter("lev");
	String param3=request.getParameter("no");
	int ref=Integer.parseInt(param1);
	int lev=Integer.parseInt(param2);
	int no=Integer.parseInt(param3);
%>
<form action="reinsert.jsp">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="lev" value="<%=lev%>">
	<input type="hidden" name="no" value="<%=no%>">
	<p>����:<input type="text" name="sub"></p>
	<p>�۾���:<input type="text" name="id"></p>
	<p><textarea name="content" rows="5" cols="50"></textarea></p>
	<input type="submit" value="�۾���">
</form>
</body>
</html>






