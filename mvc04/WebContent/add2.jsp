<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>입력2페이지</h1>
	<a href="add.html">입력(업로드)</a>
	<a href="list.html">목록(다운로드)</a>
	<a href="add2.html">입력2(트랜잭션)</a>
	<a href="list2.html">목록2(트랜잭션)</a>
	<form method="post">
		<div>
			<label for="name">이름</label>
			<input type="text" name="name" />
		</div>
		<div>
			<label for="cnt">레벨</label>
			<input type="text" name="cnt" />
		</div>
		<button>입력</button>
	</form>
</body>
</html>


