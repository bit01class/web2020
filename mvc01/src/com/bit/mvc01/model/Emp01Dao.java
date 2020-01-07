package com.bit.mvc01.model;

import java.sql.Connection;
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
	
	public void insertone(String name,int pay,String etc){
		String sql="insert into emp01 values ";
		sql+=" (emp01_seq.nextval,?,sysdate,?,?)";
		Connection conn=MyOracle.getConnection();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, pay);
			pstmt.setString(3, etc);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public Emp01Dto selectOne(int sabun){
		String sql="select * from emp01 where sabun=?";
		Emp01Dto bean=new Emp01Dto();
		Connection conn=MyOracle.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sabun);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setSabun(rs.getInt("sabun"));
				bean.setName(rs.getString("name"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setPay(rs.getInt("pay"));
				bean.setEtc(rs.getString("etc"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return bean;
	}
	
	public int updateOne(int sabun,String name,int pay,String etc){
		String sql="update emp01 set name=?,pay=?,etc=? where sabun=?";
		int result=0;
		Connection conn=MyOracle.getConnection();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, pay);
			pstmt.setString(3, etc);
			pstmt.setInt(4, sabun);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int deleteOne(int sabun){
		String sql="delete from emp01 where sabun=?";
		int result=0;
		
		Connection conn=MyOracle.getConnection();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sabun);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public Emp01Dto login(int sabun,String name){
		Emp01Dto bean=new Emp01Dto();
		String sql="select count(sabun) as \"cnt\"";
		sql+=",max(sabun) as \"id\"";
		sql+=",max(name) as \"pw\" ";
		sql+=" from emp01 where sabun=? and name=?";
		
		Connection conn=MyOracle.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sabun);
			pstmt.setString(2, name);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setSabun(rs.getInt("id"));
				bean.setName(rs.getString("pw"));
				bean.setCnt(rs.getInt("cnt"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bean;
	}
}

















