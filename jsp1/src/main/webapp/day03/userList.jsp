<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
    
    <%
    String url = "jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC";
	String sql = "select * from user";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection(url,"root", "1234");
	
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);

	String str="";
	while(rs.next()) {
		str += rs.getString("id")+" ,"+ rs.getString("name")+", "+ rs.getString("password");
		str +="<br/>"; 
	}
	// System.out.println(str);
	out.print(str);
	
	rs.close();
	st.close();
	con.close();
    %>
