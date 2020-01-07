<%@page import="com.bit.mvc01.model.Emp01Dto,java.util.ArrayList"%>
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
	#content{}
	#content table{
		border-collapse: collapse;
		width: 90%;
		margin: 0px auto;
	}
	#content table, 
	#content table th, 
	#content table td
	{
		border:1px solid gray;
	}
	#content table td>a{
		display: block;
		height: 40px;
	}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.bx').bxSlider();
	});
	var arr=[1,3,5,7,9];
	var obj={'a':9, 'b':3, 'c':7, 'd':4};
	for(var i in obj){
		console.log(i,obj[i]);
	}
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
				<H1>리스트페이지</H1>
				<a href="add.html">입력</a>
				<table>
					<thead>
						<tr>
							<th>사번</th>
							<th>이름</th>
							<th>입사일</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody>
<%
java.util.ArrayList<Emp01Dto> list=null;
list=(ArrayList<Emp01Dto>)request.getAttribute("alist");
// 개선된 루프문
//for(Emp01Dto bean : list){
for(int i=0; i<list.size(); i++){
	Emp01Dto bean=list.get(i);	

%>					
						<tr>
							<td><a href="detail.html?idx=<%=bean.getSabun() %>"><%=bean.getSabun() %></a></td>
							<td><a href="detail.html?idx=<%=bean.getSabun() %>"><%=bean.getName() %></a></td>
							<td><a href="detail.html?idx=<%=bean.getSabun() %>"><%=bean.getNalja() %></a></td>
							<td><a href="detail.html?idx=<%=bean.getSabun() %>"><%=bean.getPay() %></a></td>
						</tr>
<%
}
%>						
					</tbody>
				</table>
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












