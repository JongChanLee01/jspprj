<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>include 액션 태그 - first.jsp</h2>
<hr/>
<jsp:include page="second.jsp">
	<jsp:param name="id" value="admin" />
	<jsp:param name="name" value="mike" />
	<jsp:param name="address" value='<%=java.net.URLEncoder.encode("서울") %>' />
	<jsp:param name="title" value='<%=java.net.URLEncoder.encode("오늘의 날짜와 시각") %>'/>
	<jsp:param name="date" value='<%=java.util.Calendar.getInstance().getTime() %>'/>	
</jsp:include>


</body>
</html>