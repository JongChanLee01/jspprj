<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("id");
	String ucon = request.getParameter("content");

	String sql = "INSERT INTO feed(id, content) VALUES(?, ?)";

	Class.forName("com.mysql.cj.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";
	String dbID = "root";
	String dbPW = "1234";

	Connection conn = DriverManager.getConnection(url, dbID, dbPW);

	PreparedStatement stmt = conn.prepareStatement(sql);

	stmt.setString(1, uid);
	stmt.setString(2, ucon);

	int count = stmt.executeUpdate();

	if (count == 1) {
		out.print("작성 글의 업로드가 완료되었습니다.");
	} else {
		out.print("작성 글의 업로드 중 오류가 발생하었습니다.");
	}

	stmt.close();
	conn.close();
	%>
</body>
</html>