<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bitgrid.css" />
<style type="text/css">
	#header h1{
		width: 263px;
		height: 86px;
		background-image: url("../imgs/logo.jpg");
		text-indent: -999px;
	}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('button[type=button]').one('click',function(){
		$(this).attr('type','submit');
		$('#name').attr('type','text').prev().hide();
		$('#deptno').attr('type','text').prev().hide();
		return false;
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="containerw">
		<div id="header" class="row">
			<div class="grid12">
				<h1>비트교육센터</h1>
			</div>
		</div>
		<div id="menu" class="row">
			<div class="grid12">
				<a href="../index.html">HOME</a>
				<a href="../intro.html">INTRO</a>
				<a href="list.html">EMP</a>
				<a href="../dept/list.html">DEPT</a>
				<a href="../login/login.html">LOGIN</a>
			</div>
		</div>
		<div id="content" class="row">
			<div class="grid12">
				<h1>EMP DETAIL PAGE</h1>
				<%@ page import="com.bit.mvc02.emp.model.*" %>
				<%
					Emp02Dto bean=(Emp02Dto)request.getAttribute("bean");
				%>
				<form method="post">
					<div>
						<label for="sabun">사번</label>
						<span><%=bean.getSabun() %></span>
						<input type="hidden" id="sabun" name="sabun" value="<%=bean.getSabun() %>"/>
					</div>
					<div>
						<label for="name">이름</label>
						<span><%=bean.getName() %></span>
						<input type="hidden" id="name" name="name" value="<%=bean.getName() %>"/>
					</div>
					<div>
						<label for="nalja">날짜</label>
						<span><%=bean.getNalja() %></span>
						<input type="hidden" id="nalja"/>
					</div>
					<div>
						<label for="deptno">deptno</label>
						<span><%=bean.getDeptno() %></span>
						<input type="hidden" id="deptno" name="deptno" value="<%=bean.getDeptno() %>"/>
					</div>
					<div>
						<button type="button">수정</button>
						<button type="reset">취소</button>
					</div>
				</form>
			</div>
		</div>
		<div id="footer" class="row">
			<div class="grid12">
				<address>서울 강남구 테헤란로5길 11 YOO빌딩 3층, 지하철 2호선 강남역 12번 출구</address>
				Copyright &copy; 비트캠프 All rights reserved.
			</div>
		</div>
	</div>
</body>
</html>


















