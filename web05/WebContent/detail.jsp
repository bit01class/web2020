<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>상세페이지</h1>
	<%@ page import="java.sql.*,com.bit.web05.*" %>
	<%
	int num=Integer.parseInt(request.getParameter("num"));
	String sql="select A.num,B.nick,A.nalja,A.cnt,A.sub "
			+" ,A.content from bbs01 A inner join bbs01user B "
			+" on A.id=B.id where A.num="+num;
	JavaBean bean=new JavaBean();
	
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	try{
		conn=MyOracle.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		if(rs.next()){
			bean.setNum(rs.getInt("num"));
			bean.setNick(rs.getString("nick"));
			bean.setNalja(rs.getDate("nalja"));
			bean.setCnt(rs.getInt("cnt"));
			bean.setSub(rs.getString("sub"));
			bean.setContent(rs.getString("content"));
		}
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	%>
	
	<p>글번호:<%=bean.getNum() %></p>
	<p>글쓴이:<%=bean.getNick() %><br>
		날짜:<%=bean.getNalja()%><br>
		조회수:<%=bean.getCnt() %><br></p>
	<p>제목:<%=bean.getSub() %></p>
	<p><%=bean.getContent() %></p>
	
</body>
</html>

















