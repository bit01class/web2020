<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.bit.web17.*"%>
<%
	String sub=request.getParameter("sub");
	System.out.println(sub);
	String content=request.getParameter("content");
	System.out.println(content);
	int num=Integer.parseInt(request.getParameter("idx"));
	BbsDao dao=new BbsDao();
	dao.update(sub, content, num);
%>