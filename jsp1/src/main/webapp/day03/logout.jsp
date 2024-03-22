<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    session.invalidate();
    out.print("로그아웃 하였습니다.");
    %>
<a href="login.html">로그인</a>