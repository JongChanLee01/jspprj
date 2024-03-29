package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class BoardDAO {
	Connection conn;// 데이터베이스에 접근할수 있도록 설정
	PreparedStatement pstmt;// 데이터 베이스에서 쿼리를 실행시켜주는 객체
	ResultSet rs; // 데이터 베이스의 테이블의 결과를 리턴 받아 자바에 저장해 주는 객체

	public void insertBoard(BoardBean bean) throws SQLException, ClassNotFoundException {

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ajax?serverTimezone=UTC", "root", "1234");

		// 실제로 게시글 전체값을 테이블에 저장
		String SQL = "INSERT INTO BOARD VALUES (null,?,?,?,CURRENT_TIMESTAMP,?)";
		pstmt = conn.prepareStatement(SQL);

		// pstmt.setInt(1, bean.getNum());
		pstmt.setString(1, bean.getWriter());
		pstmt.setString(2, bean.getEmail());
		pstmt.setString(3, bean.getSubject());
		pstmt.setString(4, bean.getContent());

		System.out.print("getnum : " + bean.getNum());
		// 쿼리를 실행하시오
		int count = pstmt.executeUpdate();
		System.out.print(count);
		// 자원 반납
	}

// 모든 게시글을 리턴해 주는 리소스
	public Vector<BoardBean> getAllBoard(int start, int end) throws ClassNotFoundException, SQLException {
		// 리턴할 객체 선언
		Vector<BoardBean> v = new Vector<>();

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ajax?serverTimezone=UTC", "root", "1234");
		try {
			// 쿼리 준비
			String SQL = "select * from board where num >= ? and num <= ? order by reg_date desc";

			// 쿼리실행 객체
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			// 쿼리를 실행후 결과를 저장
			rs = pstmt.executeQuery();

			// 데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
			while (rs.next()) {
				// 데이터를 패키징(가방 = Boardbean클래스를 이용)해줌
				BoardBean bean = new BoardBean();

				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setReg_date(rs.getDate(5).toString());
				bean.setContent(rs.getString(6));

				// 패키징한 데이터를 벡터에 저장
				v.add(bean);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}

	public int getAllCount() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ajax?serverTimezone=UTC", "root", "1234");

		// 게시글 전체수를 저장하는 변수
		int count = 0;
		try {
			// 쿼리 준비
			String sql = "select count(*) from board";
			// 쿼리 실행할 객체 선언
			pstmt = conn.prepareStatement(sql);
			// 쿼리 실행후 결과를 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}

			// 자원 반납
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}// getAll
}// end
