<%@page import="dao.UserDAO"%>
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
	
	UserDAO dao = new UserDAO();
	
	if(dao.���Կ���(uid)==false){
		out.print("ȸ�������� ã�� �� �����ϴ�.");
		return;
	}
	
	if(dao.ȸ������(uid)){
		out.print("ȸ��Ż�� �Ϸ�Ǿ����ϴ�.");
	}else{
		out.print("ȸ��Ż�� �� ������ �߻��Ͼ����ϴ�.");
	}

	%>
</body>
</html>