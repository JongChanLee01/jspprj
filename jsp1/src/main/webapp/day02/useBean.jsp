<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="member" class="com.MemberBean">
</jsp:useBean>
<jsp:setProperty property="id" name="member" value="1234" />
<jsp:setProperty property="name" name="member" value="홍길동" />

<p>아이디:<%=member.getId() %></p>
<p>이  름:<%=member.getName() %></p>

<jsp:useBean id="date" class="java.util.Date" />
<p>
<% out.print("오늘 날짜 및 시각은? "); %>
</p>
<p> <%=date %></p>

<jsp:useBean id="cal" class="com.Calculator" scope="request">
</jsp:useBean>
<%
	int m = cal.calc(5);
	out.print("5의 세제곱 : "+m);
%>
<br/>
<%
	member.setId(7777);
	member.setName("강감찬");
%>
<%=member.getId() %>
<%=member.getName() %>
</body>
</html>