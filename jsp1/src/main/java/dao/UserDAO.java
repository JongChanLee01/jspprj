package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
	public boolean insert(String uid, String upass, String uname) throws SQLException, ClassNotFoundException {
		String url = "jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url,"root", "1234");
		
	
		String sql = "INSERT INTO user(id,password,name,ts) values( ?, ?, ?, now())";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, uid);
		psmt.setString(2, upass);
		psmt.setString(3, uname);

		int count = psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		return count==1 ? true:false;
		
	}

}
