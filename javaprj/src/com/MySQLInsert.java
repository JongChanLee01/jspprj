package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.Date;

public class MySQLInsert {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
	
		String id = "a12@daum.net";
		String pass = "12345";
		String name = "당근";
//		String date = "2022-01-01";
//		Date date = new Date();
//		java.util.Date date = new java.util.Date();
//		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		
		String url = "jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";
		
		// date가 ts인 이유는 db에 ts로됨
//		String sql = "INSERT INTO user(id,password,name,ts) values( ?, ?, ?, ?)";
		String sql = "INSERT INTO user(id,password,name,ts) values( ?, ?, ?, now())";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,"root", "1234");
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, id);
		st.setString(2, pass);
		st.setString(3, name);
		//25번줄을 now()로 바꾸면 18 19번줄과 37번 줄을 따로 안써주어도 됨
//		st.setString(4, date);
//		st.setDate(4,  sqlDate);
		
		int result=st.executeUpdate(); // 삽입한 레코드 개수
		System.out.println(result);
		
		st.close();
		con.close();
	}

}
