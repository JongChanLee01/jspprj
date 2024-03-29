<%@page import="com.Student"%>
<%@page import="com.StudentDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
List<Student> list = StudentDAO.findAll();
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

		<h1>학생목록</h1>

		<table class="table table-bordered table-condensed">
			<thead>
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>학과</th>
					<th>학년</th>
				</tr>
			</thead>
			<tbody>
				<%	for (Student student : list) {	%>
				<tr>
					<td><%=student.getStudentNumber()%></td>
					<td><%=student.getName()%></td>
					<td><%=student.getDepartmentName()%></td>
					<td><%=student.getYear()%></td>
				</tr>
				<%	}	%>
			</tbody>
		</table>
	</div>
</body>
</html>