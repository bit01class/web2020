<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>������ ���</h1>
	<table border=1>
		<tr>
			<td>2��</td>
			<td>3��</td>
			<td>4��</td>
			<td>5��</td>
			<td>6��</td>
			<td>7��</td>
			<td>8��</td>
			<td>9��</td>
		</tr>
	<%
	for(int j=1; j<10; j++){
		out.println("<tr>");
		for(int i=2; i<10; i++){
		out.println("<td>"+i+"x"+j+"="+(i*j)+"</td>");
		}
		out.println("</tr>");
	}
	out.println("</table>");
	
	%>
</body>
</html>






















