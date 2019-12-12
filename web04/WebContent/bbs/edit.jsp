<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*,com.bit.oracle.BitOracle" %>
<%
int num=0;
Date nalja=null;
String id=null;
int cnt=0;
String sub=null;
String content=null;

Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

try{
	conn=BitOracle.getConnection();
	stmt=conn.createStatement();
	if("GET".equals(request.getMethod())){
		num=Integer.parseInt(request.getParameter("idx"));
		String sql="select * from bbs01 where num="+num;
		
			rs=stmt.executeQuery(sql);
			if(rs.next()){
				num=rs.getInt("num");
				nalja=rs.getDate("nalja");
				id=rs.getString("id");
				cnt=rs.getInt("cnt");
				sub=rs.getString("sub");
				content=rs.getString("content");
			}
		
	}else if("POST".equals(request.getMethod())){
		num=Integer.parseInt(request.getParameter("num"));
		sub=request.getParameter("sub");
		content=request.getParameter("content");
		String sql="update bbs01 set sub='"
				+sub+"',content='"+content+"' where num="+num;
		int result=stmt.executeUpdate(sql);
		
		if(result>0)response.sendRedirect("detail.jsp?idx="+num);
		else response.sendRedirect("edit.jsp?idx="+num);
	}
}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
%>    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../template/header.jsp" %>
<%@ include file="../template/menu.jsp" %>
<h1>수정페이지</h1>
<form method="post">
	<table width="85%" border="0" align="center">
		<tr>
			<td>글번호</td>
			<td><%=num %><input type="hidden" name="num" value="<%=num%>"></td>
			<td>날짜</td>
			<td><%=nalja %></td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td><%=id %></td>
			<td>조회수</td>
			<td><%=cnt %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><input type="text" name="sub" value="<%=sub%>"></td>
		</tr>
		<tr>
			<td colspan="4"><textarea name="content" rows="5" cols="60"><%=content %></textarea></td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="submit" value="수 정">
				<input type="reset" value="취 소">
			</td>
		</tr>
	</table>
</form>
<%@ include file="../template/footer.jsp" %>
</body>
</html>














