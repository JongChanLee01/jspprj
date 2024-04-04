package webexam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

	Connection conn = null;
	PreparedStatement pstmt;

	public List<Student> getAll() throws ClassNotFoundException, SQLException {
		String url = "jdbc:oracle:thin:@localhost:1521/orcl";
		String sql = "SELECT * FROM STUDENTS";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(url, "scott", "tiger");

		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		List<Student> students = new ArrayList<>();

		while (rs.next()) {
			Student s = new Student();
			s.setId(rs.getInt("id"));
			s.setUsername(rs.getString("username"));
			s.setUniv(rs.getString("univ"));
			s.setBirth(rs.getDate("birth"));
			s.setEmail(rs.getString("email"));

			students.add(s);
		}
		pstmt.close();
		conn.close();
		return students;
	}
}