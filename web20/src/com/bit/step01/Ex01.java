package com.bit.step01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Ex01 implements Servlet{
	ServletConfig config;

	@Override
	public void destroy() {System.out.println("WAS destroy...");}
	@Override
	public ServletConfig getServletConfig() {
		System.out.println("getConfig...");
		return config;}
	@Override
	public String getServletInfo() {
		System.out.println("info...");
		return "ver 1.0.0";}
	@Override
	public void init(ServletConfig arg0) throws ServletException {
		this.config=arg0;
		System.out.println("init...");
	}
	@Override
	public void service(ServletRequest arg0, ServletResponse resp)
			throws ServletException, IOException {
		System.out.println("service Ãâ·Â...");
		PrintWriter out = resp.getWriter();
		out.println("service print...");
		out.flush();
		out.close();
	}

}
