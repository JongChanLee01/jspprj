<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%
	String str = "", line = "";
	str += "Content type: " + request.getContentType() + "<br>";
	str += "Content length: " + request.getContentLength() + "<br>";
	str += "<hr>";
	
	str += "ID: " + request.getParameter("id") + "<br>";
	str += "Content: " + request.getParameter("content") + "<br>";
	str += "Image: " + request.getParameter("image") + "<br>";
	str += "<hr>";
	
	
	// request.getInputStream() http요청 - 본문을 읽어오는 메소드
	InputStreamReader isr = new InputStreamReader(request.getInputStream(), "UTF-8");
	BufferedReader br = new BufferedReader(isr);
	
	while ((line = br.readLine()) != null) {
		str += line;
	}
	out.print(str);
%>