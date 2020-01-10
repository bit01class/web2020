package com.bit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/down")
public class DownloadController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String path=req.getRealPath("/upload");
		String fileName=req.getParameter("file");
		String origin=req.getParameter("origin");
		File file=new File(path+"\\"+fileName);
		InputStream in=null;
		OutputStream os=null;
		resp.setHeader("Content-Disposition", "attachment; filename="+origin); 
		//https://developer.mozilla.org/ko/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Complete_list_of_MIME_types
		resp.setContentType("application/octet-stream");
		try{
			in=new FileInputStream(file);
			os=resp.getOutputStream();
			int su=-1;
			while((su=in.read())!=-1){
				os.write(su);
			}
			os.flush();
		}finally{
			if(in!=null)in.close();
			if(os!=null)os.close();
		}
	}
}



























