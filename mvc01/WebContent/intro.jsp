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
				<h1>INTRO</h1>
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












