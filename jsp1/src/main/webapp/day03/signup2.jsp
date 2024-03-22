<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    
    String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	String uname = request.getParameter("name");

	// DB연결
	String url = "jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";
	//String sql = "INSERT INTO user(id,password,name,ts) values";
	//sql += "('"+uid+ "','"+upass+"','"+uname+"', now())";
	String sql = "INSERT INTO user(id,password,name,ts) values( ?, ?, ?, now())";
	
	System.out.print(sql);
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url,"root", "1234");
	
	PreparedStatement psmt = conn.prepareStatement(sql);
	
	psmt.setString(1, uid);
	psmt.setString(2, upass);
	psmt.setString(3, uname);
	
	//Statement stmt = conn.createStatement();
	
	//int count=stmt.executeUpdate(sql); // 삽입한 레코드 개수
	int count=psmt.executeUpdate(); // 삽입한 레코드 개수
	if(count==1){
		out.print("회원 가입이 완료되었습니다.");
	}else{
		out.print("오류가 발생하였습니다.");
	}
	
	//stmt.close();
	psmt.close();
	conn.close();
    %>