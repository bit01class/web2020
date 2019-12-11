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
				String search=request.getParameter("search");
				if(search==null)search="sub";
				String keyword=request.getParameter("keyword");
				if(keyword==null)keyword="";
				// p1 1~10 -1 00~09  (p-1)*10+1
				// p2 11~20 -1 10~19
				// p3 21~30 -1 20~29
				
				int show=5;
				int p=1;
				String param=request.getParameter("p");
				if(param!=null)p=Integer.parseInt(param);
				int start=(p-1)*show+1;
				int end=start+show-1;
				String sql="SELECT * FROM "; 
				sql+="(SELECT ROWNUM AS RN, NUM,SUB,ID,CNT FROM "; 
				sql+="(SELECT  NUM,SUB,ID,CNT FROM BBS01 where "
					+search+" LIKE '%"+keyword+"%' ORDER BY NUM DESC))";
				sql+=" WHERE RN BETWEEN "+start+" AND "+end;
				
				String driver="oracle.jdbc.driver.OracleDriver";
				String url="jdbc:oracle:thin:@192.168.3.23:1521:xe";
				String user="scott";
				String password="tiger";
				
				Connection conn=null;
				Statement stmt=null;
				ResultSet rs=null;
				int total=0;
				try{
					Class.forName(driver);
					conn=DriverManager.getConnection(url,user,password);
					stmt=conn.createStatement();
					rs=stmt.executeQuery("select count(*) from bbs01");
					if(rs.next())total=rs.getInt(1);
					stmt=conn.createStatement();
					rs=stmt.executeQuery(sql);
					while(rs.next()){
				%>
				
				<tr>
					<td><a href="detail.jsp?idx=<%=rs.getObject(2) %>"><%=rs.getObject(2) %></a></td>
					<td><a href="detail.jsp?idx=<%=rs.getObject(2) %>"><%=rs.getObject(3) %></a></td>
					<td><a href="detail.jsp?idx=<%=rs.getObject(2) %>"><%=rs.getObject(4) %></a></td>
					<td><a href="detail.jsp?idx=<%=rs.getObject(2) %>"><%=rs.getObject(5) %></a></td>
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
			<center>
			<br>
			<%
			//12345678910	01 (p-1)/10*10+1 
			//11~20			11
			//21~30			21
			int su=5;
			int limit=total/show+1;
			if(total%show==0)limit--;
			int forstart=(p-1)/su*su+1;
			int forend=forstart+(su-1);
			
			if(limit<forend)forend=limit;
			int i=0;
			if(forstart!=1){
			%>
			<a href="list.jsp?p=<%=forstart-1%>">[prev]</a>
			<%
			}
			for(i=forstart; i<=forend; i++){ 
			%>
			<a href="list.jsp?p=<%=i%>">[<%=i%>]</a>
			<%
			} 
			if(limit>forend){
			%>
			<a href="list.jsp?p=<%=i%>">[next]</a>
			<%} %>
			<br>
			<form>
			<br>
			<select name="search">
				<option value="sub">제목</option>
				<option value="content">내용</option>
				<option value="id">글쓴이</option>
			</select>
			<input type="text" name="keyword">
			<input type="submit" value="검색">
			</form>
			</center>
			
			<p><a href="add.jsp">[입 력]</a></p>
		</td>
	</tr>
	<tr>
		<td colspan="7"><img src="imgs/footer.png"></td>
	</tr>

</table>

</body>
</html>