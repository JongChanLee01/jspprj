package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.Date;

public class MySQLUpdate {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
	
		String id = "admin1@daum.net";
		String pass = "123";
		String name = "키위2";
		
		String url = "jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";
		
		String sql = "UPDATE user set password=? ,name=?, ts=now() where id=?";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,"root", "1234");
		
		System.out.print(sql);
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, pass);
		st.setString(2, name);
		st.setString(3, id);
		
		int result=st.executeUpdate(); // 삽입한 레코드 개수
		System.out.println(result);
		
		st.close();
		con.close();
	}

}
