package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MySQLTest {

	public static void main(String[] args) {
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ajax";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			String SQL = "SELECT * FROM USER WHERE userName LIKE ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "김세정");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String userName = rs.getString("userName");
				String userAge = rs.getString("userAge");
				String useGender = rs.getString("userGender");
				String usrEmail = rs.getString("userEmail");
				System.out.printf("%s, %s\n", userName, userAge);
				
				User user = new User();
				
				user.setUserName(rs.getString(1));
				user.setUserAge(rs.getInt(2));
				user.setUserGender(rs.getString(3));
				user.setUserEmail(rs.getString(4));
				System.out.printf("%s, %s %s %s", userName, userAge, useGender, usrEmail);
			}
			conn.close();
		} catch (Exception e) {
			
		}

	}

}
