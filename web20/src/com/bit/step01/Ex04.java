package com.bit.step01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Ex04 implements Servlet{
	ServletConfig config;
	public void destroy() {}
	public ServletConfig getServletConfig() {return config;}
	public String getServletInfo() {return "";}
	public void init(ServletConfig config) throws ServletException {
		this.config=config;
	}
	public void service(ServletRequest req, ServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html; charset=utf-8"); 
//		res.setContentType("text/xml; charset=utf-8"); 
//		res.setContentType("application/xml; charset=utf-8"); 
		PrintWriter out = res.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html><head><meta charset=\"utf-8\"></head><body><h1>");
		out.println(new String("한글".getBytes()));
		out.println("</h1><form action='ex05.html' method='post'>");
		out.println("id<input type='text' name='id'/>");
		out.println("<button>전송</button>");
		out.println("</form>");
		out.println("</body></html>");
		out.flush();
		out.close();
	}

}
