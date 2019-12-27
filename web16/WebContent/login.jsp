<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	form{
		width: 400px;
	}
	form>div{}
	form>div>label{
		display: inline-block;
		width: 150px;
	}
	form>div>input{
		width: 220px;
	}
	form>div>button {
		width: 300px;
		margin: 0px auto;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	<form action="result01.jsp">
		<div>
			<label for="id">id</label>
			<input type="text" name="id" id="id" />
		</div>
		<div>
			<label for="pw">pw</label>
			<input type="password" name="pw" id="pw" />
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>
</body>
</html>