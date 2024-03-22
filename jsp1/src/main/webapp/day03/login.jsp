<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	Date now = new Date();
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	String date = df.format(now);
	
	if (date.endsWith("12")) {
		response.sendRedirect("underCheck.jsp");
		return;
	}
	
	String uid = request.getParameter("id");
	if(uid==null){
		out.print("로그인 정보가 없습니다.");
	}else{
		session.setAttribute("id",uid);
		response.sendRedirect("main.jsp");
	}
	
	/* String res = "<h3>사용자 아이디: " + uid + "</h3>";
	res += "<br>로그인 시간: " + now.toString();
	out.print(res); */
%>
<%@ include file = "visitCount.jsp"%>
