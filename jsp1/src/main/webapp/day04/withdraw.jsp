<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ��Ż�� - withdraw.jsp</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id");
	String sql = "DELETE FROM user WHERE id=?";

	// JDBC - �����ͺ��̽� ����
	String url = "jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";
	String dbID = "root";
	String dbPW = "1234";

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, dbID, dbPW);

	
	// ��������
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, uid);
	int count = stmt.executeUpdate();

	if (count == 1) {
		out.print("ȸ��Ż�� �Ϸ�Ǿ����ϴ�.");
	} else {
		out.print("ȸ��Ż�� �� ������ �߻��Ͼ����ϴ�.");
	}

	stmt.close();
	conn.close();
	%>
</body>
</html>