<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%!

	public void func(){
	
}
%>
<body>
	<h1>������ ���2</h1>
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
		System.out.println(request);
		for(int j=1; j<10; j++){
		%>
		<tr>
		<%
			for(int i=2; i<10; i++){
		%>
			<td>
			<%=i%>
			x
			<%out.print(j);%>
			=
			<%out.print(i*j);%>
			</td>
		<%
			}
		%>
		<%
		}
		%>
		</tr>
</body>
</html>