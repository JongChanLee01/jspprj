<%@page import="dao.UserDAO"%>
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
	
	UserDAO dao = new UserDAO();
	
	if(dao.insert(uid, upass, uname)){
		out.print("회원 가입이 완료되었습니다.");
	}else{
		out.print("오류가 발생하였습니다. ");
	}
    %>