<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
    table { border-collapse: collapse; }
    td { padding: 5px; border: solid 1px gray; }
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<h2>메인 페이지 입니다.</h2>
<%@ include file="footer.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:out value="JSTL 태그 라이브러리입니다."/>

<%= "jstl 태그 라이브러리입니다." %>
<br/>
<c:forEach var="k" begin="1" end="5" step="1">
	<c:out value="${k}" />
</c:forEach>
<br/>
<%
	for(int i=1;i<5; i++){
		out.println("Java Server "+i+"</br>");
	}
%>

<%
	for(int i=8; i<=30; i+=2){
		out.println("<div style='font-size: "+i+"pt;'>");
		out.println(" 	안녕 JSP! "+i+"pt");
		out.println("</div>");
	}
%>
<br/>
<%
    String s1 = "hello world";
    String s2 = " JSP!";
%>

<table>
    <tr>
        <td><% out.print(s1); %></td>
        <td><%= s1 %></td>
    </tr>
    <tr>
        <td><% out.print(s1.toUpperCase()); %></td>
        <td><%= s1.toUpperCase() %></td>
    </tr>
    <tr>
        <td><% out.print(Math.PI); %></td>
        <td><%= Math.PI %></td>
    </tr>
    <tr>
        <td><% out.print(s1 + s2); %></td>
        <td><%= s1 + s2 %></td>
    </tr>
</table>

<%
	Date today = new Date();
	SimpleDateFormat f1 = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
	String str1 = f1.format(today);
	
	SimpleDateFormat f2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String str2 = f2.format(today);
	
	SimpleDateFormat f3 = new SimpleDateFormat("yy-M-d a H:m:s");
	String str3 = f3.format(today);
%>
<h1>날짜 출력</h1>

<div>
    <%= str1 %>
</div>
<div>
    <%= str2 %>
</div>
<div>
    <%= str3 %>
</div>


</body>
</html>