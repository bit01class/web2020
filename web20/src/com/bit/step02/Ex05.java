package com.bit.step02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



//public class Ex05 extends BitServlet {
public class Ex05 extends GenericServlet{
	
	public void doGet(HttpServletRequest request
					,HttpServletResponse response) throws IOException{
		System.out.println("GET");
		PrintWriter out = response.getWriter();
		out.println("<h1>method GET page</h1>");
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request
					,HttpServletResponse response) throws IOException{
		System.out.println("POST");
		PrintWriter out = response.getWriter();
		out.println("<h1>method POST page</h1>");
		out.flush();
		out.close();
	}

	@Override
	public void service(ServletRequest req, ServletResponse res)
			throws ServletException, IOException {
		HttpServletRequest request = null;
		HttpServletResponse response = null;
		request = ((HttpServletRequest)req);
		response = ((HttpServletResponse)res);
		String method=request.getMethod();
		if(method.equals("GET")){
			doGet(request,response);
		}else if(method.equals("POST")){
			doPost(request,response);
		}
//		PrintWriter out = res.getWriter();
//		out.println("<h1>ex05 page</h1>");
//		out.println("method:"+method);
//		out.flush();
//		out.close();
	}

}
