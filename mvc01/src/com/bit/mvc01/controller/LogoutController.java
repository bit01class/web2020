package com.bit.mvc01.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.ws.resources.HttpserverMessages;

public class LogoutController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd=null;
		rd=req.getRequestDispatcher("logout.jsp");
		rd.forward(req, resp);
		
		HttpSession session=req.getSession();
		System.out.println(session.getId());
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		//session.setAttribute("login", null);
		session.removeAttribute("login");
		//session.invalidate();//세션갱신
		resp.sendRedirect("login.html");
	}
}






