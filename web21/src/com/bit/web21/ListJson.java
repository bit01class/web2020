package com.bit.web21;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListJson extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/json; charset=utf-8"); 
		PrintWriter out = resp.getWriter();
		out.print("{\"list\":[");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		String sql="SELECT * FROM BBS01 ORDER BY NUM DESC";
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try(Connection conn=DriverManager.getConnection(
									url, user, password)){
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			boolean start=true;
			while(rs.next()){
//				out.print("{\"num\":,\"sub\":\"\",\"id\":\"\",\"nalja\":\"\"}")
				if(start)start=false;
				else out.print(',');
				out.print("{\"num\":");
				out.print(rs.getInt("num"));
				out.print(",\"sub\":\"");
				out.print(rs.getString("sub"));
				out.print("\",\"id\":\"");
				out.print(rs.getString("id"));
				out.print("\",\"nalja\":\"");
				out.print(rs.getDate("nalja"));
				out.print("\"}");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		out.print("]}");
		out.flush();
		out.close();
	}
}













