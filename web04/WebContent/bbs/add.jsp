<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu.jsp" %>
<h1>입력 페이지</h1>
<%@ page import="java.sql.*,com.bit.oracle.BitOracle" %>
<%
String sub=request.getParameter("sub");
String id=request.getParameter("id");
String content=request.getParameter("content");
String sql="insert into bbs01 values (bbs01_seq.nextval,'"
			+sub+"','"+id+"','"+content+"',sysdate,0)";
Connection conn=null;
Statement stmt=null;
	if("POST".equals(request.getMethod())){
		try{
			conn=BitOracle.getConnection();
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
		}finally{
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
		}
		response.sendRedirect("list.jsp");
	}
%>
<form method="post">
	<table width="85%">
		<tr>
			<td width="10%">제목</td>
			<td><input type="text" name="sub"></td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" rows="5" cols="50"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="입 력">
				<input type="reset" value="취 소">
			</td>
		</tr>
	</table>
</form>
<%@ include file="../template/footer.jsp" %>
</body>
</html>












