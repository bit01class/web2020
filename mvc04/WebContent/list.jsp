<%@page import="java.util.*,com.bit.model.Emp05Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>리스트페이지</h1>
	<a href="add.html">입력(업로드)</a>
	<a href="list.html">목록(다운로드)</a>
	<a href="add2.html">입력2(트랜잭션)</a>
	<a href="list.html">목록2(트랜잭션)</a>
	<%
	java.util.ArrayList<Emp05Dto> list=null;
	list=(ArrayList<Emp05Dto>)request.getAttribute("list");
	for(Emp05Dto bean : list){
	%>
	<div>
		<span><%=bean.getSabun() %></span>
		<span><%=bean.getName() %></span>
		<a href="upload/<%=bean.getFile1()%>">
						[<%=bean.getFile1()%>]</a>
	</div>
	<%} %>
</body>
</html>










