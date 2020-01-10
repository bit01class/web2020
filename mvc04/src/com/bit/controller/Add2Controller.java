package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.Emp06Dao;

@WebServlet("/add2.html")
public class Add2Controller extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd=null;
		rd=req.getRequestDispatcher("add2.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name=req.getParameter("name");
		int cnt=Integer.parseInt(req.getParameter("cnt"));
		try {
			Emp06Dao dao = new Emp06Dao();
			dao.insertOne(name,cnt);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		resp.sendRedirect("add2.html");
	}
}










