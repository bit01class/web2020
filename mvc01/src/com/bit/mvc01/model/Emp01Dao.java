package com.bit.mvc01.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.mvc01.utils.MyOracle;

public class Emp01Dao {

	public ArrayList<Emp01Dto> selectAll(){
		String sql="SELECT * FROM EMP01";
		ArrayList<Emp01Dto> list=null;
		list=new ArrayList<Emp01Dto>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=MyOracle.getConnection().prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Emp01Dto bean=new Emp01Dto();
				bean.setSabun(rs.getInt("sabun"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setName(rs.getString("name"));
				bean.setPay(rs.getInt("pay"));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(MyOracle.getConnection()!=null)
					MyOracle.getConnection().close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
}








