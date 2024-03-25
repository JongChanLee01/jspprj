<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>DAO�� ����ϰ� ���ǿ� ����</h3>
	<%
	request.setCharacterEncoding("UTF-8");
	// ������ ������Ʈ���� String���� �ٲ����
	String uid = (String) session.getAttribute("id");
	if (uid == null) {
		response.sendRedirect("login.html");
		return;
	}
	session.setAttribute("id", uid);

	ArrayList<FeedObj> feeds = (new FeedDAO()).getList();

	String str = "";
	str += "<table align=center>";
	str += "<tr height=40><td><b>�ۼ��� ����Ʈ</b></td>";
	str += "<td align=right>";
	str += "<a href='feedAdd.html'><button>�۾���</button></a>";
	str += "<a href='logout.jsp'><button>�α׾ƿ�</button></a>";
	str += "</td></tr>";

	for (FeedObj feed : feeds) {
		str += "<tr><td colspan=2><hr></td></tr>";
		str += "<tr>";
		str += "<td><small>" + feed.getId() + "</small></td>";
		str += "<td><small>&nbsp;(" + feed.getTs() + ")</small></td>";
		str += "</tr>";
		str += "<tr><td colspan=2>" + feed.getContent() + "</td></tr>";
	}
	str += "</table>";
	out.print(str);
	%>
</body>
</html>