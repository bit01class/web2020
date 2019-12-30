<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bitgrid.css"/>
<style type="text/css">
	#menu{
		height: 50px;
		background-color: silver;
	}
	#menu ul{
		margin: 0px auto;
		padding: 0px;
		width: 400px;
	}
	#menu ul>li{
		float: left;	
		list-style: none;
	}
	#menu ul>li>a{
		display: inline-block;
		width: 100px;
		height: 50px;
		background-color: gray;
		border: 1px solid white;
        box-sizing: border-box;
        color: white;
        text-align: center;
        line-height: 50px;
        text-decoration: none;
	}
	#menu ul>li>a:hover{
		color: yellow;
		background-color: red;
	}
	#content {}
	#content #detail{
		width: 90%;
		margin: 0px auto;
	}
	#content #detail>div{
		background-color: silver;
	}
	#content #detail>div>span{
		display: inline-block;
	}
	#content #detail>div>span:first-child
	,#content #detail>div>span:nth-child(3)
	,#content #detail>div>span:nth-child(5)
	{
		width: 80px;
		background-color: gray;
	}
	#content #detail>div:nth-child(3){
		height: 200px;
	}
	#content #editForm{
		display: none;
	}
</style>
<script type="text/javascript">
var detail,msg1,msg2,msg3,msg4,msg5,edit,editForm,h2;
var num,sub,cntnt,backbtn;
var xhr;

function myAjax(){
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=callback;
	xhr.open('get','detail.jsp?num=<%=request.getParameter("num")%>');
	xhr.send();
}

function callback(){
	var msg;
	if(xhr.readyState==4 && xhr.status==200){
		msg=xhr.responseText;
	}
	var obj=JSON.parse(msg);
	var arr=obj.root;
	msg1.innerText=arr[0].num;
	num.value=arr[0].num;
	msg2.innerText=arr[0].id;
	msg3.innerText=arr[0].nalja;
	msg4.innerText=arr[0].sub;
	sub.value=arr[0].sub;
	msg5.innerText=arr[0].content;
	cntnt.value=arr[0].content;
}
window.onload=function(){
	h2=document.querySelector("#content h2");
	detail=document.getElementById("detail");
	msg1=detail.getElementsByTagName("span")[1];
	msg2=detail.getElementsByTagName("span")[3];
	msg3=detail.getElementsByTagName("span")[5];
	msg4=detail.getElementsByTagName("span")[7];
	msg5=detail.getElementsByTagName("pre")[0];
	edit=detail.getElementsByTagName("a")[0];
	editForm=document.getElementById("editForm");
	num=document.getElementById("num");
	sub=document.getElementById("sub");
	cntnt=document.getElementById("cntnt");
	backbtn=document.querySelector("#editForm button[type=button]");
	myAjax();
	backbtn.onclick=function(){
		window.location.reload();
	};
	edit.onclick=function(){
		detail.style.display='none';
		editForm.style.display='block';
		h2.innerText='수정페이지';
		return false;
	};
	editForm.addEventListener('submit',function(e){
		e.preventDefault();
		editAjax();		
	});
};

function editAjax(){
	var param1=document.getElementById("num").value;
	var param2=document.getElementById("sub").value;
	var param3=document.getElementById("cntnt").value;
	var param='idx='+param1+"&sub="+param2+"&content="+param3;
	var param4='{"num":"'+param1+'","sub":"'+param2+'","content":"'+param3+'"}';
	alert(param4);
	var data=new FormData();
	data.append('num',param1);
	data.append('sub',param2);
	data.append('content',param3);
	
	xhr=new XMLHttpRequest();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4&&xhr.status==200){

			window.location.reload();
		}else if(xhr.readyState==4){
			console.log("err");
		}
	};
	xhr.open('post','update.jsp');//open('method','url','비동기')
	xhr.setRequestHeader("Content-Type"
			, "application/x-www-form-urlencoded");
	
	xhr.send(param);
}
</script>
</head>
<body>
<div class="err"></div>
	<div class="containerw">
		<div id="header" class="row">
			<div class="tgrid12">
				<h1>비트교육센터</h1>
			</div>
		</div>		
		<div id="menu" class="row">
			<div class="tgrid12">
			<ul>
				<li><a href="index.html">HOME</a></li>
				<li><a href="list.html">B B S</a></li>
				<li><a href="#">LOGIN</a></li>
				<li><a href="#">E T C</a></li>
			</ul>
			</div>
		</div>		
		<div id="content" class="row">
			<div class="tgrid12">
			
				<h2>상세페이지</h2>
				<div id="detail">
					<div>
						<span>글번호</span>
						<span>1</span>
						<span>글쓴이</span>
						<span>3</span>
						<span>날 짜</span>
						<span>5</span>
					</div>
					<div>
						<span>제목</span>
						<span>7</span>
					</div>
					<div>
						<pre></pre>
					</div>
					<div>
						<a href="#">수정</a>
						<a href="#">삭제</a>
					</div>
				</div>
				<form id="editForm" action="index.html">
					<div>
						<label for="num">글번호</label>
						<input type="text" id="num" />
					</div>
					<div>
						<label for="sub">제목</label>
						<input type="text" id="sub" />
					</div>
					<div>
						<textarea id="cntnt"></textarea>
					</div>
					<div>
						<button type="submit">수 정</button>
						<button type="reset">취 소</button>
						<button type="button">뒤 로</button>
					</div>
				</form>
			</div>
		</div>		
		<div id="footer" class="row">
			<div class="tgrid12">
			<address>서울특별시 서초구 서초대로74길33 비트빌 3층 </address>
			COPYRIGHT BY BITACADEMY CO.LTD. ALL RIGHTS RESERVED. HTTP://www.BITacademy.com
			</div>
		</div>		
	</div>
</body>
</html>







