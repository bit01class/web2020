package com.bit.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Emp06Dao {

	String driver="oracle.jdbc.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="scott";
	String password="tiger";
	PreparedStatement pstmt;
	ResultSet rs;
	
	public Emp06Dao() throws ClassNotFoundException {
		Class.forName(driver);
	}
	
	public void insertOne(String name,int cnt) throws SQLException{
		String sql="insert into emp06 values (emp06_seq.nextval,?,?)";
		String sql2="insert into emp06 values (emp06_seq.nextval,?,?)";
		Connection conn=null;
		try{
			conn=DriverManager.getConnection(url, user, password);
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, cnt);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(sql2);
			pstmt.setString(1, "copy");
			pstmt.setInt(2, cnt+1);
			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			conn.rollback();
		} finally{
			if(conn!=null)conn.close();
		}
	}
}







