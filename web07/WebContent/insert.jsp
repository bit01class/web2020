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
	String id=request.getParameter("id");
	String sub=request.getParameter("sub");
	String content=request.getParameter("content");

	String sql="insert into bbs02 (num,id,sub,content,nalja,num_ref)";
//	sql+=" values (bbs02_seq.nextval,'"+id+"','"+sub+"','"
//			+content+"',sysdate,bbs02_seq.currval)";
	sql+=" values (bbs02_seq.nextval,?,?,?,sysdate,bbs02_seq.currval)";
	
	try{
		conn=getConnection();
//		stmt=conn.createStatement();
//		stmt.executeUpdate(sql);
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, sub);
		pstmt.setString(3, content);
		pstmt.executeUpdate();
	}finally{
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
	response.sendRedirect("/web07/");
%>
</body>
</html>







