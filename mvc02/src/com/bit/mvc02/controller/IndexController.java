package com.bit.mvc02.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd=null;
		rd=req.getRequestDispatcher("/index.jsp");
		rd.forward(req, resp);
		
		
//		resp.sendRedirect("/index.jsp");
	}
}








