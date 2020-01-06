package com.bit.web21;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex06 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String param=req.getParameter("callback");
		System.out.println(param);
		String msg=param
				+"({\"root\":[{\"id\":\"admin\",\"name\":\"°ü¸®ÀÚ\"}]})";
		System.out.println(msg);
		PrintWriter out = resp.getWriter();
		out.print(msg);
		out.flush();
		out.close();
	}
}
















