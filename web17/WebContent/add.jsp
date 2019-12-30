<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bit.web17.*"%>
<%
	String sub=request.getParameter("sub");
	String id=request.getParameter("id");
	String content=request.getParameter("content");
	BbsDao dao=new BbsDao();
	dao.add(sub, id, content);
%>
<h1>OK</h1>