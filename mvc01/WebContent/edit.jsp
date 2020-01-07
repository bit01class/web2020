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
	#content h1{}
	#content form{
		width: 90%;
		text-align: center;
	}
	#content form>div>span
	{
		display:inline-block;
		width:40%;
		border-bottom: 1px solid gray;
	}
	#content form>div>input
	{
		display:inline-block;
		width:39%;
		border-bottom: 1px solid gray;
	}
	#content form>div>span:first-child{
		background-color: gray;
	}
	#content form>div>button{
		width: 30%;
		height:40px;
		border: 1px solid gray;
		border-radius:10px;
		text-decoration: none;
		text-align: center;
		line-height: 40px;
		color:gray;
		margin-top:10px;
	}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#content form>div>button').last().click(function(){
			window.history.back();
		});
	});
	
</script>
<title>Insert title here</title>
</head>
<body>
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
				<h1>수정페이지</h1>
				<%
				Emp01Dto bean=(Emp01Dto)request.getAttribute("bean");
				%>
				<form method="post">
				<div>
					<span>사번</span>
					<span><%=bean.getSabun() %></span>
					<input type="hidden" name="sabun" value="<%=bean.getSabun() %>"/>
				</div>
				<div>
					<span>이름</span>
					<input type="text" name="name" value="<%=bean.getName() %>"/>
				</div>
				<div>
					<span>입사일</span>
					<span><%=bean.getNalja() %></span>
				</div>
				<div>
					<span>금액</span>
					<input type="text" name="pay" value="<%=bean.getPay() %>"/>
				</div>
				<div>
					<span>비고</span>
					<input type="text" name="etc" value="<%=bean.getEtc() %>"/>
				</div>
				<div>
					<button type="submit">수정</button>
					<button type="reset">취소</button>
					<button type="button">뒤로</button>
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












