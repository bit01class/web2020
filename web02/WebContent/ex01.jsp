<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>페이지 이동</h1>
	<a href="./">[home]</a>
	<a href="./ex02.jsp?id=guest">[ex02]</a>
	
	<form action="ex04.jsp" method="post">
		id:<input type="text" name="id" value="guest"><br>
		pw:<input type="password" name="pw"><br>
		name:<input type="text" name="name"><br>
		hobby:
		<input type="checkbox" name="ch" value="chk1">citem1
		<input type="checkbox" name="ch" value="chk2">citem2
		<input type="checkbox" name="ch" value="chk3">citem3<br>
		
		<input type="radio" name="ra" value="ra1">ra1
		<input type="radio" name="ra" value="ra2" checked="checked">ra2
		<input type="radio" name="ra" value="ra3">ra3<br>
		
		<select name="sel" size="4">
			<option value="it1">item1</option>
			<option value="it2">item2</option>
			<option value="it3">item3</option>
			<option value="it4">item4</option>
		</select><br>
		
		<textarea rows="3" cols="5" name="content"></textarea>
		<input type="submit" value="전달">
		<input type="reset" value="취소">
	</form>
</body>
</html>















