package com.bit.web08;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class Bbs01Dao {
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;

	public static ArrayList<Bbs01Dto> list(){
		ArrayList<Bbs01Dto> list=new ArrayList<Bbs01Dto>();
		String sql="select * from bbs01 order by num desc";
		
		try {
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				Bbs01Dto bean=new Bbs01Dto();
				bean.setNum(rs.getInt("num"));
				bean.setSub(rs.getString("sub"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setCnt(rs.getInt("cnt"));
				list.add(bean);
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
	
		return list;
	}
	
	public static void insert(Bbs01Dto bean){
		String sql="insert into bbs01 values "
				+" (bbs01_seq.nextval,?,null,?,sysdate,0)";
		
		try {
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bean.getSub());
			pstmt.setString(2, bean.getContent());
			pstmt.executeUpdate();
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
		
	}
	
	public static Bbs01Dto detail(int num){
		String sql="select * from bbs01 where num=?";
		Bbs01Dto bean=new Bbs01Dto();
		
		try {
			conn=MyOracle.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setNum(rs.getInt("num"));
				bean.setSub(rs.getString("sub"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setCnt(rs.getInt("cnt"));
				bean.setContent(rs.getString("content"));
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


















