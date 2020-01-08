package com.bit.mvc02.emp.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Emp02Dao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public Emp02Dao(String driver,String url,String user,String password) throws ClassNotFoundException, SQLException {
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
	}
	
	public List<Emp02Dto> selectAll() throws SQLException{
		List<Emp02Dto> list=null;
		list=new ArrayList<Emp02Dto>();
		
		String sql="select * from emp02 order by sabun";
		
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
				list.add(new Emp02Dto(
						rs.getInt("sabun")
						,rs.getString("name")
						,rs.getDate("nalja")
						,rs.getInt("deptno")
						));
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}
}
















