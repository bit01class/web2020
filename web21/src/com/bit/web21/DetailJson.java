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

public class DetailJson extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		String sql="insert into bbs01 (num,sub,id,nalja,content)";
		sql+=" values (bbs01_seq.nextval,?,?,sysdate,?)";
		PreparedStatement pstmt=null;
		try(Connection conn=DriverManager.getConnection(
									url, user, password)){
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("sub"));
			pstmt.setString(2, req.getParameter("id"));
			pstmt.setString(3, req.getParameter("content"));
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}










