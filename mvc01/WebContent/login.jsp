<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bitgrid.css" />
<style type="text/css">
	#header p{
		width:263px;
		height:86px;
		background-image: url("imgs/logo.jpg");
		text-indent: -999px;
	}
	#menu{
		background-color: gray;
		text-align: center;
	}
	#menu a{
		color: white;
		text-decoration: none;
		margin: 0px 20px;
	}
	#menu a:hover{
		color: red;
	}
	#content form{
		width: 60%;
	}
	#content form>div{
		text-align: center;
	}
	#content form>div>label{
		display: inline-block;
		width: 40%;
		background-color: gray;
	}
	#content form>div>input{}
	#content form>div>button{
		width: 40%;
		margin: 10px 5px;
	}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.bx').bxSlider();
	});
	
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div id="header" class="row">
			<div class="tgrid12">
				<p>비트교육센터</p>
			</div>
		</div>
		<div id="menu" class="row">
			<div class="tgrid12">
				<a href="/mvc01/">HOME</a>
				<a href="/mvc01/intro.html">INTRO</a>
				<a href="/mvc01/list.html">B B S</a>
				<a href="/mvc01/login.html">LOGIN</a>
			</div>
		</div>
		<div id="content" class="row">
			<div class="tgrid12">
				<h1>로그인 페이지</h1>
				<form method="post">
					<div>
						<label for="sabun">사번</label>
						<input type="text" name="sabun" />
					</div>
					<div>
						<label for="name">이름</label>
						<input type="text" name="name" />
					</div>
					<div>
						<button type="submit">로그인</button>
						<button type="reset">취 소</button>
					</div>
				</form>
			</div>
		</div>
		<div id="footer" class="row">
			<div class="tgrid12">
				<address>서울특별시 서초구 서초대로74길33 비트빌 3층</address>
				COPYRIGHT BY BITACADEMY CO.LTD. ALL RIGHTS RESERVED.
			</div>
		</div>
	</div>
</body>
</html>












