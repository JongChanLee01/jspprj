<%@page import="com.UserDAO"%>
<%@page import="com.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
List<User> list = UserDAO.findAll();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.container {
	width: 600px;
	margin: 50px auto;
}

thead th {
	background-color: #eee;
}

table {
	border-collapse: collapse;
	width: 100%;
}

td, th {
	padding: 4px;
	border: 1px solid lightgray;
}

td:nth-child(4) {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">

		<h1>사용자 목록 - 서블렛</h1>

		<table class="table table-bordered table-condensed">
			<thead>
				<tr>
					<th>사용자아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>학과</th>
					<th>사용자유형</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="user" value="<%=list %>"/>
				<c:forEach items="${user}" var="u">
					<tr>
						<td>${u.userid}</td>
						<td>${u.name}</td>
						<td>${u.email}</td>
						<td>${u.departmentName}</td>
						<td>${u.userType}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>