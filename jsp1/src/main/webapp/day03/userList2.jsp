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

	String str = "<table align=center>";
    str += "<tr><th colspan=3>가입자 리스트</th></tr>";
    while(rs.next()) {
        str += "<tr><td colspan=3><hr></td></tr>";
        str += "<tr>";
     str += "<td>" + rs.getString("id") + "</td>";
     str += "<td>" + rs.getString("name") + "</td>";
     str += "<td>&nbsp;(" + rs.getString("ts") + ")</td>";
        str += "</tr>";
    }
    str += "</table>";
    out.print(str);
	
	rs.close();
	st.close();
	con.close();
    %>
