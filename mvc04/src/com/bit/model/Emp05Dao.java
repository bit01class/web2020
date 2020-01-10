package com.bit.model;

import java.sql.*;
import java.util.ArrayList;

public class Emp05Dao {
	String driver="oracle.jdbc.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="scott";
	String password="tiger";
	PreparedStatement pstmt;
	ResultSet rs;
	
	public Emp05Dao() throws ClassNotFoundException {
		Class.forName(driver);
	}
	
	public void insertOne(int sabun, String name, String file) 
					throws SQLException{
		String sql="insert into emp05 values (?,?,?)";
		try(Connection conn=
				DriverManager.getConnection(url, user, password)){
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sabun);
			pstmt.setString(2, name);
			pstmt.setString(3, file);
			pstmt.executeUpdate();
		}
	}

	public ArrayList<Emp05Dto> selectAll() 
						throws SQLException{
		ArrayList<Emp05Dto> list=null;
		list=new ArrayList<Emp05Dto>();
		
		String sql="select * from emp05";
		try(Connection conn=
				DriverManager.getConnection(url, user, password)){
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Emp05Dto bean=new Emp05Dto();
				bean.setSabun(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setFile1(rs.getString(3));
				list.add(bean);
			}
		}
		return list;
	}
}













