package com.bit.mvc03.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.mvc03.model.Emp04Dao;

@WebServlet("/emp/detail.html")
public class DetailController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int sabun=Integer.parseInt(req.getParameter("idx"));
		Emp04Dao dao=new Emp04Dao();
		try {
			req.setAttribute("bean", dao.selectOne(sabun));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd=null;
		rd=req.getRequestDispatcher("../detail.jsp");
		rd.forward(req, resp);
	}
}













