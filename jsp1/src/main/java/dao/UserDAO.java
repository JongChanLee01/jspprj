package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs=null;
	
	public void open() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,"root", "1234");
	}
	public void close() throws SQLException {
		rs.close();
		psmt.close();
		conn.close();
	}
	
	public boolean insert(String uid, String upass, String uname) throws SQLException, ClassNotFoundException {
		
		open();
	
		String sql = "INSERT INTO user(id,password,name,ts) values( ?, ?, ?, now())";
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, upass);
		psmt.setString(3, uname);

		int count = psmt.executeUpdate();
		
		close();
		
		return count==1 ? true:false;
		
	}
	
	public boolean 가입여부(String uid) throws ClassNotFoundException, SQLException {
		
		open();
		
		try {
			String sql = "SELECT id FROM user WHERE id=?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
	
			rs = psmt.executeQuery();
			
			return rs.next(); // 레코드셋이 존재하는가?
		}finally {
			close();
		}
	}

}
