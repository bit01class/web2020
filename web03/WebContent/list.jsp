<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
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
			<h1>게시판</h1>
			<table align="center" width="80%" border="1" cellspacing="0">
				<tr>
					<th bgcolor="dddddd">글번호</th>
					<th bgcolor="dddddd">제목</th>
					<th bgcolor="dddddd">글쓴이</th>
					<th bgcolor="dddddd">조회수</th>
				</tr>
				<%
				String sql="SELECT NUM,SUB,ID,CNT FROM BBS01 ORDER BY NUM DESC";
				String driver="oracle.jdbc.driver.OracleDriver";
				String url="jdbc:oracle:thin:@192.168.3.23:1521:xe";
				String user="scott";
				String password="tiger";
				
				Connection conn=null;
				Statement stmt=null;
				ResultSet rs=null;
				
				try{
					Class.forName(driver);
					conn=DriverManager.getConnection(url,user,password);
					stmt=conn.createStatement();
					rs=stmt.executeQuery(sql);
					while(rs.next()){
				%>
				<tr>
					<td><%=rs.getObject(1) %></td>
					<td><%=rs.getObject(2) %></td>
					<td><%=rs.getObject(3) %></td>
					<td><%=rs.getObject(4) %></td>
				</tr>
				<%
					}
				}finally{
					if(rs!=null)rs.close();
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				} 
				%>
				
			</table>
			<p><a href="add.jsp">[입 력]</a></p>
		</td>
	</tr>
	<tr>
		<td colspan="7"><img src="imgs/footer.png"></td>
	</tr>

</table>

</body>
</html>