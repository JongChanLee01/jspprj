<%@ page import="java.util.Enumeration" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String uid = request.getParameter("id");
String res = "<h3> User ID : "+uid+"</h3>";

// out.print(res);

Enumeration<String> en = request.getHeaderNames();

while(en.hasMoreElements()){
	String name = en.nextElement();
	String value = request.getHeader(name);
	out.print(name+":"+value+"<br/>");
}
%>