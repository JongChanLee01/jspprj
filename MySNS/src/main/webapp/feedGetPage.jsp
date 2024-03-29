<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%
String limit = request.getParameter("limit");
out.print((new FeedDAO()).getPage(limit));
%>