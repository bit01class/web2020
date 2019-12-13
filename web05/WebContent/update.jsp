<%@page import="com.bit.web05.MyOracle"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%!
	Connection conn;
	Statement stmt;
%>
<%
	String sub=request.getParameter("sub");
	String content=request.getParameter("content");
	int num=Integer.parseInt(request.getParameter("num"));
	String sql="update bbs01 set sub='"+sub+"'";
	sql+=",content='"+content+"' where num="+num;
	
	try{
		conn=MyOracle.getConnection();
		stmt=conn.createStatement();
		if(stmt.executeUpdate(sql)>0){
			response.sendRedirect("detail.jsp?num="+num);
		}else{
			response.sendRedirect("edit.jsp?num="+num);			
		}
	}finally{
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
%>














