package com.bit.web21;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class XmlImgs extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		java.io.File files=new File("C:\\web\\web21\\WebContent\\imgs");
		System.out.println("존재하나?"+files.exists());
		System.out.println("폴더인지?"+files.isDirectory());
		System.out.println("파일인지?"+files.isFile());
		if(files.isDirectory()){
			String[] eles=files.list();
			resp.setContentType("application/xml; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			out.println("<imgs>");
			for(int i=0; i<eles.length; i++){
				if(eles[i].startsWith("big")){
				out.println("	<img>");
				out.println("		<src>/imgs/</src>");
				out.println("		<name>"+eles[i]+"</name>");
				out.println("	</img>");
				}
			}
			out.println("</imgs>");
			out.flush();
			out.close();
		}
	}
}










