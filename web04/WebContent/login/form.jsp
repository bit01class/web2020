<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu.jsp" %>
<h1>로그인 페이지</h1>
<form action="">
	<table align="center">
		<tr>
			<td>id</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>pw</td>
			<td><input type="password"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="로그인">
				<input type="reset" value="취 소">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="#">[회원가입]</a>
			</td>
		</tr>
	</table>
</form>

<%@ include file="../template/footer.jsp" %>
</body>
</html>