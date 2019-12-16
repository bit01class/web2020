<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="conn.jspf" %>
<%
	
	Bbs02Bean bean=new Bbs02Bean();

	int num=Integer.parseInt(request.getParameter("num"));
	String sql=null;
	
	try{
		conn=getConnection();	
		if("GET".equals(request.getMethod())){
			sql="select * from bbs02 where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setSub(rs.getString("sub"));
				bean.setContent(rs.getString("content"));
			}
		}else if("POST".equals(request.getMethod())){
			String sub=request.getParameter("sub");
			String content=request.getParameter("content");
			sql="update bbs02 set sub=?,content=? where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,sub);
			pstmt.setString(2,content);
			pstmt.setInt(3, num);
			pstmt.executeUpdate();
			response.sendRedirect("detail.jsp?num="+num);
			return;
		}
	}finally{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
%>
	<h1>����������</h1>
	<form method="post">
		<input type="hidden" name="num" value="<%=bean.getNum()%>">
		<p>�۹�ȣ:<%=bean.getNum() %></p>
		<p>�۾���:<%=bean.getId() %></p>
		<p>��¥:<%=bean.getNalja() %></p>
		<p>����:<input type="text" name="sub" value="<%=bean.getSub()%>"></p>
		<p><textarea name="content" rows="5" cols="50"><%=bean.getContent() %></textarea></p>
		<input type="submit" value="�� ��">
	</form>
</body>
</html>















