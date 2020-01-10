package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.Emp05Dao;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/add.html")
public class AddController extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd=null;
		rd=req.getRequestDispatcher("add.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		MultipartRequest mr = null;
		mr=new MultipartRequest(req, "C:\\web\\mvc04\\WebContent\\upload");
		
		
		String param1=mr.getParameter("sabun");
		String param2=mr.getParameter("name");
		String param3=mr.getFilesystemName("file1");
		
		int sabun=Integer.parseInt(param1);
		String name=param2.trim();
		String file=param3;
		
		try {
			Emp05Dao dao=new Emp05Dao();
			dao.insertOne(sabun, name, file);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect("index.html");
	}
}




