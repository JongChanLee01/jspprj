<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>include �׼� �±� - first.jsp</h2>
<hr/>
<jsp:include page="second.jsp">
	<jsp:param name="id" value="admin" />
	<jsp:param name="name" value="mike" />
	<jsp:param name="address" value='<%=java.net.URLEncoder.encode("����") %>' />
	<jsp:param name="title" value='<%=java.net.URLEncoder.encode("������ ��¥�� �ð�") %>'/>
	<jsp:param name="date" value='<%=java.util.Calendar.getInstance().getTime() %>'/>	
</jsp:include>


</body>
</html>