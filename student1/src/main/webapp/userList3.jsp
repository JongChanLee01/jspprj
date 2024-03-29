<%@page import="com.UserDAO2"%>
<%@page import="com.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String srchText = request.getParameter("srchText");
if (srchText == null) srchText = "";
List<User> list = UserDAO2.findByName(srchText);
List<User> list_all = UserDAO2.findAll();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="./res/common.js"></script>
<link rel="stylesheet" href="./res/common.css"/>

<style>
    div.container { width: 600px; margin: 50px auto; font-size: 10pt; }
    input { padding: 5px; font-size: 10pt; }
    button { margin: 10px ; padding: 0.4em 2em; }
    thead th { background-color: #eee; }
    table{ border-collapse: collapse; width: 100%; }
    td, th { padding: 4px; border: 1px solid lightgray; }
    td:nth-child(4) { text-align: center; }
</style>
</head>
<body>
	<div class="container">

		<h1>사용자 목록</h1>
		<a class="btn" href="userCreate.jsp">사용자등록</a>
		<form>
		  <label>이름</label>
		  <input type="text" name="srchText" value="<%= srchText %>" placeholder="검색조건" />
		  <button type="submit">조회</button>
		</form>

		<table class="table table-bordered table-condensed">
			<thead>
				<tr>
					<th>ID</th>
					<th>사용자아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>학과</th>
					<th>사용자유형</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="user" value="<%=list %>"/>
				<c:set var="all" value="<%= list_all %>" />
				
				<c:forEach items="${user}" var="u">
					<tr class="clickable" data-url="/student1/userEdit.jsp?id=${u.id}">
						<td>${u.id}</td>
						<td>${u.userid}</td>
						<td>${u.name}</td>
						<td>${u.email}</td>
						<td>${u.departmentName}</td>
						<td>${u.userType}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty list}">
					<tr><td colspan="6" style="text-align:center">조회된 데이터가 없습니다.</td></tr>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>