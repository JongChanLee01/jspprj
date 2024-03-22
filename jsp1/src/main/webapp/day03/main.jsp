<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%
    String uid=(String) session.getAttribute("id");
    if(uid==null){
    	out.print("로그인 정보가 없습니다.");
    }else{
    	out.print("메인페이지입니다. <br/>"+uid+"님 환영합니다.<br/>");
    	session.setAttribute("id",uid);
    }
    %>
<a href="logout.jsp">로그아웃</a>