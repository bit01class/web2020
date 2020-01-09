package com.bit.mvc03.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Emp04Dao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public Emp04Dao() {
		try {
			InitialContext init = new InitialContext();
			
			javax.naming.Context context=null;
			context=(Context) init.lookup("java:/comp/env");
			
			javax.sql.DataSource dataSource=null;
			dataSource=(DataSource) context.lookup("jdbc/oracle");
			
			conn=dataSource.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public List<Emp04Dto> selectAll() throws SQLException{
		List<Emp04Dto> list=new ArrayList();
		String sql="select * from emp04 order by sabun";
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Emp04Dto bean=new Emp04Dto();
				bean.setSabun(rs.getInt("sabun"));
				bean.setName(rs.getString("name"));
				bean.setNalja(rs.getString("nalja"));
				bean.setPay(rs.getInt("pay"));
				list.add(bean);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}
}














