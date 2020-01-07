<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bit.mvc01.model.*"%>
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
		width: 90%;
		margin: 0px auto;
	}
	#content form>div{
		text-align: center;
	}
	#content form>div>label{
		display: inline-block;
		width: 40%;
		background-color: gray;
	}
	#content form>div>input{
		width: 50%;
	}
	#content form>div>button{
		width: 30%;
	}
	#err{
		background-color: red;
		color:white;
		text-align: center;
	}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('button[type=button]').click(function(){
			window.history.back();
		});
		if("<%=request.getParameter("err")%>"=='nameErr'){
			$('#err').text('이름을 입력하세요');
		}else if("<%=request.getParameter("err")%>"=='payErr'){
			$('#err').text('금액을 확인하시고 다시 입력하세요');
		}
	});
	
</script>
<title>Insert title here</title>
</head>
<body>
<div id="err"></div>
	<div class="container">
		<div id="header" class="row">
			<div class="tgrid12">
				<p>비트교육센터</p>
				<%
				Emp01Dto login=(Emp01Dto)session.getAttribute("login");
				
				if(login!=null){
				%>
				<span><%=login.getName() %>님 환영합니다</span>
				<%
				}
				%>
			</div>
		</div>
		<div id="menu" class="row">
			<div class="tgrid12">
				<a href="/mvc01/">HOME</a>
				<a href="/mvc01/intro.html">INTRO</a>
				<a href="/mvc01/list.html">B B S</a>
				<%if(login==null){ %>
				<a href="/mvc01/login.html">LOGIN</a>
				<%}else{ %>
				<a href="/mvc01/logout.html">LOGOUT</a>
				<%} %>
			</div>
		</div>
		<div id="content" class="row">
			<div class="tgrid12">
				<h1>입력 페이지</h1>
				<form method="post">
					<div>
						<label for="name">이름</label>
						<input type="text" name="name" id="name" />
					</div>
					<div>
						<label for="pay">금액</label>
						<input type="text" name="pay" id="pay" />
					</div>
					<div>
						<label for="etc">기타</label>
						<input type="text" name="etc" id="etc" />
					</div>
					<div>
						<button type="submit">입 력</button>
						<button type="reset">취 소</button>
						<button type="button">뒤 로</button>
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












