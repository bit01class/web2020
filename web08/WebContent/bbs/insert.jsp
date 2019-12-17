<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.bit.web08.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="bean" class="com.bit.web08.Bbs01Dto"></jsp:useBean>
	<jsp:setProperty property="sub" name="bean"/>
	<jsp:setProperty property="content" name="bean"/>
	
	<%
//		String sub=request.getParameter("sub");
//		String content=request.getParameter("content");
//		Bbs01Dto bean2=new Bbs01Dto();
//		bean2.setSub(sub);
//		bean2.setContent(content);
	
		Bbs01Dao.insert(bean);
		response.sendRedirect("list.jsp");
	%>
	
</body>
</html>








