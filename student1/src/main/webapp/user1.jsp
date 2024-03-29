<%@page import="com.UserDAO2"%>
<%@page import="com.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String s = request.getParameter("id");
int id = Integer.parseInt(s);
User user = UserDAO2.findById(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div.container { width: 600px; margin: 50px auto; }
    body { font-family: 굴림체; }
    table { width: 500px;  border-collapse: collapse; }
    table td:nth-child(1) { background-color: #eee; }
    td { padding: 5px; border: 1px solid lightgray; }  
</style>
</head>
<body>
<div class="container">

<h1>사용자</h1>

<table>
  <tr>
    <td>ID</td>
    <td><%= user.getId() %></td>
  </tr>
  <tr>
    <td>사용자아이디</td>
    <td><%= user.getUserid() %></td>
  </tr>
  <tr>
    <td>이름</td>
    <td><%= user.getName() %></td>
  </tr>
  <tr>
    <td>이메일</td>
    <td><%= user.getEmail() %></td>
  </tr>
  <tr>
    <td>학과</td>
    <td><%= user.getDepartmentName() %></td>
  </tr>
  <tr>
    <td>사용자유형</td>
    <td><%= user.getUserType() %></td>
  </tr>
</table>

</div>
</body>
</html>