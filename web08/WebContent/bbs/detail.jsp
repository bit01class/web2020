<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.bit.web08.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../template/header.jsp">
	<jsp:param value="../" name="path"/>
</jsp:include>
<jsp:include page="../template/menu.jsp">
	<jsp:param value="../" name="path"/>
</jsp:include>
<jsp:useBean id="bean" class="com.bit.web08.Bbs01Dto"></jsp:useBean>
<jsp:setProperty property="num" name="bean"/>
<%
	bean=Bbs01Dao.detail(bean.getNum());
%>
<h1>상세 페이지</h1>
<p>글번호:<%=bean.getNum() %></p>
<p>날짜:<%=bean.getNalja() %></p>
<p>조회수:<%=bean.getCnt() %></p>
<pre><%=bean.getContent() %></pre>
<p></p>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>







