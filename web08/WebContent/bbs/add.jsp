<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../template/header.jsp">
	<jsp:param value="../" name="path"/>
</jsp:include>
<jsp:include page="../template/menu.jsp">
	<jsp:param value="../" name="path"/>
</jsp:include>
<h1>�Է� ������</h1>
<form action="insert.jsp">
	<p>����:<input type="text" name="sub"></p>
	<p><textarea name="content" rows="5" cols="50"></textarea></p>
	<input type="submit" value="�� ��">
</form>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>










