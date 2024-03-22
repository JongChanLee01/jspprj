package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.Date;

public class MySQLDelete {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		String id = "admin1@daum.net";
		
		String url = "jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";
		String sql = "DELETE from user where ID=?";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,"root", "1234");
		
		System.out.print(sql);
		
		PreparedStatement psmt = con.prepareStatement(sql);
		
		psmt.setString(1, id);
		
		int result=psmt.executeUpdate(); // 삽입한 레코드 개수
		System.out.println(result);
		
		psmt.close();
		con.close();
	}

}
