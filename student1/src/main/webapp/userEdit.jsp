<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="com.User" />
<jsp:setProperty property="*" name="user" />
<%
String errorMessage = null;
if (request.getMethod().equals("GET")) {
    user = UserDAO2.findById(user.getId());
    pageContext.setAttribute("user", user);    
} else if (request.getMethod().equals("POST")) {
    String cmd = request.getParameter("cmd");
    if ("update".equals(cmd))
        errorMessage = UserService.update(user);
    else if ("delete".equals(cmd))
        errorMessage = UserService.delete(user.getId());
    if (errorMessage == null) {
        response.sendRedirect("userList3.jsp");
        return;
    }
}
List<Department> departments = DepartmentDAO.findAll();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="./res/common.js"></script>
<link rel="stylesheet" href="./res/common.css"/>
<!-- <script src="https://kit.fontawesome.com/68abb170e0.js" crossorigin="anonymous"></script> -->
<style>
  form { padding: 10px 40px 40px 40px; width: 400px; }
  label { display: inline-block; width: 40px; text-align: right; margin-right: 4px; }
  form div { margin-top: 20px; }
  input[name=year] { width: 60px; }
</style>
</head>
<body>
	<div class="container">
		<form method="post" class="shadow">
		  <h1>사용자 수정</h1>
		  <div>
		    <label>학번 또는 아이디</label>
		    <input type="text" name="userid" value="${ user.userid }" required pattern="[0-9]+" />
		  </div>
		  <div>
		    <label>이름</label>
		    <input type="text" name="name" value="${ user.name }" required />
		  </div>
		  <div>
		    <label>학과</label>
		    <select name="departmentId" required>
		      <option value="">소속학과를 선택하세요</option>
		      <% for (Department department : departments) { %>
		        <% int id = department.getId(); %>
		        <% String dname = department.getDepartmentName(); %>
		        <option value="<%= id %>" <%= id == user.getDepartmentId() ? "selected" : "" %>>
		          <%= dname %>
		        </option>
		      <% } %>
		    </select>
		  </div>
		  <div>
		    <label>이메일</label>
		    <input type="text" name="email" value="${ user.email }" required title="이메일형식으로 작성해주세요." />
		  </div>
		  <div>
		    <button type="submit" class="btn" name="cmd" value="update">
		      <i class="fas fa-check"></i> 저장</button>
		    <button type="submit" class="btn" name="cmd" value="delete" data-confirm-delete>
		      <i class="fas fa-trash-alt"></i> 삭제</button>
		    <a class="btn" href="userList3.jsp"><i class="fas fa-ban"></i> 취소</a>
		  </div>
		  <% if (errorMessage != null) { %>
		    <div class="error"><%= errorMessage %></div>
		  <% } %>
		</form>
	</div>
</body>
</html>