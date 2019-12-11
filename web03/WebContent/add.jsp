<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table align="center" width="800" border="0" cellspacing="0">
	<tr>
		<td colspan="7"><img src="imgs/logo.jpg"></td>
	</tr>
	<tr>
		<td bgcolor="#c3c3c3"></td>
		<td bgcolor="#c3c3c3" width="120"><a href="index.jsp" style="color: #c3c3c3;"><img src="imgs/menu1.png"></a></td>
		<td bgcolor="#c3c3c3" width="128"><a href="sec.jsp" style="color: #c3c3c3;"><img src="imgs/menu2.png"></a></td>
		<td bgcolor="#c3c3c3" width="115"><a href="list.jsp" style="color: #c3c3c3;"><img src="imgs/menu3.png"></a></td>
		<td bgcolor="#c3c3c3" width="114"><a><img src="imgs/menu4.png"></a></td>
		<td bgcolor="#c3c3c3" width="125"><a><img src="imgs/menu5.png"></a></td>
		<td bgcolor="#c3c3c3"></td>
	</tr>
	<tr>
		<td colspan="7">
		<h1>글쓰기</h1>
		<form action="insert.jsp">
			<table align="center">
				<tr>
					<td bgcolor="dddddd">제 목</td>
					<td><input type="text" name="sub"></td>
				</tr>
				<tr>
					<td bgcolor="dddddd">글쓴이</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td bgcolor="dddddd">내 용</td>
					<td><textArea cols="50" rows="5" name="content"></textArea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="취 소">
					</td>
				</tr>
			</table>
		</form>
		</td>
	</tr>
	<tr>
		<td colspan="7"><img src="imgs/footer.png"></td>
	</tr>

</table>

</body>
</html>