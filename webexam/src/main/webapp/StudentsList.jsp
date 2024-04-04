<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

		<h1>학생 정보 조회</h1>

		<table class="table table-bordered table-condensed">
			<thead>
				<tr>
					<th>id</th>
					<th>이름</th>
					<th>대학</th>
					<th>생일</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${students}" var="s">
					<tr>
						<td>${s.id}</td>
						<td>${s.username}</td>
						<td>${s.univ}</td>
						<td>${s.birth}</td>
						<td>${s.email}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>