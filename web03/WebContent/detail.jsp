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
		<h1>상세보기</h1>
		<%@ page import="java.sql.*" %>
		<%
		String param=request.getParameter("idx");
		String sql="select num,nalja,id,cnt,sub,content from bbs01 where num="+param;
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
		<table width="80%" align="center">
			<tr>
				<td width="80" align="center" bgcolor="#dddddd">글번호</td>
				<td><%=rs.getInt(1) %></td>
				<td width="80" align="center" bgcolor="#dddddd">날짜</td>
				<td><%=rs.getDate(2) %></td>
			</tr>
			<tr>
				<td width="80" align="center" bgcolor="#dddddd">글쓴이</td>
				<td><%=rs.getString(3) %></td>
				<td width="80" align="center" bgcolor="#dddddd">조회수</td>
				<td><%=rs.getInt(4) %></td>
			</tr>
			<tr>
				<td width="80" align="center" bgcolor="#dddddd">제목</td>
				<td colspan="3"><%=rs.getString(5) %></td>
			</tr>
			<tr>
				<td colspan="4"><%=rs.getString(6).replace("\n", "<br>") %>
			</tr>
			<tr>
				<td colspan="4" bgcolor="#dddddd"></td>
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
		</td>
	</tr>
	<tr>
		<td colspan="7"><img src="imgs/footer.png"></td>
	</tr>

</table>

</body>
</html>











