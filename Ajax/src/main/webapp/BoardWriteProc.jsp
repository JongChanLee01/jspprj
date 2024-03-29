<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="boardbean" class="board.BoardBean">
		<jsp:setProperty name="boardbean" property="*" />
	</jsp:useBean>

	<%
	BoardDAO bdao = new BoardDAO();
	bdao.insertBoard(boardbean);
	response.sendRedirect("BoardList.jsp");
	%>
</body>
</html>