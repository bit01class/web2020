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
	int ref=Integer.parseInt(request.getParameter("ref"));
	int lev=Integer.parseInt(request.getParameter("lev"));
	int no=Integer.parseInt(request.getParameter("no"));
	
	String sql="update bbs02 set num_no=num_no+1"
					+" where num_no>=?";
try{
	conn=getConnection();
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, no);
	pstmt.executeUpdate();
	sql="insert into bbs02 values"
		+"(bbs02_seq.nextval,?,?,?,sysdate,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, sub);
	pstmt.setString(3, content);
	pstmt.setInt(4, ref);
	pstmt.setInt(5, no);
	pstmt.setInt(6, lev+1);
	pstmt.executeUpdate();
}finally{
	if(rs!=null)rs.close();
	if(pstmt!=null)pstmt.close();
	if(conn!=null)conn.close();
}
	response.sendRedirect("/web07/");
%>
</body>
</html>











