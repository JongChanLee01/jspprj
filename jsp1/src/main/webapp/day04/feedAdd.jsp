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
		out.print("�ۼ� ���� ���ε尡 �Ϸ�Ǿ����ϴ�.");
	} else {
		out.print("�ۼ� ���� ���ε� �� ������ �߻��Ͼ����ϴ�.");
	}

	stmt.close();
	conn.close();
	%>
</body>
</html>