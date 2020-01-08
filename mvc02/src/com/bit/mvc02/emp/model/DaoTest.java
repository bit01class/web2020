package com.bit.mvc02.emp.model;

import java.sql.SQLException;
import java.util.List;

public class DaoTest {

	public static void main(String[] args) {
		String driver="oracle.jdbc.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		Emp02Dao dao=null;
		try {
			dao=new Emp02Dao(driver, url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		System.out.println("dao객체 생성 ok?"+(dao!=null));
		System.out.println("connection ok?"+(dao.conn!=null));
		try {
			List<Emp02Dto> list = dao.selectAll();
//			for(Emp02Dto bean : list){
//				System.out.println(bean);
//			}
			System.out.println("selectAll 정상?"+(list.size()==4));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}













