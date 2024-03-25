package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

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
	
	public boolean 가입여부(String uid) throws ClassNotFoundException, SQLException, NamingException {
		
		// open();
		
		try {
			String sql = "SELECT id FROM user WHERE id=?";
			
			conn = ConnectionPool.get();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
	
			rs = psmt.executeQuery();
			
			return rs.next(); // 레코드셋이 존재하는가?
		}finally {
			close();
		}
	}
	
	
	public boolean 회원삭제(String uid) throws ClassNotFoundException, SQLException, NamingException {
		
		// open();
		
		try {
			String sql = "DELETE FROM user WHERE id=?";
			
			conn = ConnectionPool.get();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
	
			int count = psmt.executeUpdate();
			
			close();
			
			return count==1 ? true:false;
			
		}finally {
			close();
		}
	}

	
	public int login(String uid, String upass) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT id, password FROM user WHERE id = ?";
            
            // DB연결
            conn = ConnectionPool.get();
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            rs = stmt.executeQuery();
            if (!rs.next()) return 1; // id가 존재하지 않음
            
            // 입력한 암호와 DB암호를 비교한다.
            if (!upass.equals(rs.getString("password"))) // 비밀번호가 불일치한 경우
            	return 2; 

            return 0; // 정상 로그인
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
}
