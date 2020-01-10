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
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

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
		req.setCharacterEncoding("utf-8");
		String path=req.getRealPath("/upload");
		System.out.println(path);
		// 1byte=1;
		// 1kb=1024;
		// 1mb=1024*1024;
		// 10mb=1024*1024*10;
		int maxSize=1024*1024*10;
		MultipartRequest mr = null;
		FileRenamePolicy frp=new DefaultFileRenamePolicy();
		mr=new MultipartRequest(req, path,maxSize,"utf-8",frp);
		
		
		String param1=mr.getParameter("sabun");
		String param2=mr.getParameter("name");
		
		int sabun=Integer.parseInt(param1);
		String name=param2.trim();
		String file=mr.getFilesystemName("file1");
		String origin=mr.getOriginalFileName("file1");
		
		try {
			Emp05Dao dao=new Emp05Dao();
			dao.insertOne(sabun, name, file, origin);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		resp.sendRedirect("index.html");
	}
}




