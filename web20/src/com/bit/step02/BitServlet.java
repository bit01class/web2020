package com.bit.step02;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public abstract class BitServlet implements Servlet{
	ServletConfig config;

	public void destroy() {}
	public ServletConfig getServletConfig() {return config;}
	public String getServletInfo() {return "";}
	public void init(ServletConfig arg0) throws ServletException {
		config=arg0;
	}

	@Override
	public abstract void service(ServletRequest req, ServletResponse res)
			throws ServletException, IOException;

}
