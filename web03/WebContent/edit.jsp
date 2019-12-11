<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table align="center" width="800" border="0" cellspacing="0">
	<tr>
		<td colspan="7"><img src="imgs/logo.jpg"></td>
	</tr>
	<tr>
		<td bgcolor="#c3c3c3"></td>
		<td bgcolor="#c3c3c3" width="120"><a href="index.jsp" style="color: #c3c3c3;"><img src="imgs/menu1.png"></a></td>
		<td bgcolor="#c3c3c3" width="128"><a href="sec.jsp" style="color: #c3c3c3;"><img src="imgs/menu2.png"></a></td>
		<td bgcolor="#c3c3c3" width="115"><a href="list.jsp" style="color: #c3c3c3;"><img src="imgs/menu3.png"></a></td>
		<td bgcolor="#c3c3c3" width="114"><a><img src="imgs/menu4.png"></a></td>
		<td bgcolor="#c3c3c3" width="125"><a><img src="imgs/menu5.png"></a></td>
		<td bgcolor="#c3c3c3"></td>
	</tr>
	<tr>
		<td colspan="7">
		<h1>수정페이지</h1>
		<form action="update.jsp">
		
		<%@ page import="java.sql.*" %>
		<%
		String param=request.getParameter("idx");
		String sql="select * from bbs01 where num="+param;
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, password);
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			if(rs.next()){
		%>
		<table align="center" width="80%">
			<tr>		
				<td align="center" width="80" bgcolor="#dddddd">글번호</td>
				<td><input type="text" name="num" value="<%=rs.getInt("num") %>" readonly="readonly"></td>
				<td align="center" width="80" bgcolor="#dddddd">날짜</td>
				<td><%=rs.getDate("nalja") %></td>
			</tr>
			<tr>	
				<td align="center" bgcolor="#dddddd">글쓴이</td>
				<td><%=rs.getString("id") %></td>
				<td align="center" bgcolor="#dddddd">조회수</td>
				<td><%=rs.getInt("cnt") %></td>
			</tr>
			<tr>
				<td align="center" bgcolor="#dddddd">제목</td>
				<td colspan="3"><input type="text" name="sub" value="<%=rs.getString("sub") %>"></td>
			</tr>		
			<tr>
				<td colspan="4"><textarea name="content" rows="5" cols="50"><%=rs.getString("content") %></textarea></td>
			</tr>		
			<tr>
				<td colspan="4" align="center" bgcolor="#dddddd">
				<input type="submit" value="수 정">
				<input type="reset" value="취 소">
				</td>
			</tr>		
		</table>
		<%
			}
		}finally{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
		%>
		</form>
		</td>
	</tr>
	<tr>
		<td colspan="7"><img src="imgs/footer.png"></td>
	</tr>

</table>

</body>
</html>