package com.bit.mvc02.dept.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Dept02Dao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public Dept02Dao(String driver,String url,String user
			,String password) throws SQLException, ClassNotFoundException {
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
	}

	public ArrayList<Dept02Dto> selectAll() throws SQLException{
		ArrayList<Dept02Dto> list=null;
		list=new ArrayList<Dept02Dto>();
		
		String sql="select * from dept02 order by deptno";
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Dept02Dto bean=new Dept02Dto();
				bean.setDeptno(rs.getInt("deptno"));
				bean.setDname(rs.getString("dname"));
				bean.setLoc(rs.getString("loc"));
				list.add(bean);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}
	
	public void insertOne(String dname,String loc) throws SQLException{
		String sql="insert into dept02 values (dept02_seq.nextval,?,?)";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dname);
			pstmt.setString(2, loc);
			pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
	
	public void deleteOne(int deptno) throws SQLException{
		String sql="delete from dept02 where deptno=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			pstmt.executeUpdate();
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
}











