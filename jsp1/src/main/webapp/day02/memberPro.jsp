<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="member" class="com.MemberBean" scope="request" />
	
	<jsp:setProperty name="member" property="id" value="1234" />	
	<jsp:setProperty name="member" property="name" value="이순신" />
	
	<p> 아이디:<% out.print(member.getId()); %></p>
	<p> 이  름:<% out.print(member.getName()); %></p>
	
	<p> 아이디:<%= request.getParameter("id") %></p>
	<p> 이  름:<%= request.getParameter("name") %></p>
	
	<p> 아이디:<jsp:getProperty name="member" property="id"/></p>
	<p> 이  름:<jsp:getProperty name="member" property="name"/></p>
	
	<%
	String id=request.getParameter("id");
	member.setId(Integer.parseInt(id));
	%>
	<%= member.getId() %>
	
	<%
	String name=request.getParameter("name");
	member.setName(name);
	%>
	<%= member.getName() %>
	
</body>
</html>