package com.bit.web21;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WeatherXml extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String addr="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1168051000";
		URL url=new URL(addr);
		URLConnection conn =null;
		InputStream is =null;
		OutputStream os=null;
		try{
			conn = url.openConnection();
			is = conn.getInputStream();
			os=resp.getOutputStream();
			int su=-1;
			while((su=is.read())!=-1)os.write(su);
		}finally{
			os.close();
			is.close();
		}
	}

}











