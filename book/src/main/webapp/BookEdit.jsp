<%@page import="book.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*, book.*"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="book" class="book.Book" />
<jsp:setProperty property="*" name="book" />

<%
String errorMessage = null;
if (request.getMethod().equals("GET")) {
	book = BookDAO.findById(book.getId());
	pageContext.setAttribute("book", book);
} else if (request.getMethod().equals("POST")) {
	String cmd = request.getParameter("cmd");
	if ("update".equals(cmd))
		errorMessage = BookService.update(book);
	else if ("delete".equals(cmd))
		errorMessage = BookService.delete(book.getId());
	if (errorMessage == null) {
		response.sendRedirect("bookList.jsp");
		return;
	}
}
List<Category> categorys = CategoryDAO.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="./res/common.css" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	crossorigin="anonymous"></script>
<script src="./res/common.js"></script>
<script src="https://kit.fontawesome.com/68abb170e0.js"
	crossorigin="anonymous"></script>

<style>
form {
	padding: 10px 40px 40px 40px;
	width: 400px;
}

label {
	display: inline-block;
	width: 60px;
	text-align: right;
	margin-right: 4px;
}

form div {
	margin-top: 20px;
}

input[name=year] {
	width: 60px;
}
</style>
</head>
<body>
	<div class="container">
		<form method="post" class="shadow">
			<h1>책 수정</h1>
			<div>
				<label>제목</label> <input type="text" name="title"
					value="${ book.title }" required />
			</div>
			<div>
				<label>저자</label> <input type="text" name="author"
					value="${ book.author }" required />
			</div>
			<div>
				<label>카테고리</label> <select name="categoryId" required>
					<option value="">카테고리를 선택하세요</option>
					<%
					for (Category category : categorys) {
					%>

					<%
					int id = category.getId();
					%>

					<%
					String cname = category.getCategoryName();
					%>
					<option value="<%=id%>"
						<%=id == book.getCategoryId() ? "selected" : ""%>>
						<%=cname%>
					</option>
					<%
					}
					%>
				</select>
			</div>
			<div>
				<label>가격</label> <input type="text" name="price"
					value="${ book.price }" required pattern="[0-9]+"
					title="가격은 0 이상 정수입니다." />
			</div>
			<div>
				<label>출판사</label> <input type="text" name="publisher"
					value="${ book.publisher }" required />
			</div>
			<div>
				<button type="submit" class="btn" name="cmd" value="update">
					<i class="fas fa-check"></i> 저장
				</button>
				<button type="submit" class="btn" name="cmd" value="delete"
					data-confirm-delete>
					<i class="fas fa-trash-alt"></i> 삭제
				</button>
				<a class="btn" href="bookList.jsp"><i class="fas fa-ban"></i> 취소</a>
			</div>
			<%
			if (errorMessage != null) {
			%>
			<div class="error"><%=errorMessage%></div>
			<%
			}
			%>
		</form>
	</div>
</body>
</html>