package com.bit.web21;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JsonImgs extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String param=req.getParameter("startwith");
		System.out.println("param="+param);
		
		java.io.File file=new File("./../web21/WebContent/imgs");
		System.out.println(file.getCanonicalPath());
		System.out.println("존재하나?"+file.exists());
		if(file.exists()){
		
			resp.setContentType("application/json; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.print("{\"imgs\":[");
	//		out.print("{\"src\":\"/imgs/\",\"name\":\"img01.jpg\"}");
	//		out.print(",{\"src\":\"/imgs/\",\"name\":\"img02.jpg\"}");
	//		out.print(",{\"src\":\"/imgs/\",\"name\":\"img03.jpg\"}");
	//		out.print(",{\"src\":\"/imgs/\",\"name\":\"img04.jpg\"}");
	//		out.print(",{\"src\":\"/imgs/\",\"name\":\"img05.jpg\"}");
	//		out.print(",{\"src\":\"/imgs/\",\"name\":\"img06.jpg\"}");
			String[] list=file.list();
			int su=0;
			for(int i=0; i<list.length; i++){
				if(!list[i].startsWith(param)){su++;continue;}
				if(i!=su)out.print(',');
				out.print("{\"src\":\"/imgs/\",\"name\":\""+list[i]+"\"}");
			}
			out.print("]}");
			out.flush();
			out.close();
		}
	}
}










